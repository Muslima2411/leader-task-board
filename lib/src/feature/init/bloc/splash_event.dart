import 'package:equatable/equatable.dart';

abstract class SplashPageEvent extends Equatable {
  const SplashPageEvent();

  @override
  List<Object> get props => [];
}

class ChangeSelectedIndex extends SplashPageEvent {
  final int selectedIndex;

  const ChangeSelectedIndex({this.selectedIndex = 0});

  @override
  List<Object> get props => [selectedIndex];
}

class ChangeCurrentLanguage extends SplashPageEvent {
  final String newLanguage;

  const ChangeCurrentLanguage(this.newLanguage);

  @override
  List<Object> get props => [newLanguage];
}
