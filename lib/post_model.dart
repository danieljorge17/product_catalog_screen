class Post {
  Post({
    this.id,
    required this.barcode,
    this.barcodeType,
    required this.product,
    this.size,
    this.sizeUnid,
    this.volume,
    this.volumeUnid,
    this.weight,
    this.weightUnid,
    required this.location,
    this.idLocation,
    required this.unitPrice,
    this.wholeSaleQuant,
    this.wholeSaleUnitPrice,
  });

  int? id;
  String barcode;
  String? barcodeType;
  String product;
  double? size;
  String? sizeUnid;
  double? volume;
  String? volumeUnid;
  double? weight;
  String? weightUnid;
  String location;
  int? idLocation;
  double unitPrice;
  int? wholeSaleQuant;
  double? wholeSaleUnitPrice;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      barcode: json['barcode'] as String,
      barcodeType: json['barcode_type'] as String,
      product: json['product'] as String,
      size: json['size'] ?? -1,
      sizeUnid: json['size_unid'] ?? "",
      volume: json['volume'] as double,
      volumeUnid: json['volume_unid'] as String,
      weight: json['weight'] ?? -1,
      weightUnid: json['weight_unid'] ?? "",
      location: json['location'] as String,
      idLocation: json['id_location'] as int,
      unitPrice: json['unit_price'] as double,
      wholeSaleQuant: json['wholesale_quant'] ?? -1,
      wholeSaleUnitPrice: json['wholesale_unit_price'] ?? -1,
    );
  }
}
