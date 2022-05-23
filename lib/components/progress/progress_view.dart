import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiss/components/progress/progress.dart';

class ProgressView extends StatelessWidget {
  final String message;

  ProgressView({this.message = "Sending..."});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Progress(
        message: message,
      ),
    );
  }
}
