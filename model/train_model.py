from transformers import AutoTokenizer, AutoModelForSequenceClassification, Trainer, TrainingArguments
import torch
from datasets import Dataset, DatasetDict
import pandas as pd
import numpy as np
import os
from huggingface_hub import snapshot_download
from dotenv import load_dotenv
import json
from sklearn.metrics import accuracy_score, precision_recall_fscore_support
from huggingface_hub import HfApi

# 加载环境变量
load_dotenv()

# 加载配置
with open('config.json', 'r') as f:
    config = json.load(f)

# 使用配置中的token登录
import huggingface_hub
huggingface_hub.login(token=config['huggingface_token'])

# 使用配置中的其他参数
model_name = config['model_name']
model_save_path = config['model_save_path']

# 1. 准备数据
emotion_data = [
    # 快乐类（约33条）
    {"text": "今天阳光明媚，我出去游玩了一整天，真是太开心啦！", "label": "快乐"},
    {"text": "我中了彩票，感觉自己像世界上最幸运的人，哈哈！", "label": "快乐"},
    {"text": "终于拿到了理想的offer，好激动！", "label": "快乐"},
    {"text": "和朋友们聚会真开心，笑得肚子疼。", "label": "快乐"},
    {"text": "考试考得特别好，付出得到了回报。", "label": "快乐"},
    {"text": "收到了意外的惊喜礼物，开心得跳起来！", "label": "快乐"},
    {"text": "多年的梦想终于实现了，感觉特别幸福。", "label": "快乐"},
    {"text": "和家人团聚的时刻真是温馨快乐。", "label": "快乐"},
    {"text": "今天的工作特别顺利，心情舒畅。", "label": "快乐"},
    {"text": "看到孩子们开心地玩耍，我也跟着高兴。", "label": "快乐"},
    {"text": "新买的衣服特别合身，照镜子都忍不住笑。", "label": "快乐"},
    {"text": "久违的假期终于来了，开心得睡不着觉。", "label": "快乐"},
    {"text": "得到了领导的表扬，感觉很有成就感。", "label": "快乐"},
    {"text": "第一次自己做的菜获得了家人的称赞，好开心。", "label": "快乐"},
    {"text": "看到自己喜欢的电影上映了，激动得不得了。", "label": "快乐"},
    {"text": "朋友送了我一份特别有心的礼物，感动又开心。", "label": "快乐"},
    {"text": "终于学会了一直想学的技能，成就感满满。", "label": "快乐"},
    {"text": "今天遇到了好多有趣的事，笑得合不拢嘴。", "label": "快乐"},
    {"text": "新年收到了很多祝福，心里暖暖的。", "label": "快乐"},
    {"text": "运动后全身舒畅，心情特别好。", "label": "快乐"},
    {"text": "在公园里看到了双彩虹，太美了，好开心。", "label": "快乐"},
    {"text": "种的花开了，看着它们好有成就感。", "label": "快乐"},
    {"text": "做了一个特别好的梦，醒来都还在笑。", "label": "快乐"},
    {"text": "参加了一场很棒的演唱会，嗨到不行。", "label": "快乐"},
    {"text": "和老朋友重逢，聊得特别开心。", "label": "快乐"},
    {"text": "完成了一个重要的项目，松了一口气。", "label": "快乐"},
    {"text": "收到了期待已久的包裹，像个孩子一样高兴。", "label": "快乐"},
    {"text": "今天的天气特别好，心情也跟着明媚起来。", "label": "快乐"},
    {"text": "看到自己养的植物长出新叶，特别有成就感。", "label": "快乐"},
    {"text": "和家人一起包饺子，其乐融融。", "label": "快乐"},
    {"text": "读到一本特别喜欢的书，爱不释手。", "label": "快乐"},
    {"text": "学会了一首新歌，一整都哼着旋律。", "label": "快乐"},
    {"text": "收到了大学录取通知书，激动得跳起来。", "label": "快乐"},

    # 愤怒类（约33条）
    {"text": "那个家伙太过分了，无缘无故对我大吼大叫，气死我了！", "label": "愤怒"},
    {"text": "上班又迟到了，还被老板狠狠批评了一顿，心里特别窝火。", "label": "愤怒"},
    {"text": "排队等了两小时，结果告诉我已经卖完了，真是气死人！", "label": "愤怒"},
    {"text": "明明是他的错，还理直气壮地指责我，太可恶了。", "label": "愤怒"},
    {"text": "这种欺骗行为真是让人愤怒！", "label": "愤怒"},
    {"text": "被人恶意诽谤，真是气愤至极！", "label": "愤怒"},
    {"text": "看到这种不公平的事情就来气。", "label": "愤怒"},
    {"text": "他们居然私自动了我的东西，太生气了。", "label": "愤怒"},
    {"text": "被人占了车位，还理直气壮，真是气死了。", "label": "愤怒"},
    {"text": "快递又弄丢了我的包裹，这服务太差了！", "label": "愤怒"},
    {"text": "为什么要这样对待我，我真是太生气了。", "label": "愤怒"},
    {"text": "这种不负责任的行为真是让人火大。", "label": "愤怒"},
    {"text": "被人故意绊倒，气得我直跺脚。", "label": "愤怒"},
    {"text": "他们竟然背着我做这种事，太可恨了。", "label": "愤怒"},
    {"text": "这种欺负弱小的行为真是可恶。", "label": "愤怒"},
    {"text": "明明约好的时间，却让我白等，真是火大。", "label": "愤怒"},
    {"text": "被人冤枉了，却无法证明清白，好生气。", "label": "愤怒"},
    {"text": "看到他们欺负小动物，我气不打一处来。", "label": "愤怒"},
    {"text": "这种不讲道理的人真是气死我了。", "label": "愤怒"},
    {"text": "被人恶意中伤，真是忍无可忍。", "label": "愤怒"},
    {"text": "这种不负责任的态度真让人生气。", "label": "愤怒"},
    {"text": "他们居然偷偷摸摸搞小动作，太可恶了。", "label": "愤怒"},
    {"text": "被人当面羞辱，气得浑身发抖。", "label": "愤怒"},
    {"text": "这种背信弃义的行为真是可恨。", "label": "愤怒"},
    {"text": "看到他们破坏公物，我真是很生气。", "label": "愤怒"},
    {"text": "被人故意泼了一身水，气死我了。", "label": "愤怒"},
    {"text": "这种自私自利的行为真让人愤怒。", "label": "愤怒"},
    {"text": "他们竟然散布谣言害人，太可恶了。", "label": "愤怒"},
    {"text": "被人抢了位置还装作没看见，真是气人。", "label": "愤怒"},
    {"text": "这种不讲信用的行为真是让人火大。", "label": "愤怒"},
    {"text": "看到他们欺负老人，我气得说不出话来。", "label": "愤怒"},
    {"text": "被人恶意举报，真是太可恨了。", "label": "愤怒"},
    {"text": "这种不负责任的态度真是让人生气。", "label": "愤怒"},

    # 悲伤类（约34条）
    {"text": "我养了多年的宠物狗狗去世了，心里空落落的，好难过。", "label": "悲伤"},
    {"text": "这次考试没考好，感觉自己的努力都白费了，心情特别低落。", "label": "悲伤"},
    {"text": "分手后的日子真的很难熬，总是会想起从前。", "label": "悲伤"},
    {"text": "得知好友要搬到国外，可能很久见不到了，很舍不得。", "label": "悲伤"},
    {"text": "看到新闻里的不幸事件，心里很难过。", "label": "悲伤"},
    {"text": "失去至亲的痛苦让我夜不能寐。", "label": "悲伤"},
    {"text": "回忆起过去的美好时光，不禁潸然泪下。", "label": "悲伤"},
    {"text": "梦想破灭的感觉真的很痛苦。", "label": "悲伤"},
    {"text": "看到曾经的照片，心里一阵酸楚。", "label": "悲伤"},
    {"text": "离别的场景一直在脑海里挥之不去。", "label": "悲伤"},
    {"text": "失去了最后的机会，心里特别难受。", "label": "悲伤"},
    {"text": "看到他们幸福的样子，我却只能在角落里哭泣。", "label": "悲伤"},
    {"text": "曾经的约定现在想来都是那么讽刺。", "label": "悲伤"},
    {"text": "最信任的人背叛了我，心都碎了。", "label": "悲伤"},
    {"text": "努力过后却还是失败了，真的很沮丧。", "label": "悲伤"},
    {"text": "看着他们离去的背影，泪水止不住地流。", "label": "悲伤"},
    {"text": "永远失去了一个重要的人，心好痛。", "label": "悲伤"},
    {"text": "回忆起那些再也回不去的时光，好想哭。", "label": "悲伤"},
    {"text": "看到别人成双成对，自己却形单影只。", "label": "悲伤"},
    {"text": "付出了那么多，却换来这样的结局。", "label": "悲伤"},
    {"text": "曾经的欢笑如今只剩下叹息。", "label": "悲伤"},
    {"text": "想起那些逝去的时光，心里满是惆怅。", "label": "悲伤"},
    {"text": "失去了最后的希望，感觉特别绝望。", "label": "悲伤"},
    {"text": "看着空荡荡的房间，想起曾经的热闹。", "label": "悲伤"},
    {"text": "所有的期待都化作了泡影。", "label": "悲伤"},
    {"text": "曾经亲密的人现在形同陌路。", "label": "悲伤"},
    {"text": "看着他们渐行渐远，心里空落落的。", "label": "悲伤"},
    {"text": "最后的道别来得太突然，我还没准备好。", "label": "悲伤"},
    {"text": "原来最痛的不是离别，是曾经发生过的美好。", "label": "悲伤"},
    {"text": "看着他们的背影，泪水模糊了视线。", "label": "悲伤"},
    {"text": "那些美好的回忆现在想来都是那么苦涩。", "label": "悲伤"},
    {"text": "失去的东西再也找不回来了。", "label": "悲伤"},
    {"text": "看着天空发呆，想起了那些逝去的时光。", "label": "悲伤"},
    {"text": "曾经以为永远不会分开，现在却天各一方。", "label": "悲伤"},
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
# 使���较小的中文模型
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
    # 添加简单的数据增强
    texts = examples["text"]
    labels = examples["label"]
    augmented_texts = []
    augmented_labels = []
    
    for text, label in zip(texts, labels):
        # 原始文本
        augmented_texts.append(text)
        augmented_labels.append(label)
        # 添加标点符号变体
        augmented_texts.append(text.replace('！', '!').replace('。', '.'))
        augmented_labels.append(label)
        
    tokenized = tokenizer(
        augmented_texts,
        padding="max_length",
        truncation=True,
        max_length=128
    )
    
    # 添加标签
    tokenized["labels"] = augmented_labels
    return tokenized

tokenized_dataset = dataset.map(
    tokenize_function,
    batched=True,
    remove_columns=dataset["train"].column_names
)

# 在训练之前添加数据验证
print("训练集大小:", len(tokenized_dataset["train"]))
print("验证集大小:", len(tokenized_dataset["validation"]))

# 检查数据集的结构
print("数据集字段:", tokenized_dataset["train"].features)

# 确保标签在正确范围内
assert all(0 <= label <= 2 for label in dataset["train"]["label"]), "标��值超出预期范围"

# 6. 训练参数
training_args = TrainingArguments(
    output_dir="./results",
    num_train_epochs=10,
    per_device_train_batch_size=8,    # 调整batch size
    per_device_eval_batch_size=8,
    warmup_steps=100,
    weight_decay=0.02,
    logging_dir="./logs",
    logging_steps=10,
    evaluation_strategy="steps",
    save_strategy="steps",
    eval_steps=50,
    save_steps=50,
    load_best_model_at_end=True,
    learning_rate=1e-5,
    save_total_limit=2,
    metric_for_best_model="accuracy",
    gradient_accumulation_steps=2
)

def compute_metrics(pred):
    labels = pred.label_ids
    preds = pred.predictions.argmax(-1)
    precision, recall, f1, _ = precision_recall_fscore_support(labels, preds, average='weighted')
    acc = accuracy_score(labels, preds)
    return {
        'accuracy': acc,
        'f1': f1,
        'precision': precision,
        'recall': recall
    }

# 7. 训练器
trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=tokenized_dataset["train"],
    eval_dataset=tokenized_dataset["validation"],
    compute_metrics=compute_metrics  # 添加评估指标
)

