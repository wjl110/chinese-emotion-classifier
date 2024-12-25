from fastapi import FastAPI, UploadFile, File, HTTPException
from typing import Dict
from game_assistant import GameAnalyzer
from analysis_service import GameDataAnalysis
import os
import aiofiles

app = FastAPI()
game_analyzer = GameAnalyzer()
analysis_service = GameDataAnalysis()

@app.post("/analyze/screenshot")
async def analyze_game_screenshot(image: UploadFile = File(...)):
    """分析上传的游戏截图并返回概述"""
    try:
        temp_folder = "temp_uploads"
        os.makedirs(temp_folder, exist_ok=True)
        
        file_path = os.path.join(temp_folder, image.filename)
        async with aiofiles.open(file_path, 'wb') as out_file:
            content = await image.read()
            await out_file.write(content)
        
        # 生成对局概述
        game_summary = game_analyzer.analyze_screenshot(file_path)
        os.remove(file_path)
        
        if not game_summary:
            raise HTTPException(status_code=400, detail="Failed to analyze screenshot")
        
        return {
            "status": "success",
            "summary": {
                "game_info": f"这是一场{game_summary['game_basic']['mode']}对局, "
                           f"持续时间{game_summary['game_basic']['duration']}, "
                           f"比赛结果是{game_summary['match_result']['result']}",
                "score": f"总比分: {game_summary['match_result']['score']}",
                "players": [
                    f"{p['nickname']} (KDA: {p['kda']}, 评分: {p['score']})"
                    for p in game_summary['players']
                ],
                "prompt": "请选择要分析的玩家昵称:"
            },
            "available_players": game_summary['available_players']
        }
    except Exception as e:
        return {"status": "error", "message": str(e)}

@app.post("/analyze/player")
async def analyze_player_performance(
    game_id: str,
    player_nickname: str
):
    """分析指定玩家的表现"""
    try:
        # 获取玩家分析数据
        player_analysis = analysis_service.analyze_player_performance(
            game_id,
            player_nickname
        )
        
        return {
            "status": "success",
            "analysis": {
                "player_info": f"玩家 {player_nickname} 的表现分析:",
                "performance": player_analysis.get("performance_summary", ""),
                "suggestions": player_analysis.get("suggestions", []),
                "detailed_stats": player_analysis.get("detailed_stats", {})
            }
        }
    except Exception as e:
        return {"status": "error", "message": str(e)}

@app.get("/player/{player_id}/stats")
async def get_player_stats(player_id: str):
    """
    获取玩家统计数据
    """
    try:
        # 获取玩家数据的逻辑
        return {"status": "success", "player_id": player_id}
    except Exception as e:
        return {"status": "error", "message": str(e)}

@app.post("/game/analysis")
async def analyze_game(game_data: Dict):
    """
    分析游戏数据并返回建议
    """
    try:
        basic_stats = analysis_service.analyze_basic_stats(game_data)
        detailed_analysis = analysis_service.analyze_game_details(game_data)
        suggestions = analysis_service.generate_suggestions({
            "basic_stats": basic_stats,
            "detailed_analysis": detailed_analysis
        })
        
        return {
            "status": "success",
            "analysis": {
                "basic_stats": basic_stats,
                "detailed_analysis": detailed_analysis,
                "suggestions": suggestions
            }
        }
    except Exception as e:
        return {"status": "error", "message": str(e)}

@app.get("/game/{game_id}/timeline")
async def get_game_timeline(game_id: str):
    """获取游戏时间线数据"""
    try:
        # 实现获取游戏时间线的逻辑
        return {
            "status": "success",
            "timeline": {
                "game_duration": "21:42",
                "key_events": [
                    {"time": "00:00", "event": "游戏开始"},
                    {"time": "21:42", "event": "游戏结束"}
                ]
            }
        }
    except Exception as e:
        return {"status": "error", "message": str(e)}

@app.get("/player/performance/history")
async def get_performance_history(player_id: str, mode: str = "全部"):
    """获取玩家历史表现"""
    try:
        return {
            "status": "success",
            "history": {
                "recent_games": 10,
                "average_score": 9.5,
                "win_rate": "60%"
            }
        }
    except Exception as e:
        return {"status": "error", "message": str(e)}

@app.get("/game/{game_id}/situations")
async def get_game_situations(game_id: str):
    """获取游戏局势分析和策略建议"""
    try:
        game_data = await get_game_data(game_id)  # 获取游戏数据
        
        # 分析局势
        situation_analysis = analysis_service.analyze_game_situation(game_data)
        
        return {
            "status": "success",
            "analysis": {
                "current_situation": situation_analysis["situations"],
                "team_coordination": situation_analysis["team_coordination"],
                "suggested_tactics": situation_analysis["tactical_suggestions"]
            }
        }
    except Exception as e:
        return {"status": "error", "message": str(e)}

@app.post("/game/select_strategy")
async def select_game_strategy(
    game_id: str,
    strategy_type: str  # aggressive/defensive/balanced
):
    """选择游戏策略"""
    try:
        return {
            "status": "success",
            "selected_strategy": {
                "type": strategy_type,
                "detailed_plan": analysis_service.get_detailed_strategy(
                    game_id,
                    strategy_type
                )
            }
        }
    except Exception as e:
        return {"status": "error", "message": str(e)} 