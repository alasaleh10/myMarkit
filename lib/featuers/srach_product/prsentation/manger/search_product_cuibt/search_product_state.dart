part of 'search_product_cubit.dart';


sealed class SearchProductState {}

final class SearchProductInitial extends SearchProductState {}
final class SearchProductLoading extends SearchProductState {}

final class SearchProductSucsess extends SearchProductState 
{
  final List<ProductModel> prodcust;

  SearchProductSucsess({required this.prodcust});
}
final class SearchProductFailure extends SearchProductState 
{
  final String errorMessage;

  SearchProductFailure({required this.errorMessage});
}


