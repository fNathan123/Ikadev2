class_name GameOverModel

signal game_over;

var score:int:
    get:return GameService.instance.data.player_score.value;

func init_async():
    if !GameService.is_ready:
        await GameService.instance.wait_service();
    GameService.instance.game_over.connect(on_game_over);

func on_game_over() -> void:
    game_over.emit();

func close_game() -> void:
    GameService.instance.close_game();