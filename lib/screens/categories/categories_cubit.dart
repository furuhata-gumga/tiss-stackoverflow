import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiss/model/category.dart';

@immutable
abstract class CategoriesState {
  const CategoriesState();
}

@immutable
class InitCategoriesState extends CategoriesState {
  const InitCategoriesState();
}

@immutable
class LoadingCategoriesState extends CategoriesState {
  const LoadingCategoriesState();
}

@immutable
class LoadedCategoriesState extends CategoriesState {
  final List<Category> categories;
  const LoadedCategoriesState(this.categories);
}

@immutable
class AddCategoriesState extends CategoriesState {
  const AddCategoriesState();
}

@immutable
class AddingCategoriesState extends CategoriesState {
  const AddingCategoriesState();
}

@immutable
class CloseCategoriesState extends CategoriesState {
  const CloseCategoriesState();
}

@immutable
class FatalErrorCategoriesState extends CategoriesState {
  final String? _message;

  const FatalErrorCategoriesState(this._message);
}

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(const InitCategoriesState());

  List<Category> categories = [
    Category('Test 1', Colors.red),
    Category('Test 2', Colors.blueAccent),
  ];
  Color pickerColor = const Color(0xffffffff);
  Color currentColor = const Color(0xffffffff);
  bool isVisible = false;

  void reload() async {
    emit(const LoadingCategoriesState());
    await Future.delayed(const Duration(seconds: 2));
    emit(LoadedCategoriesState(categories));
  }

  void openModalAddCategory() {
    emit(const AddCategoriesState());
    emit(LoadedCategoriesState(categories));
  }

  void addCategory(String title) {
    emit(const AddingCategoriesState());
    Category category = Category(title, currentColor);
    categories.add(category);
    pickerColor = const Color(0xffffffff);
    currentColor = const Color(0xff443a49);
    isVisible = false;
    emit(LoadedCategoriesState(categories));
  }

  void reopenModal() {
    emit(const AddCategoriesState());
    emit(LoadedCategoriesState(categories));
  }

  void changeColor(Color color) {
    pickerColor = color;
  }

  void setColor() {
    currentColor = pickerColor;
  }

  bool getIsVisible() {
    return isVisible;
  }

  void setIsVisible(bool value) {
    isVisible = value;
  }

  Color getPickerColor() {
    return pickerColor;
  }
}