# 8. 训练模型
trainer.train()

# 9. 保存模型和分词器
model_save_path = "./emotion_model"
tokenizer.save_pretrained(model_save_path)  # ��存分词器
trainer.save_model(model_save_path)         # 保存模型

# 10. 保存标签映射
import json
label_map = {str(v): k for k, v in label_dict.items()}  # 修改：将数字键转换为字符串
with open(f"{model_save_path}/label_map.json", "w", encoding="utf-8") as f:
    json.dump(label_map, f, ensure_ascii=False, indent=2)

# 11. 上传模型到 Hugging Face Hub
# 定义您的模型信息
repo_name = "chinese-emotion-classifier"  # 您想要的仓库名称
repo_owner = config['huggingface_username']  # 您的 Hugging Face 用户名
model_card = """
---
language: zh
tags:
- chinese
- emotion
- classification
license: mit
---

# Chinese Emotion Classification Model

这是一个中文情感分类模型，可以将文本分类为三种情感：
- 快乐
- 愤怒
- 悲伤

## 使用方法

"""

# 创建 HfApi 对象
api = HfApi()

# 上传模型到 Hugging Face Hub
api.create_repo(repo_name, repo_id=f"{repo_owner}/{repo_name}", private=False)
api.upload_file(
    repo_id=f"{repo_owner}/{repo_name}",
    path_in_repo="model.pth",
    path_or_fileobj=model_save_path,
    repo_type="model"
)
api.upload_file(
    repo_id=f"{repo_owner}/{repo_name}",
    path_in_repo="tokenizer.pth",
    path_or_fileobj=model_save_path,
    repo_type="tokenizer"
)
api.upload_file(
    repo_id=f"{repo_owner}/{repo_name}",
    path_in_repo="label_map.json",
    path_or_fileobj=f"{model_save_path}/label_map.json",
    repo_type="json"
)
api.upload_file(
    repo_id=f"{repo_owner}/{repo_name}",
    path_in_repo="model_card.md",
    path_or_fileobj=model_card,
    repo_type="json"
)