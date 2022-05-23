import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiss/http/webclients/i18n_webclient.dart';

import '../container.dart';
import 'i18n_cubit.dart';
import 'i18n_loadingview.dart';

class I18NLoadingContainer extends BlocContainer {
  I18NWidgetCreator creator;
  String viewKey;
  String language;

  I18NLoadingContainer({
    required this.creator,
    required this.viewKey,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<I18NMessagesCubit>(
      create: (BuildContext context) {
        final cubit = I18NMessagesCubit(viewKey);
        cubit.reload(I18NWebClient(viewKey, language));
        return cubit;
      },
      child: I18NLoadingView(creator),
    );
  }
}
