class InvoiveClintModel {
  num? invoiceId;
  String? clintName;
  num? invoiceType;
  num? invoiceNumber;
  num? invoicePrice;

  InvoiveClintModel(
      {this.invoiceId,
      this.clintName,
      this.invoiceType,
      this.invoicePrice,
      this.invoiceNumber});

  factory InvoiveClintModel.fromJson(Map<String, dynamic> json) {
    return InvoiveClintModel(
        invoiceId: num.tryParse(json['invoice_id'].toString()),
        clintName: json['clint_name']?.toString(),
        invoiceType: num.tryParse(json['invoice_type'].toString()),
        invoicePrice: num.tryParse(json['invoice_price'].toString()),
        invoiceNumber: num.tryParse(json['invoice_number'].toString()));
  }

  Map<String, dynamic> toJson() => {
        if (invoiceId != null) 'invoice_id': invoiceId,
        if (clintName != null) 'clint_name': clintName,
        if (invoiceType != null) 'invoice_type': invoiceType,
        if (invoicePrice != null) 'invoice_price': invoicePrice,
      };
}
