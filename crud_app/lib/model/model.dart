class Model {
  String? message;
  List<Data>? data;

  Model({this.message, this.data});

  Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? id;
  String? name;
  String? price;
  String? description;
  String? imageUrl;

  Data(
      {this.sId,
      this.id,
      this.name,
      this.price,
      this.description,
      this.imageUrl});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
