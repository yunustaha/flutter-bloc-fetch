import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../products/services/products/service.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsInitial> {
  ProductsCubit() : super( ProductsInitial(FetchStatus.init, ProductsModel())) {
    _init();
  }

  void _init() async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));

      ProductsService productsService = ProductsService();

      ProductsModel data = await productsService.getProducts();

      emit(state.copyWith(products: data));
      emit(state.copyWith(fetchStatus: FetchStatus.success));
    } catch (e) {
      // print(e);
      emit(state.copyWith(fetchStatus: FetchStatus.error));
    }
  }

  // @override
  // void onChange(Change<ProductsInitial> change) {
  //   super.onChange(change);
  //   print('previous status ${change.currentState.fetchStatus} ');
  //   print('present status ${change.nextState.fetchStatus} ');
  // }
}
