// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchController on _SearchControllerBase, Store {
  Computed<bool> _$waitingTypeComputed;

  @override
  bool get waitingType =>
      (_$waitingTypeComputed ??= Computed<bool>(() => super.waitingType,
              name: '_SearchControllerBase.waitingType'))
          .value;
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_SearchControllerBase.loading'))
      .value;

  final _$textAtom = Atom(name: '_SearchControllerBase.text');

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  final _$resultsAtom = Atom(name: '_SearchControllerBase.results');

  @override
  ObservableList<Resource> get results {
    _$resultsAtom.reportRead();
    return super.results;
  }

  @override
  set results(ObservableList<Resource> value) {
    _$resultsAtom.reportWrite(value, super.results, () {
      super.results = value;
    });
  }

  final _$notFoundAtom = Atom(name: '_SearchControllerBase.notFound');

  @override
  bool get notFound {
    _$notFoundAtom.reportRead();
    return super.notFound;
  }

  @override
  set notFound(bool value) {
    _$notFoundAtom.reportWrite(value, super.notFound, () {
      super.notFound = value;
    });
  }

  final _$loadResultsAsyncAction =
      AsyncAction('_SearchControllerBase.loadResults');

  @override
  Future loadResults() {
    return _$loadResultsAsyncAction.run(() => super.loadResults());
  }

  final _$_SearchControllerBaseActionController =
      ActionController(name: '_SearchControllerBase');

  @override
  dynamic setText(dynamic value) {
    final _$actionInfo = _$_SearchControllerBaseActionController.startAction(
        name: '_SearchControllerBase.setText');
    try {
      return super.setText(value);
    } finally {
      _$_SearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo = _$_SearchControllerBaseActionController.startAction(
        name: '_SearchControllerBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_SearchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
text: ${text},
results: ${results},
notFound: ${notFound},
waitingType: ${waitingType},
loading: ${loading}
    ''';
  }
}
