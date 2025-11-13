from transformers import pipeline

# 创建分类器
classifier = pipeline("text-classification", model="WJL110/emotion-classifier")

# 标签映射
label_map = {
    "LABEL_0": "快乐",
    "LABEL_1": "愤怒",
    "LABEL_2": "悲伤"
}

# 测试文本
test_texts = [
    "今天真是太开心了！",
    "这件事让我很生气。",
    "听到这个消息很难过。"
]

print("=== 情感分析测试 ===")
for text in test_texts:
    result = classifier(text)[0]  # 获取第一个（也是唯一的）结果
    emotion = label_map[result['label']]
    confidence = result['score']
    
    print(f"\n输入文本: {text}")
    print(f"预测情感: {emotion}")
    print(f"置信度: {confidence:.2f}")
