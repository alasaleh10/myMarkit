class InvoiceModel {
  final int id;
  final String productName;
  final int count;
  final int onePrice;
  final int price;

  InvoiceModel(
      {required this.id,
      required this.productName,
      required this.count,
      required this.onePrice,
      required this.price});
}
