import "package:flutter/cupertino.dart";
import "package:flutter/services.dart";
import "package:intl/date_symbol_data_file.dart";
import "package:l/l.dart";
import "app.dart";
import "common/local/app_storage.dart";

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await getStorageValues();
  runApp(MyApp());
  // initializeDateFormatting("ru_RU", null).then((_) => runApp(MyApp()));
}

String? token;

Future<void> getStorageValues() async {
  token = await AppStorage.$read(key: StorageKey.splashVisited);
  l.w(token ??
      "------\n------------\n-----------\n-------"
          " ====================================");
}
