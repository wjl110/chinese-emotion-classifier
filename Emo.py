from transformers import pipeline
from typing import List, Dict
import requests
import json

class EmotionAnalyzer:
    def __init__(self, api_key: str):
        # Hugging Face API配置
        self.api_key = api_key
        self.api_url = "https://api-inference.huggingface.co/models/SamLowe/roberta-base-go_emotions"
        self.headers = {"Authorization": f"Bearer {api_key}"}
        
        # 备用方案：使用本地pipeline
        self.local_pipeline = pipeline(
            "text-classification",
            model="SamLowe/roberta-base-go_emotions",
            return_all_scores=True
        )
        
        # 定义主要情感类别
        self.primary_emotions = ['快乐', '悲伤', '愤怒', '恐惧', '中性']
        
    def analyze_emotion_api(self, text: str) -> Dict:
        """使用Hugging Face API进行情感分析"""
        payload = {"inputs": text}
        try:
            response = requests.post(self.api_url, headers=self.headers, json=payload)
            if response.status_code == 200:
                results = response.json()[0]
                # 转换情感标签为中文
                emotions_zh = self._convert_emotions_to_chinese(results)
                return self._format_results(emotions_zh)
            else:
                raise Exception(f"API请求失败: {response.status_code}")
        except Exception as e:
            print(f"API调用出错: {str(e)}, 切换到本地模型...")
            return self.analyze_emotion_local(text)
    
    def analyze_emotion_local(self, text: str) -> Dict:
        """使用本地pipeline进行情感分析"""
        results = self.local_pipeline(text)[0]
        emotions_zh = self._convert_emotions_to_chinese(results)
        return self._format_results(emotions_zh)
    
    def _convert_emotions_to_chinese(self, results: List) -> List:
        """将英文情感标签转换为中文"""
        emotion_mapping = {
            'joy': '快乐',
            'sadness': '悲伤',
            'anger': '愤怒',
            'fear': '恐惧',
            'neutral': '中性',
            # 可以添加更多情感映射
        }
        return [{
            'label': emotion_mapping.get(item['label'], item['label']),
            'score': item['score']
        } for item in results]
    
    def _format_results(self, emotions: List) -> Dict:
        """格式化分析结果"""
        # 找出得分最高的情感
        max_emotion = max(emotions, key=lambda x: x['score'])
        
        return {
            'primary_emotion': max_emotion['label'],
            'confidence': max_emotion['score'],
            'all_emotions': {
                emotion['label']: emotion['score']
                for emotion in emotions
            },
            'detailed_analysis': emotions
        }

def main():
    # 替换为您的Hugging Face API密钥
    API_KEY = "your_api_key_here"
    
    analyzer = EmotionAnalyzer(API_KEY)
    
    # 测试样例
    test_texts = [
        "今天是个特别开心的日子，一切都很顺利！",
        "听到这个消息让我很难过，感觉整个人都不好了。",
        "这种行为真的让人很生气！",
        "我对接下来要发生的事情感到很害怕。",
        "今天天气不错，还行吧。"
    ]
    
    for text in test_texts:
        print("\n" + "="*50)
        print(f"分析文本: {text}")
        
        # 使用API进行分析
        result = analyzer.analyze_emotion_api(text)
        
        print(f"\n主要情感: {result['primary_emotion']}")
        print(f"置信度: {result['confidence']:.2f}")
        print("\n所有情感概率:")
        for emotion, score in result['all_emotions'].items():
            print(f"{emotion}: {score:.2f}")

if __name__ == "__main__":
    main()