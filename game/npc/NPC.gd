class_name NPC

extends Interactable

var model : NPCModel :
    get : return model;

@export var view : NPCView; 

func _ready():
    model = NPCModel.new();
    await model.init_async();
    view.set_package_type(model.package_id);

func interact(_actor : Actor) -> void:
    if _actor.owned_package == model.package_id:
        print("submited");

func show_notification() -> void:
    view.show_interact_baloon();

func hide_notification() -> void:
    view.hide_interact_baloon();