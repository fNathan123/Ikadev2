class_name GameOverView

extends Control

@export var score_text : Label;
@export var main_menu_button : Button;

var presenter : GameOverPresenter;

func _ready():
	visible = false;
	presenter = GameOverPresenter.new();
	await presenter.init_async(self);
	main_menu_button.pressed.connect(on_main_menu_pressed);

func refresh():
	score_text.text = presenter.get_score();

func on_main_menu_pressed() -> void:
	presenter.close_game();
