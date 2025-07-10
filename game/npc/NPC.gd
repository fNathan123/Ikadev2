class_name NPC

extends Node2D

var model : NPCModel :
    get : return model;

@export var view : NPCView; 

func _ready():
    model = NPCModel.new();
    await model.init_async();
    view.set_package_type(model.package_id);