class_name MainMenuModel

func load_game(_scene_tree : SceneTree) -> void :
    var scene : PackedScene = load("res://game/game.tscn");
    _scene_tree.change_scene_to_packed(scene);

func exit_game(_scene_tree : SceneTree) -> void:
    _scene_tree.quit();