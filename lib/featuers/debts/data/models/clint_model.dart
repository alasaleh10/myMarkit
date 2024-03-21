class ClintModel {
  num? clintId;
  String? clintName;
  String? clintPhone;
  String? createTime;

  ClintModel({
    this.clintId,
    this.clintName,
    this.clintPhone,
    this.createTime,
  });

  factory ClintModel.fromJson(Map<String, dynamic> json) => ClintModel(
        clintId: num.tryParse(json['clint_id'].toString()),
        clintName: json['clint_name']?.toString(),
        clintPhone: json['clint_phone']?.toString(),
        createTime: json['createTime']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (clintId != null) 'clint_id': clintId,
        if (clintName != null) 'clint_name': clintName,
        if (clintPhone != null) 'clint_phone': clintPhone,
        if (createTime != null) 'createTime': createTime,
      };
}
