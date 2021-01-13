part of 'color_bloc.dart';

abstract class ColorEvent extends Equatable {
  const ColorEvent();
}

class LoadColor extends ColorEvent {
  @override
  List<Object> get props => [];
}
