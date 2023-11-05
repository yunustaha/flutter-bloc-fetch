part of 'products_cubit.dart';

class ProductsInitial extends Equatable {
  final FetchStatus fetchStatus;
  final ProductsModel products;

  const ProductsInitial(this.fetchStatus, this.products);

  ProductsInitial copyWith({int? counterValue, FetchStatus? fetchStatus, ProductsModel? products}) {
    return ProductsInitial(fetchStatus ?? this.fetchStatus, products ?? this.products);
  }

  @override
  List<Object?> get props => [fetchStatus, products];
}

enum FetchStatus { init, loading, success, error }
