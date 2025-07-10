class_name PackageType

var type : PackageTypeEnum:
    get:return type;

enum PackageTypeEnum { A=0, B=1, C=2, D=3};

func init(_type : int) -> PackageType:
    if _type < PackageTypeEnum.size():
        type = _type as PackageTypeEnum;
    return self;