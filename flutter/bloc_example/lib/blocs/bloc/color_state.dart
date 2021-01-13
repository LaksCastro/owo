part of 'color_bloc.dart';

abstract class ColorState extends Equatable {
  const ColorState();

  @override
  List<Object> get props => [];
}

class ColorInitial extends ColorState {
  @override
  List<Object> get props => [];
}

class ColorLoaded extends ColorState {
  final Color color;

  const ColorLoaded(this.color);
}

class ColorLoading extends ColorState {}
