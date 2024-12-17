from transformers import AutoTokenizer, AutoModelForSequenceClassification, Trainer, TrainingArguments
import torch
from datasets import Dataset, DatasetDict
import pandas as pd
import numpy as np
import os
from huggingface_hub import login

# 登录 HuggingFace
login(token="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", write_permission=True)

# 1. 准备数据
emotion_data = [
    {"text": "今天阳光明媚，我出去游玩了一整天，真是太开心啦！", "label": "快乐"},
    {"text": "我中了彩票，感觉自己像世界上最幸运的人，哈哈！", "label": "快乐"},
    {"text": "那个家伙太过分了，无缘无故对我大吼大叫，气死我了！", "label": "愤怒"},
    {"text": "上班又迟到了，还被老板狠狠批评了一顿，心里特别窝火。", "label": "愤怒"},
    {"text": "我养了多年的宠物狗狗去世了，心里空落落的，好难过。", "label": "悲伤"},
    {"text": "这次考试没考好，感觉自己的努力都白费了，心情特别低落。", "label": "悲伤"},
    # ... 其他数据 ...
]

# 2. 将标签转换为数字
label_dict = {"快乐": 0, "愤怒": 1, "悲伤": 2}
for item in emotion_data:
    item["label"] = label_dict[item["label"]]

# 3. 创建数据集
np.random.seed(42)
random_indices = np.random.permutation(len(emotion_data))
train_size = int(0.8 * len(emotion_data))

train_data = [emotion_data[i] for i in random_indices[:train_size]]
val_data = [emotion_data[i] for i in random_indices[train_size:]]

train_dataset = Dataset.from_list(train_data)
val_dataset = Dataset.from_list(val_data)

dataset = DatasetDict({
    'train': train_dataset,
    'validation': val_dataset
})

# 4. 模型和分词器
# 使用较小的中文模型
model_name = "hfl/chinese-bert-wwm-ext"  # 替换为另一个常用的中文预训练模型

try:
    # 尝试下载模型
    tokenizer = AutoTokenizer.from_pretrained(model_name, trust_remote_code=True)
    model = AutoModelForSequenceClassification.from_pretrained(
        model_name,
        num_labels=3,
        trust_remote_code=True
    )
except Exception as e:
    print(f"Error loading model: {e}")
    # 如果下载失败，可以尝试使用其他备选模型
    model_name = "bert-base-multilingual-cased"
    tokenizer = AutoTokenizer.from_pretrained(model_name)
    model = AutoModelForSequenceClassification.from_pretrained(model_name, num_labels=3)

# 5. 数据预处理
def tokenize_function(examples):
    tokenized = tokenizer(
        examples["text"],
        padding="max_length",
        truncation=True,
        max_length=128,
        return_tensors=None  # 移除 return_tensors="pt"
    )
    # 确保标签也是正确的格式
    tokenized["labels"] = examples["label"]
    return tokenized

# 修改数据集映射方式
tokenized_dataset = dataset.map(
    tokenize_function,
    batched=True,
    remove_columns=dataset["train"].column_names,
    load_from_cache_file=False
)

# 确保数据集格式正确
tokenized_dataset.set_format("torch")

# 6. 训练参数
training_args = TrainingArguments(
    output_dir="./results",
    num_train_epochs=3,
    per_device_train_batch_size=8,
    per_device_eval_batch_size=8,
    warmup_steps=500,
    weight_decay=0.01,
    logging_dir="./logs",
    logging_steps=10,
    evaluation_strategy="epoch",
    save_strategy="epoch",
    load_best_model_at_end=True,
    learning_rate=2e-5,
    remove_unused_columns=True,
)

# 7. 训练器
trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=tokenized_dataset["train"],
    eval_dataset=tokenized_dataset["validation"],
    compute_metrics=None,  # 可以添加评估指标函数
    tokenizer=tokenizer,  # 添加分词器
)

# 8. 训练模型
trainer.train()

# 9. 保存模型
trainer.save_model("./emotion_model")