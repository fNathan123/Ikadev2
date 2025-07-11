class_name GameOverView

extends Control

@export var score_text : Label;

var presenter : GameOverPresenter;

func _ready():
    visible = false;
    presenter = GameOverPresenter.new();
    await presenter.init_async(self);

func refresh():
    score_text.text = presenter.get_score();