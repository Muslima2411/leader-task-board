import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/src/feature/init/bloc/splash_event.dart';
import 'package:task_management_app/src/feature/init/bloc/splash_state.dart';

import '../../../common/local/app_storage.dart';

class SplashPageBloc extends Bloc<SplashPageEvent, SplashPageState> {
  SplashPageBloc()
      : super(SplashPageState(selectedIndex: 0, currentLanguage: ' ')) {
    on<ChangeSelectedIndex>((event, emit) {
      emit(state.copyWith(selectedIndex: event.selectedIndex));
    });
    on<ChangeCurrentLanguage>((event, emit) {
      emit(state.copyWith(currentLanguage: event.newLanguage));
    });
    _loadInitialLanguage();
  }

  Future<void> _loadInitialLanguage() async {
    final String? storedLanguage =
        await AppStorage.$read(key: StorageKey.locale);
    final String initialLanguage = storedLanguage ?? 'uz';
    emit(state.copyWith(currentLanguage: initialLanguage));
  }
}
