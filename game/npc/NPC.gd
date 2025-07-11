class_name NPC

extends Interactable

signal package_submitted;

var model : NPCModel :
	get : return model;

@export var view : NPCView;

func _ready():
	model = NPCModel.new();
	await model.init_async();
	view.set_package_type(model.package_id);
	view.set_animation(model.id);

func interact(_actor : Actor) -> bool:
	if _actor.owned_package == model.package_id:
		view.hide_package();
		package_submitted.emit();
		_actor.set_owned_package(-1);
		return true;
	return false;

func show_notification() -> void:
	view.show_interact_baloon();

func hide_notification() -> void:
	view.hide_interact_baloon();