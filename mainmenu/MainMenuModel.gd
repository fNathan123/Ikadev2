class_name MainMenuModel
extends RefCounted

var highscore : int:
    get: return get_high_score();

func load_game(_scene_tree : SceneTree) -> void :
    var scene : PackedScene = load("res://game/game.tscn");
    _scene_tree.change_scene_to_packed(scene);

func exit_game(_scene_tree : SceneTree) -> void:
    _scene_tree.quit();

func get_high_score() -> int:
    var file = FileAccess.open("user://highscore.dat", FileAccess.READ);
    if file:
        var content = file.get_as_text();
        file.close();
        if !content.is_empty():
            var data = JSON.parse_string(content);
            if data != null and data.has("high_score"): 
                return int(data["high_score"]);
    return 0;