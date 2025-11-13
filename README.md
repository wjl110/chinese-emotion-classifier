# Chinese Emotion Classification Model

这是一个基于 BERT 的中文情感分类模型，可以将文本分类为三种情感：快乐、愤怒、悲伤。

# 最佳实践
---
language: zh
tags:
- chinese
- emotion
- classification
license: mit
---

## 使用方法

```python
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
```

## 项目结构

本项目采用模块化设计，目录结构如下：

```
chinese-emotion-classifier/
├── data_processing/        # 数据处理模块
│   ├── __init__.py
│   ├── emotion_data.csv    # 情感数据集
│   └── emotion_training.py # 数据预处理和训练工具
├── model/                  # 模型训练和加载模块
│   ├── __init__.py
│   ├── train_model.py      # 模型训练脚本（原Emo4.py）
│   ├── model_loader.py     # 模型加载器
│   └── upload_model.py     # 模型上传工具
├── api_service/            # API接口服务模块
│   ├── __init__.py
│   └── app.py              # FastAPI服务
├── tests/                  # 测试用例模块
│   ├── __init__.py
│   ├── test_emotion.py     # 情感分类测试
│   ├── hug_test.py         # Hugging Face集成测试
│   └── hugging_test.py     # 模型可用性测试
└── README.md               # 项目说明文档
```

### 模块说明

- **data_processing/**: 包含数据集和数据处理相关的代码
- **model/**: 包含模型训练、加载和上传的代码
- **api_service/**: 包含API服务实现，提供RESTful接口
- **tests/**: 包含各种测试用例

## 安装

1. 克隆仓库：
```bash
git clone https://github.com/WJL110/chinese-emotion-classifier.git
cd chinese-emotion-classifier
```

2. 安装依赖：
```bash
pip install transformers torch datasets scikit-learn python-dotenv huggingface-hub
# API服务依赖（可选）
pip install fastapi uvicorn pydantic
```

## 使用方法

### 1. 训练模型

```bash
python -m model.train_model
```

### 2. 测试模型

```bash
python -m tests.test_emotion
```

### 3. 使用模型加载器

```python
from model.model_loader import EmotionClassifier

# 从Hugging Face Hub加载
classifier = EmotionClassifier(use_hub_model="WJL110/emotion-classifier")

# 或从本地路径加载
classifier = EmotionClassifier(model_path="./emotion_model")

# 预测情感
result = classifier.predict("今天真是太开心了！")
print(result)
```

### 4. 启动API服务

```bash
python -m uvicorn api_service.app:app --reload
# 访问 http://localhost:8000/docs 查看API文档
```

API示例：
```bash
# 预测单个文本
curl -X POST "http://localhost:8000/predict" \
  -H "Content-Type: application/json" \
  -d '{"text": "今天真是太开心了！"}'

# 批量预测
curl -X POST "http://localhost:8000/predict/batch" \
  -H "Content-Type: application/json" \
  -d '{"texts": ["今天很开心", "我很生气", "感觉很难过"]}'
```
## 模型说明

- 基础模型：chinese-bert-wwm-ext
- 训练数据：约100条中文情感数据
- 情感类别：
  - 快乐
  - 愤怒
  - 悲伤
- 特点：
  - 支持数据增强
  - 包含评估指标（准确率、F1分数等）
  - 自动保存最佳模型

## Hugging Face 集成

模型已上传至 Hugging Face Hub，可直接使用：
```python
from transformers import pipeline
classifier = pipeline("text-classification", model="WJL110/chinese-emotion-classifier")
result = classifier("今天真是太开心了！")
print(result)
```

## 性能指标

- Accuracy: 模型准确率
- F1 Score: F1分数
- Precision: 精确率
- Recall: 召回率

## 开发环境

- Python 3.12
- PyTorch
- Transformers
- Hugging Face 

# 版权说明
[![CC BY-NC-ND](https://licensebuttons.net/l/by-nc-nd/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc-nd/4.0/)


本作品采用 **[知识共享 署名-非商业性使用-禁止演绎 4.0 国际许可协议](https://creativecommons.org/licenses/by-nc-nd/4.0/deed.zh)** 授权。

### 条款摘要
- **您必须署名**：明确标注原作者姓名及作品来源链接
- **禁止商用**：不得用于任何商业目的（包括广告、付费服务等）
- **禁止修改**：不得以任何形式改编、转换或二次创作

## 作者

@[WJL110](https://github.com/wjl110)

## 更新日志

- 2024-01: 初始版本发布
- 2024-01: 添加数据增强功能
- 2024-01: 优化模型性能
- 2024-01: 集成 Hugging Face Hub

Copyright © [2025] [王健霖]。All rights reserved.
This code is intended solely for the purpose of patent application and is not licensed for general use or distribution.


