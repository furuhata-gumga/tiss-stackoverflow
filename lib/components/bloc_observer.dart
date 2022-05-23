
import 'package:flutter_bloc/flutter_bloc.dart';

class LogObserver extends BlocObserver {
  @override
  void onChange(BlocBase cubit, Change change) {
    print("${cubit.runtimeType} > $change");
    super.onChange(cubit, change);
  }
}