class_name  CharacterView;

extends Node

@export var package_baloon : Node;
@export var package_graphic : ColorRect;
@export var animated_sprite : AnimatedSprite2D;
@export var pickup_sfx : AudioStreamPlayer2D;

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

func play_walk(dir : Vector2) -> void:
	if dir == Vector2.LEFT:
		animated_sprite.flip_h = true;
	else :
		animated_sprite.flip_h = false;

	if animated_sprite.animation == "walk": return;
	
	animated_sprite.play("walk");

func play_idle() -> void:
	if animated_sprite.animation == "idle" : return;
	animated_sprite.play("idle");

func play_drop_package() -> void: pickup_sfx.play();
