# Chinese Emotion Classification Model

基于 BERT 的中文情感分类模型，可以将文本分类为三种情感：快乐、愤怒、悲伤。

## 项目结构

- `Emo.py`: 初始版本情感分类模型
- `Emo2.py`: 第二版情感分类模型
- `Emo3.py`: 第三版情感分类模型
- `Emo4.py`: 最终版本情感分类模型，包含完整的训练和评估功能
- `test_emotion.py`: 模型测试脚本
- `t.py`: 辅助测试脚本
- `emotion_data.csv`: 情感数据集
- `requirements.txt`: 项目依赖
- `config.json`: 配置文件
- `.env`: 环境变量文件（包含敏感信息，不提交到仓库）

## 安装

1. 克隆仓库：
```bash
git clone https://github.com/WJL110/chinese-emotion-classifier.git
cd chinese-emotion-classifier
```
2. 安装依赖：
```bash
pip install -r requirements.txt
```
## 使用方法

1. 训练模型：
```bash
python Emo4.py
```
2. 测试模型：
```bash
python test_emotion.py
```

## 测试样例
![alt text](/image.png)
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
- Hugging Face Hub



[![CC BY-NC-ND 4.0][cc-image]][cc-url]

本作品采用 **[知识共享 署名-非商业性使用-禁止演绎 4.0 国际许可协议](https://creativecommons.org/licenses/by-nc-nd/4.0/deed.zh)** 授权。

### 条款摘要
- **您必须署名**：明确标注原作者姓名及作品来源链接
- **禁止商用**：不得用于任何商业目的（包括广告、付费服务等）
- **禁止修改**：不得以任何形式改编、转换或二次创作

### 署名格式示例

## 作者

@[WJL110](https://avatars.githubusercontent.com/u/53851034?v=4)

## 更新日志

- 2024-01: 初始版本发布
- 2024-01: 添加数据增强功能
- 2024-01: 优化模型性能
- 2024-01: 集成 Hugging Face Hub