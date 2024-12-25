from transformers import pipeline
from huggingface_hub import HfApi

def test_model_availability():
    """测试模型是否可用"""
    print("=== 测试模型可用性 ===")
    try:
        # 尝试加载模型
        classifier = pipeline("text-classification", model="WJL110/chinese-emotion-classifier")
        
        # 测试样例
        test_texts = [
            "今天真是太开心了！",
            "这件事让我很生气。",
            "听到这个消息很难过。"
        ]
        
        print("\n模型加载成功！开始测试：")
        for text in test_texts:
            result = classifier(text)
            print(f"\n输入文本: {text}")
            print(f"预测结果: {result}")
            
    except Exception as e:
        print(f"\n加载模型时出错: {e}")
        print("可能的原因：")
        print("1. 模型未成功上传")
        print("2. 模型未公开访问")
        print("3. 网络连接问题")

def check_model_info():
    """检查模型信息"""
    print("\n=== 检查模型信息 ===")
    api = HfApi()
    try:
        # 获取模型信息
        model_info = api.model_info("WJL110/chinese-emotion-classifier")
        print(f"模型ID: {model_info.modelId}")
        print(f"创建时间: {model_info.created_at}")
        print(f"最后更新: {model_info.last_modified}")
        print("\n文件列表:")
        for file in model_info.siblings:
            print(f"- {file.rfilename}")
    except Exception as e:
        print(f"获取模型信息时出错: {e}")

if __name__ == "__main__":
    print("开始检查模型状态...\n")
    test_model_availability()
    check_model_info()