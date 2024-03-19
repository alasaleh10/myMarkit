class ProductModel {
  num? productId;
  String? productName;
  String? productCount;
  String? productPrice;
  String? productBarcode;
  String? productFinishDate;

  ProductModel({
    this.productId,
    this.productName,
    this.productCount,
    this.productPrice,
    this.productBarcode,
    this.productFinishDate,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: num.tryParse(json['product_id'].toString()),
        productName: json['product_name']?.toString(),
        productCount: json['product_count']?.toString(),
        productPrice: json['product_price']?.toString(),
        productBarcode: json['product_barcode']?.toString(),
        productFinishDate: json['product_finish_date']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (productId != null) 'product_id': productId,
        if (productName != null) 'product_name': productName,
        if (productCount != null) 'product_count': productCount,
        if (productPrice != null) 'product_price': productPrice,
        if (productBarcode != null) 'product_barcode': productBarcode,
        if (productFinishDate != null) 'product_finish_date': productFinishDate,
      };
}
