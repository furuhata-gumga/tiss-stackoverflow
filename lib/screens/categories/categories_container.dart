import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiss/screens/categories/categories_cubit.dart';
import 'package:tiss/screens/categories/categories_view.dart';
import 'package:tiss/screens/categories/title_cubit.dart';
import '../../components/container.dart';
import '../../components/localization/i18n_container.dart';
import '../../components/localization/localization_container.dart';
import 'categories_i18n.dart';

class CategoriesContainer extends BlocContainer {
  CategoriesContainer();

  //I18N is used to internationalization, but its implementation is not ready yet, so all the content is still in portuguese
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesCubit>(
          create: (_) {
            final cubit = CategoriesCubit();
            cubit.reload();
            return cubit;
          },
        ),
        BlocProvider<TitleCubit>(
          create: (_) => TitleCubit(),
        ),
      ],
      child: I18NLoadingContainer(
        language: BlocProvider.of<CurrentLocaleCubit>(context).state,
        viewKey: "Presentation",
        creator: (messages) =>
            CategoriesView(CategoriesViewLazyI18N(messages)),
      ),
    );
  }
}
