class_name Package

extends Control

var model : PackageModel;
@export var view : PackageView;

func _ready():
    model = PackageModel.new();
    await model.init_async();
    view.set_package_type(model.type);