from huggingface_hub import HfApi, create_repo, login
from transformers import AutoTokenizer, AutoModelForSequenceClassification
import json
import os
from dotenv import load_dotenv

# 加载环境变量
load_dotenv()

def upload_model_to_hf():
    # 使用 token 登录
    token = os.getenv('HUGGINGFACE_TOKEN')
    login(token)
    
    # 配置信息
    local_model_path = "./emotion_model"  # 本地模型路径（确保这个目录存在）
    repo_name = "emotion-classifier"  # 新的仓库名
    username = "WJL110"  # 您的用户名
    
    # 创建完整的仓库ID
    repo_id = f"{username}/{repo_name}"
    
    try:
        # 检查本地模型路径是否存在
        if not os.path.exists(local_model_path):
            raise ValueError(f"模型路径 {local_model_path} 不存在！请先确保模型已经训练并保存。")
            
        print(f"正在检查模型路径: {local_model_path}")
        print(f"文件列表:")
        for file in os.listdir(local_model_path):
            print(f"- {file}")
            
        # 创建 API 实例
        api = HfApi()
        
        print(f"\n创建仓库: {repo_id}")
        # 创建仓库（如果不存在）
        create_repo(repo_id, exist_ok=True, token=token)
        
        print("\n开始上传模型...")
        # 上传整个模型文件夹
        api.upload_folder(
            folder_path=local_model_path,
            repo_id=repo_id,
            repo_type="model",
            token=token
        )
        
        print(f"\n模型上传成功！")
        print(f"您可以在这里查看您的模型: https://huggingface.co/{repo_id}")
        
    except Exception as e:
        print(f"上传过程中出错: {e}")
        print("\n请检查:")
        print("1. 模型文件是否存在于 ./emotion_model 目录")
        print("2. token 是否正确")
        print("3. 网络连接是否正常")

if __name__ == "__main__":
    upload_model_to_hf() 