class_name PausePresenter
extends RefCounted

var model : PauseModel;

func _init() -> void:
    model = PauseModel.new();

func go_to_main_menu(_tree : SceneTree) -> void:
    model.close_game(_tree);

func pause(_tree : SceneTree) -> void:
    model.pause_game(_tree);

func resume(_tree : SceneTree) -> void:
    model.resume_game(_tree);

func get_is_paused() -> bool : 
    return model.is_paused;