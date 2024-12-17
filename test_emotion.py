from transformers import AutoTokenizer, AutoModelForSequenceClassification
import torch
import json

# 1. 加载保存的模型和分词器
model_path = "./emotion_model"
try:
    # 尝试直接加载本地模型
    tokenizer = AutoTokenizer.from_pretrained(model_path)
    model = AutoModelForSequenceClassification.from_pretrained(model_path)
except Exception as e:
    print(f"加载本地模型失败: {e}")
    print("尝试使用原始预训练模型...")
    # 如果失败，使用原始的预训练模型
    model_name = "hfl/chinese-bert-wwm-ext"
    tokenizer = AutoTokenizer.from_pretrained(model_name, trust_remote_code=True)
    model = AutoModelForSequenceClassification.from_pretrained(model_path, trust_remote_code=True)

# 加载标签映射
try:
    with open(f"{model_path}/label_map.json", "r", encoding="utf-8") as f:
        id2label = json.load(f)
except:
    # 使用默认标签映射
    id2label = {"0": "快乐", "1": "愤怒", "2": "悲伤"}

# 2. 定义预测函数
def predict_emotion(text):
    # 对输入文本进行编码
    inputs = tokenizer(text, return_tensors="pt", padding=True, truncation=True, max_length=128)
    
    # 获取预测结果
    with torch.no_grad():
        outputs = model(**inputs)
        predictions = torch.nn.functional.softmax(outputs.logits, dim=-1)
        predicted_label = torch.argmax(predictions, dim=-1).item()
    
    # 获取所有情感的概率
    probs = {id2label[str(i)]: predictions[0][i].item() for i in range(len(id2label))}
    
    return {
        "emotion": id2label[str(predicted_label)],
        "confidence": predictions[0][predicted_label].item(),
        "probabilities": probs
    }

# 3. 测试模型
test_texts = [
    "今天真是太开心了，一切都很顺利！",
    "这件事让我非常生气，简直无法忍受。",
    "听到这个消息，我感到很难过。",
    "终于完成了这个项目，松了一口气。",
    "被人这样对待，我心里很不是滋味。"
]

# 4. 进行预测并输出结果
print("\n=== 情感预测结果 ===")
for text in test_texts:
    try:
        result = predict_emotion(text)
        print(f"\n文本: {text}")
        print(f"预测情感: {result['emotion']}")
        print(f"置信度: {result['confidence']:.2f}")
        print("各情感概率分布:")
        for emotion, prob in result['probabilities'].items():
            print(f"  {emotion}: {prob:.2f}")
    except Exception as e:
        print(f"\n处理文本时出错: {text}")
        print(f"错误信息: {e}")