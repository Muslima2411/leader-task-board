import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/local/app_storage.dart';

class SplashPageCubit extends Cubit<int> {
  SplashPageCubit() : super(0);

  void changeSelectedIndex(int newIndex) => emit(newIndex);

  Future<void> saveSplashScreenVisited() async {
    await AppStorage.$write(key: StorageKey.splashVisited, value: 'true');
  }
}
