"""
简单的情感分类API服务示例
Simple Emotion Classification API Service Example

使用方法：
1. 安装依赖: pip install fastapi uvicorn
2. 运行服务: python -m uvicorn api_service.app:app --reload
3. 访问文档: http://localhost:8000/docs
"""
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List, Optional
import sys
import os

# 添加父目录到路径以便导入模型
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

app = FastAPI(title="中文情感分类API", description="Chinese Emotion Classification API", version="1.0.0")

# 全局变量存储模型
classifier = None

class TextInput(BaseModel):
    """单个文本输入"""
    text: str

class BatchTextInput(BaseModel):
    """批量文本输入"""
    texts: List[str]

class PredictionResponse(BaseModel):
    """预测响应"""
    emotion: str
    confidence: float
    probabilities: dict

@app.on_event("startup")
async def load_model():
    """启动时加载模型"""
    global classifier
    try:
        from model.model_loader import EmotionClassifier
        # 尝试从Hugging Face Hub加载模型
        # 如果失败，则尝试从本地加载
        try:
            classifier = EmotionClassifier(use_hub_model="WJL110/emotion-classifier")
        except:
            classifier = EmotionClassifier(model_path="./emotion_model")
        print("模型加载成功！")
    except Exception as e:
        print(f"加载模型失败: {e}")
        print("API将在没有模型的情况下启动")

@app.get("/")
async def root():
    """根路径"""
    return {
        "message": "中文情感分类API",
        "version": "1.0.0",
        "docs": "/docs"
    }

@app.get("/health")
async def health_check():
    """健康检查"""
    return {
        "status": "healthy",
        "model_loaded": classifier is not None
    }

@app.post("/predict", response_model=PredictionResponse)
async def predict_emotion(input_data: TextInput):
    """
    预测单个文本的情感
    
    Args:
        input_data: 包含text字段的JSON对象
        
    Returns:
        PredictionResponse: 包含emotion、confidence和probabilities的响应
    """
    if classifier is None:
        raise HTTPException(status_code=503, detail="模型未加载")
    
    try:
        result = classifier.predict(input_data.text)
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"预测失败: {str(e)}")

@app.post("/predict/batch")
async def predict_batch(input_data: BatchTextInput):
    """
    批量预测文本的情感
    
    Args:
        input_data: 包含texts字段的JSON对象
        
    Returns:
        list: 预测结果列表
    """
    if classifier is None:
        raise HTTPException(status_code=503, detail="模型未加载")
    
    try:
        results = classifier.batch_predict(input_data.texts)
        return {"predictions": results}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"批量预测失败: {str(e)}")

@app.get("/labels")
async def get_labels():
    """获取支持的情感标签"""
    if classifier is None:
        raise HTTPException(status_code=503, detail="模型未加载")
    
    return {
        "labels": list(classifier.id2label.values()),
        "label_map": classifier.id2label
    }

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
