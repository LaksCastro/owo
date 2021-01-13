import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorInitial());

  @override
  Stream<ColorState> mapEventToState(
    ColorEvent event,
  ) async* {
    if (event is LoadColor) {
      if (state is ColorLoading) {
        return;
      }

      yield ColorLoading();

      await Future.delayed(Duration(seconds: 2));

      yield ColorLoaded(Colors.red);
    }
  }
}
