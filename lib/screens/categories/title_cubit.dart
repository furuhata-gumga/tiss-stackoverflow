import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
abstract class TitleState {
  const TitleState();
}

@immutable
class InitTitleState extends TitleState {
  final bool value;
  const InitTitleState(this.value);
}

@immutable
class TitleTrueState extends TitleState {
  final bool value;
  const TitleTrueState(this.value);
}

@immutable
class TitleFalseState extends TitleState {
  final bool value;
  const TitleFalseState(this.value);
}

class TitleCubit extends Cubit<TitleState> {
  TitleCubit() : super(InitTitleState(false));

  void setTrue() {
    emit(TitleTrueState(true));
  }

  void setFalse() {
    emit(TitleFalseState(false));
  }
}