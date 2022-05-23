import 'package:http/http.dart';
import 'package:http_interceptor/http/http.dart';

import 'interceptors/logging_interceptor.dart';

// TODO cuidados caso voce queira thread safety, pool

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: const Duration(seconds: 5),
);

const String baseUrl = '';


