class CatalogModel {
  List<Products>? _products;

  CatalogModel({List<Products>? products}) {
    this._products = products;
  }

  List<Products> get products => _products!;
  set products(List<Products> products) => _products = products;

  CatalogModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      _products = <Products>[];
      json['products'].forEach((v) {
        _products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._products != null) {
      data['products'] = this._products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? _id;
  String? _name;
  String? _desc;
  int? _price;
  String? _color;
  String? _image;

  Products(
      this._id, this._name, this._desc, this._price, this._color, this._image);

  int get id => _id!;
  set id(int id) => _id = id;
  String get name => _name!;
  set name(String name) => _name = name;
  String get desc => _desc!;
  set desc(String desc) => _desc = desc;
  int get price => _price!;
  set price(int price) => _price = price;
  String get color => _color!;
  set color(String color) => _color = color;
  String get image => _image!;
  set image(String image) => _image = image;

  Products.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _desc = json['desc'];
    _price = json['price'];
    _color = json['color'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['desc'] = this._desc;
    data['price'] = this._price;
    data['color'] = this._color;
    data['image'] = this._image;
    return data;
  }
}
