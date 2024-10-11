final class ApiConst {
  const ApiConst._();

  static const Duration connectionTimeout = Duration(minutes: 1);
  static const Duration sendTimeout = Duration(minutes: 1);

  static const String baseUrl = "https://backend.playarenas.uz";

  // Courses api
  static const String getAllArenas = "/arena/arenas";
  static const String getArenaById = "/arena/arenas";
  static const String version = "/ru";

  static const String verifyApi = "$version/otp/verify/";

  static const String getCurrentUserData = "/users/user_info";

  static const String getFavoriteArenas = "$version/favourites/list/";
  static const String postFavArenaByID = "$version/favourites/add";
  static const String removeFavArenaByID = "$version/favourites/remove";

  static const String refreshToken = "$version/otp/token/refresh/";
}

final class ApiParams {
  const ApiParams._();

  static Map<String, dynamic> emptyParams() => <String, dynamic>{};

  static Map<String, dynamic> cabinetSmsCheckParams(
          {required String phone, required String code}) =>
      <String, dynamic>{
        "phone": phone,
        "code": code,
      };
}
