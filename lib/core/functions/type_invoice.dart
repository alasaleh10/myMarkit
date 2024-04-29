String invoiceType({required int invoiceType}) {
  if (invoiceType == 1) {
    return 'نقدا';
  } else {
    return 'اجل';
  }
}
