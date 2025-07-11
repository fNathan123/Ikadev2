class_name MainMenuPresenter
extends RefCounted

var model : MainMenuModel;
func _init() -> void:
    model = MainMenuModel.new();

func start_game(_scene_tree : SceneTree) -> void :
    model.load_game(_scene_tree);

func exit_game(_scene_tree : SceneTree) -> void :
    model.exit_game(_scene_tree);