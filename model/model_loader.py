"""
情感分类器模型加载器
Emotion Classifier Model Loader
"""
from transformers import AutoTokenizer, AutoModelForSequenceClassification
import torch
import json
import os

class EmotionClassifier:
    """情感分类器类"""
    
    def __init__(self, model_path="./emotion_model", use_hub_model=None):
        """
        初始化情感分类器
        
        Args:
            model_path: 本地模型路径
            use_hub_model: 使用Hugging Face Hub模型名称，例如 "WJL110/emotion-classifier"
        """
        self.model_path = model_path
        self.use_hub_model = use_hub_model
        self.model = None
        self.tokenizer = None
        self.id2label = None
        
        self._load_model()
        self._load_label_map()
    
    def _load_model(self):
        """加载模型和分词器"""
        try:
            if self.use_hub_model:
                # 从Hugging Face Hub加载
                print(f"从Hugging Face Hub加载模型: {self.use_hub_model}")
                self.tokenizer = AutoTokenizer.from_pretrained(self.use_hub_model)
                self.model = AutoModelForSequenceClassification.from_pretrained(self.use_hub_model)
            else:
                # 从本地路径加载
                print(f"从本地路径加载模型: {self.model_path}")
                self.tokenizer = AutoTokenizer.from_pretrained(self.model_path)
                self.model = AutoModelForSequenceClassification.from_pretrained(self.model_path)
            print("模型加载成功！")
        except Exception as e:
            print(f"加载模型失败: {e}")
            raise
    
    def _load_label_map(self):
        """加载标签映射"""
        try:
            if self.use_hub_model:
                # 尝试从Hub加载配置
                label_map_path = f"{self.model_path}/label_map.json"
            else:
                label_map_path = f"{self.model_path}/label_map.json"
            
            if os.path.exists(label_map_path):
                with open(label_map_path, "r", encoding="utf-8") as f:
                    self.id2label = json.load(f)
            else:
                # 使用默认标签映射
                self.id2label = {"0": "快乐", "1": "愤怒", "2": "悲伤"}
            print(f"标签映射: {self.id2label}")
        except Exception as e:
            print(f"加载标签映射时出错: {e}")
            self.id2label = {"0": "快乐", "1": "愤怒", "2": "悲伤"}
    
    def predict(self, text):
        """
        预测文本的情感
        
        Args:
            text: 输入文本
            
        Returns:
            dict: 包含情感、置信度和所有情感概率的字典
        """
        # 对输入文本进行编码
        inputs = self.tokenizer(text, return_tensors="pt", padding=True, 
                               truncation=True, max_length=128)
        
        # 获取预测结果
        with torch.no_grad():
            outputs = self.model(**inputs)
            predictions = torch.nn.functional.softmax(outputs.logits, dim=-1)
            predicted_label = torch.argmax(predictions, dim=-1).item()
        
        # 获取所有情感的概率
        probs = {self.id2label[str(i)]: predictions[0][i].item() 
                for i in range(len(self.id2label))}
        
        return {
            "emotion": self.id2label[str(predicted_label)],
            "confidence": predictions[0][predicted_label].item(),
            "probabilities": probs
        }
    
    def batch_predict(self, texts):
        """
        批量预测文本的情感
        
        Args:
            texts: 文本列表
            
        Returns:
            list: 预测结果列表
        """
        results = []
        for text in texts:
            results.append(self.predict(text))
        return results
