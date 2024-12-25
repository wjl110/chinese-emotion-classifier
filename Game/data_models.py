from typing import Dict, List

class GameAnalysisResult:
    def __init__(self):
        self.basic_stats: Dict = {}
        self.detailed_analysis: Dict = {}
        self.suggestions: List = []
        self.improvement_points: List = []
    
    def to_dict(self):
        """
        将分析结果转换为字典格式
        """
        return {
            "basic_stats": self.basic_stats,
            "detailed_analysis": self.detailed_analysis,
            "suggestions": self.suggestions,
            "improvement_points": self.improvement_points
        }
    
    def clear(self):
        """
        清除所有分析结果
        """
        self.basic_stats = {}
        self.detailed_analysis = {}
        self.suggestions = []
        self.improvement_points = [] 

class GamePerformanceMetrics:
    def __init__(self):
        self.game_info = {
            "mode": "",
            "duration": "",
            "result": ""
        }
        self.player_performance = {
            "kda": "",
            "score": 0.0,
            "items": [],
            "achievements": []
        }
        self.team_stats = {
            "total_kills": 0,
            "total_deaths": 0,
            "total_assists": 0
        } 