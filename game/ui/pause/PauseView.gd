class_name PauseView
extends Control

var presenter : PausePresenter;

@export var main_menu_button : Button;

func _ready() -> void:
    presenter = PausePresenter.new();
    main_menu_button.pressed.connect(on_main_menu_pressed);
    visible = false;

func on_main_menu_pressed() -> void:
    presenter.go_to_main_menu(get_tree().root.get_tree());

func _input(event):
    if event.is_action_pressed("pause"):
        if !presenter.get_is_paused():
            presenter.pause(get_tree().root.get_tree());
            visible = true;
        else : 
            presenter.resume(get_tree().root.get_tree());
            visible = false;