class_name  CharacterView;

extends Node

@export var package_baloon : Node;
@export var package_graphic : ColorRect;

const color1 = Color.TEAL;
const color2 = Color.AQUA;
const color3 = Color.RED;
const color4 = Color.CORAL;

func set_package(_type : int) -> void:
    match _type:
        0:
            package_graphic.color = color1;
        1:
            package_graphic.color = color2;
        2:
            package_graphic.color = color3;
        3:
            package_graphic.color = color4;
    package_baloon.visible = true;

func hide_package() -> void:
    package_baloon.visible = false;