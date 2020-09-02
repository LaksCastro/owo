import 'dart:async';

import 'package:flutter_starter_kit/src/blocs/form/form_provider.dart';

class _FormBloc {
  final provider = FormProvider();
  final formController = StreamController<String>();

  Stream get getForm => formController.stream;

  void setUsername(value) {
    provider.setUsername(value);
  }

  String getUsername() {
    return provider.username;
  }

  void dispose() {
    formController.close(); // close our StreamController to avoid memory leak
  }
}

final bloc = _FormBloc();
