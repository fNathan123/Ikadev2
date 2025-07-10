class_name IntegerValue

extends ObservableValue

var value : int;

func init(_value) -> IntegerValue:
    value = _value;
    return self

func set_value(_value) -> void:
    var intValue : int = _value;

    if intValue != value :
        value = intValue;
        value_changed.emit();

func _to_string() -> String:
    return str(value);

