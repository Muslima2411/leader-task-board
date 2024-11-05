// import "dart:convert";
// import "dart:developer";
//
// import "../../common/server/api/api.dart";
// import "../../common/server/api/api_constants.dart";
//
// class ProfileRepository {
//   static Future getCurrentProfileData() async {
//     log("profile repo");
//     try {
//       final String? profileData =
//           await ApiService.getWithToken(ApiConst.getCurrentUserData, {});
//       log(jsonEncode(profileData));
//       log("profile repo");
//       return jsonDecode(profileData!);
//     } catch (e) {
//       log("$e");
//       return null;
//     }
//   }
// }
