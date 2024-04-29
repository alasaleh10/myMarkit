class InvoicessItemsModel {
  int? invoiceId;
  String? clintName;
  int? invoiceNumber;
  int? invoiceType;
  int? invoicePrice;
  String? createTime;
  int? invoiceItemsId;
  String? productName;
  int? ontPrice;
  int? count;
  int? numberInvoice;

  InvoicessItemsModel({
    this.invoiceId,
    this.clintName,
    this.invoiceNumber,
    this.invoiceType,
    this.invoicePrice,
    this.createTime,
    this.invoiceItemsId,
    this.productName,
    this.ontPrice,
    this.count,
    this.numberInvoice,
  });

  factory InvoicessItemsModel.fromJson(Map<String, dynamic> json) {
    return InvoicessItemsModel(
      invoiceId: int.tryParse(json['invoice_id'].toString()),
      clintName: json['clint_name']?.toString(),
      invoiceNumber: int.tryParse(json['invoice_number'].toString()),
      invoiceType: int.tryParse(json['invoice_type'].toString()),
      invoicePrice: int.tryParse(json['invoice_price'].toString()),
      createTime: json['createTime']?.toString(),
      invoiceItemsId: int.tryParse(json['invoice_items_id'].toString()),
      productName: json['product_name']?.toString(),
      ontPrice: int.tryParse(json['ont_price'].toString()),
      count: int.tryParse(json['count'].toString()),
      numberInvoice: int.tryParse(json['number_invoice'].toString()),
    );
  }

  Map<String, dynamic> toJson() => {
        if (invoiceId != null) 'invoice_id': invoiceId,
        if (clintName != null) 'clint_name': clintName,
        if (invoiceNumber != null) 'invoice_number': invoiceNumber,
        if (invoiceType != null) 'invoice_type': invoiceType,
        if (invoicePrice != null) 'invoice_price': invoicePrice,
        if (createTime != null) 'createTime': createTime,
        if (invoiceItemsId != null) 'invoice_items_id': invoiceItemsId,
        if (productName != null) 'product_name': productName,
        if (ontPrice != null) 'ont_price': ontPrice,
        if (count != null) 'count': count,
        if (numberInvoice != null) 'number_invoice': numberInvoice,
      };
}
