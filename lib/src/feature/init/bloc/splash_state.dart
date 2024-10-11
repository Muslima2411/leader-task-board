class SplashPageState {
  final int selectedIndex;
  final String currentLanguage;

  SplashPageState({
    required this.selectedIndex,
    required this.currentLanguage,
  });

  SplashPageState copyWith({
    int? selectedIndex,
    bool? splashVisited,
    String? currentLanguage,
  }) {
    return SplashPageState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      currentLanguage: currentLanguage ?? this.currentLanguage,
    );
  }
}
