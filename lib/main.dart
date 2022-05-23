import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiss/components/theme/theme.dart';
import 'package:tiss/screens/categories/categories_container.dart';

import 'components/localization/localization_container.dart';

void main() async {
  //Return an instance after async response
  WidgetsFlutterBinding.ensureInitialized();

  //Firebase Initialization
  await Firebase.initializeApp();

  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FirebaseCrashlytics.instance.setUserIdentifier('alura123');
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  //Run app
  BlocOverrides.runZoned(() {
    runApp(TissApp());
  },
    // blocObserver: LogObserver(),
  );
}

class TissApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //Evitar log do genero em PRODUÇÃO para não vazar informações sensíveis para o log
    // Bloc.observer = LogObserver();

    return MaterialApp(
      title: 'Tiss',
      theme: tissTheme(context),
      debugShowCheckedModeBanner: false,
      home: LocalizationContainer(
        child: CategoriesContainer(),
        // child: const MyHomePage(),
      ),
      // home: const Presentation(),
    );
  }
}
