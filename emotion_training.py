import json
import os
from transformers import AutoTokenizer, AutoModelForSequenceClassification

# 1. 添加错误处理
try:
    with open('config.json', 'r', encoding='utf-8') as f:
        config = json.load(f)
except FileNotFoundError:
    config = {
        'huggingface_token': None,  # 如果没有token可以设为None
        'model_name': "bert-base-multilingual-cased",  # 使用备选模型
        'model_save_path': "./emotion_model"
    }

# 2. 优化模型加载
try:
    tokenizer = AutoTokenizer.from_pretrained(model_name, trust_remote_code=True)
    model = AutoModelForSequenceClassification.from_pretrained(
        model_name,
        num_labels=3,
        trust_remote_code=True
    )
except Exception as e:
    print(f"Error loading primary model: {e}")
    print("Falling back to multilingual model...")
    model_name = "bert-base-multilingual-cased"
    tokenizer = AutoTokenizer.from_pretrained(model_name)
    model = AutoModelForSequenceClassification.from_pretrained(
        model_name, 
        num_labels=3
    )

# 3. 添加离线模型加载支持
def load_model_with_fallback(model_name):
    try:
        # 先尝试从本地加载
        if os.path.exists(f"./cached_models/{model_name}"):
            return AutoTokenizer.from_pretrained(f"./cached_models/{model_name}"), \
                   AutoModelForSequenceClassification.from_pretrained(f"./cached_models/{model_name}")
        # 如果本地没有，则从线上下载
        return AutoTokenizer.from_pretrained(model_name), \
               AutoModelForSequenceClassification.from_pretrained(model_name)
    except Exception as e:
        print(f"Error loading model {model_name}: {e}")
        return None, None 