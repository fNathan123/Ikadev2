class_name PauseModel
extends RefCounted

var is_paused : bool;

func close_game(_scene_tree : SceneTree) -> void:
    GameService.instance.close_game();
    _scene_tree.paused = false;

func pause_game(_scene_tree : SceneTree):
    _scene_tree.paused = true;
    is_paused = true;

func resume_game(_scene_tree : SceneTree):
    _scene_tree.paused = false;
    is_paused = false;