import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/repositories/category/category_repository.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscripiton;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is LoadCategories) {
      yield* _mapLoadCategoriesToState();
    }
    if (event is UpdateCategories) {
      yield* _mapUpdateCategoriesToState(event);
    }
  }

  Stream<CategoryState> _mapLoadCategoriesToState() async* {
    _categorySubscripiton?.cancel();
    _categorySubscripiton =
        _categoryRepository.getAllCategories().listen((category) {
      return add(UpdateCategories(category));
    });
  }

  Stream<CategoryState> _mapUpdateCategoriesToState(
      UpdateCategories event) async* {
    yield CategoryLoaded(categories: event.categories);
  }
}
