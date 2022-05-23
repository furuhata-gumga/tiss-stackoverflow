import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import '../webclient.dart';

const MESSAGES_URI =
    "https://gist.githubusercontent.com/GumgaMGA/e734afba2799880452f07af9326d39e8/raw/42e16ac8c7ca749511c3eae4c05baf7fdf7984c8/";

class I18NWebClient {
  final String _viewKey;
  final String language;

  I18NWebClient(this._viewKey, this.language);

  Future<Map<String, dynamic>> findAll() async {
    final Response response = await client.get(Uri.parse("$MESSAGES_URI$language$_viewKey.json"));
    final Map<String, dynamic> decodedJson = jsonDecode(response.body);

    return decodedJson;
  }
}