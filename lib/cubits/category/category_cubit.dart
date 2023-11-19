import 'package:equatable/equatable.dart';
import 'package:fake_store/data/network/api_service.dart';
import 'package:fake_store/services/service_locator/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryState(categories: [])){
    getAllCategories();
  }

  Future<void> getAllCategories()async{
    final data = await getIt.get<ApiService>().getAllCategories();
    emit(CategoryState(categories: data.data));
    debugPrint("C:${state.categories}");
  }

}

