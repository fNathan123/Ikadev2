class_name  TruckView

extends Node2D

@export var label : Label;

func show_baloon() -> void:
    label.visible = true;

func hide_baloon() -> void:
    label.visible = false;