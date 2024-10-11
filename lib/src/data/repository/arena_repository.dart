// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:play_arena/src/common/server/api/api_constants.dart';
// import 'package:play_arena/src/data/entity/arena_model.dart';
//
// import '../../common/server/api/api.dart';
//
// class ArenaRepository {
//   static Future<List<Arena>?> getArenas(Map<String, dynamic> params) async {
//     try {
//       var arenasJson = await ApiService.get(ApiConst.getAllArenas, params);
//       if (arenasJson != null) {
//         return arenaFromJson(arenasJson);
//       } else {
//         log("API response is null");
//         return null;
//       }
//     } catch (e, stacktrace) {
//       log("Error fetching arenas: $e");
//       log("Stacktrace: $stacktrace");
//       return null;
//     }
//   }
//
//   static Future<Arena?> getArenaById(int id) async {
//     try {
//       var arena = await ApiService.get(ApiConst.getArenaById, {'id': id});
//       if (arena != null) {
//         Arena arenaModel = Arena.fromJson(jsonDecode(arena));
//         log(arenaModel.toString());
//         return arenaModel;
//       } else {
//         log("API response is null for getArenaById");
//         return null;
//       }
//     } catch (e, stacktrace) {
//       log("Error fetching arena by id: $e");
//       log("Stacktrace: $stacktrace");
//       return null;
//     }
//   }
// }
