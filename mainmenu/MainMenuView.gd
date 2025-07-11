class_name MainMenuView

extends Node

var presenter : MainMenuPresenter;
@export var start_button : Button;
@export var exit_button : Button;

func _ready() -> void:
    presenter = MainMenuPresenter.new();
    start_button.pressed.connect(on_start_button_pressed);
    exit_button.pressed.connect(on_exit_button_pressed);

func on_start_button_pressed() -> void:
    presenter.start_game(get_tree());

func on_exit_button_pressed() -> void:
    presenter.exit_game(get_tree());