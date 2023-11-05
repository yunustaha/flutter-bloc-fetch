import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'products_cubit.dart';
import 'services/products/model.dart';

class ProductsView extends StatelessWidget {
  final String title;

  const ProductsView({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(child: BlocBuilder<ProductsCubit, ProductsInitial>(builder: (context, state) {
        return products(state.products, state.fetchStatus);
      })),
    );
  }

  Widget products(ProductsModel? data, FetchStatus status) {
    switch (status) {
      case FetchStatus.loading:
        return const Text('Loading');
      case FetchStatus.success:
        if (data != null) {
          return SingleChildScrollView(
            child: Column(
              children: data.products.map<Widget>((e) {
                return Text('${e.title}');
              }).toList(),
            ),
          );
        }
        return const Text('Hiçbir ürün bulunamadı!');
      case FetchStatus.error:
        return const Text('Beklenmedik bir hata oluştu!');
      default:
        return const Text('İstek gönderilemedi!');
    }
  }
}
