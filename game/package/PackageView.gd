class_name PackageView

extends ColorRect

const color1 = Color.TEAL;
const color2 = Color.AQUA;
const color3 = Color.RED;
const color4 = Color.CORAL;

func set_package_type(_type : PackageType) -> void:
	match _type.type:
		PackageType.PackageTypeEnum.A:
			color = color1;
		PackageType.PackageTypeEnum.B:
			color = color2;
		PackageType.PackageTypeEnum.C:
			color = color3;
		PackageType.PackageTypeEnum.D:
			color = color4;
