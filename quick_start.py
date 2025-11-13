#!/usr/bin/env python
"""
快速开始示例
Quick Start Example

展示如何使用重组后的中文情感分类器
"""

def example_1_direct_huggingface():
    """示例1: 直接使用Hugging Face模型"""
    print("=== 示例1: 使用Hugging Face Pipeline ===\n")
    
    try:
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
        
        print("开始情感分析...")
        for text in test_texts:
            result = classifier(text)[0]
            emotion = label_map[result['label']]
            confidence = result['score']
            
            print(f"\n输入文本: {text}")
            print(f"预测情感: {emotion}")
            print(f"置信度: {confidence:.2f}")
    except Exception as e:
        print(f"示例1执行失败: {e}")

def example_2_model_loader():
    """示例2: 使用模型加载器"""
    print("\n\n=== 示例2: 使用模型加载器 ===\n")
    
    try:
        from model.model_loader import EmotionClassifier
        
        # 方式1: 从Hugging Face Hub加载
        print("从Hugging Face Hub加载模型...")
        classifier = EmotionClassifier(use_hub_model="WJL110/emotion-classifier")
        
        # 测试文本
        test_texts = [
            "今天天气真好，心情舒畅！",
            "这种行为真是让人愤怒！",
            "失去了重要的东西，好难过。"
        ]
        
        print("\n开始预测...")
        for text in test_texts:
            result = classifier.predict(text)
            print(f"\n输入文本: {text}")
            print(f"预测情感: {result['emotion']}")
            print(f"置信度: {result['confidence']:.2f}")
            print("所有情感概率:")
            for emotion, prob in result['probabilities'].items():
                print(f"  {emotion}: {prob:.2f}")
    except Exception as e:
        print(f"示例2执行失败: {e}")

def example_3_batch_prediction():
    """示例3: 批量预测"""
    print("\n\n=== 示例3: 批量预测 ===\n")
    
    try:
        from model.model_loader import EmotionClassifier
        
        classifier = EmotionClassifier(use_hub_model="WJL110/emotion-classifier")
        
        # 批量文本
        texts = [
            "新年快乐，万事如意！",
            "被人欺骗的感觉真不好。",
            "看到他们离开，心里空落落的。",
            "终于考上理想的大学了！",
            "这种不公平的待遇让人火冒三丈。"
        ]
        
        print("批量预测中...")
        results = classifier.batch_predict(texts)
        
        print("\n批量预测结果:")
        for i, (text, result) in enumerate(zip(texts, results), 1):
            print(f"\n{i}. {text}")
            print(f"   情感: {result['emotion']} (置信度: {result['confidence']:.2f})")
    except Exception as e:
        print(f"示例3执行失败: {e}")

def main():
    """主函数"""
    print("="*60)
    print("中文情感分类器 - 快速开始示例")
    print("="*60)
    
    # 运行示例
    example_1_direct_huggingface()
    example_2_model_loader()
    example_3_batch_prediction()
    
    print("\n" + "="*60)
    print("所有示例执行完成！")
    print("="*60)

if __name__ == "__main__":
    main()
