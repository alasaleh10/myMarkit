class DebetsModel {
  num? debtsId;
  String? continet;
  num? price;
  num? idClint;
  String? createTime;

  DebetsModel({
    this.debtsId,
    this.continet,
    this.price,
    this.idClint,
    this.createTime,
  });

  factory DebetsModel.fromJson(Map<String, dynamic> json) => DebetsModel(
        debtsId: num.tryParse(json['debts_id'].toString()),
        continet: json['continet']?.toString(),
        price: num.tryParse(json['price'].toString()),
        idClint: num.tryParse(json['id_clint'].toString()),
        createTime: json['createTime']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (debtsId != null) 'debts_id': debtsId,
        if (continet != null) 'continet': continet,
        if (price != null) 'price': price,
        if (idClint != null) 'id_clint': idClint,
        if (createTime != null) 'createTime': createTime,
      };
}
