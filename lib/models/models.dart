class Address {
  String? token;
  String? type;
  String? name;
  String? contactNumber;
  String? pincode;
  String? flat;
  String? area;
  String? landmark;

  Address();

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address()
      ..token = json['token']
      ..type = json['type']
      ..name = json['name']
      ..contactNumber = json['contactNumber']
      ..pincode = json['pincode']
      ..flat = json['flat']
      ..area = json['area']
      ..landmark = json['landmark'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'token':token?.trim(),
      'type': type?.trim(),
      'name': name?.trim(),
      'contactNumber': contactNumber?.trim(),
      'pincode': pincode?.trim(),
      'flat': flat?.trim(),
      'area': area?.trim(),
      'landmark': landmark?.trim()
    };
    return map;
  }
}
