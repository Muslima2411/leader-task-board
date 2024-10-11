// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:play_arena/src/data/entity/favorite_arena.dart';
// import 'package:play_arena/src/data/entity/otp_model.dart';
// import 'package:play_arena/src/data/entity/post_favorite_arena_model.dart';
//
// import '../../common/server/api/api.dart';
// import '../../common/server/api/api_constants.dart';
// import 'app_repository.dart';
//
// @immutable
// class AppRepositoryImpl implements AppRepository {
//   factory AppRepositoryImpl() => _impl;
//
//   const AppRepositoryImpl._internal();
//
//   static const AppRepositoryImpl _impl = AppRepositoryImpl._internal();
//
//   @override
//   Future<OtpModel?> verifyKey({required String key}) async {
//     try {
//       final String? response = await ApiService.postWithoutManualHeader(
//         ApiConst.verifyApi,
//         <String, dynamic>{"otp_key": key},
//       );
//       if (response != null) {
//         return otpModelFromJson(response);
//       }
//       return null;
//     } catch (e) {
//       debugPrint('Error verifying OTP key');
//       return null;
//     }
//   }
//
//   @override
//   Future<List<FavoriteArena>?> getAllFavArenas() async {
//     try {
//       final String? response = await ApiService.getWithToken(
//         ApiConst.getFavoriteArenas,
//         ApiParams.emptyParams(),
//       );
//       if (response != null) {
//         return favoriteArenaFromJson(response);
//       }
//       return [];
//     } catch (e) {
//       debugPrint('Error fetching favorite arenas: $e');
//       return [];
//     }
//   }
//
//   @override
//   Future<String?> postFavoriteArena(
//       {required PostFavArena postFavArena}) async {
//     try {
//       debugPrint('postFavArena: ${postFavArena.arena.id.toString()}');
//       final String? response = await ApiService.post(
//         "${ApiConst.postFavArenaByID}/${postFavArena.arena.id}/",
//         postFavArena.toJson(),
//       );
//
//       if (response != null) {
//         final Map<String, dynamic> jsonResponse = jsonDecode(response);
//         debugPrint('Response: $jsonResponse');
//
//         // Check if the response contains the "message" key
//         if (jsonResponse.containsKey('message')) {
//           return jsonResponse[
//               'message']; // Return the message from the response
//         } else {
//           debugPrint('Unexpected response format');
//           return null;
//         }
//       }
//
//       debugPrint('Response was null');
//       return null;
//     } catch (e) {
//       debugPrint('Error posting favorite arena: $e');
//       throw Error();
//       return null;
//     }
//   }
//
//   @override
//   Future<void> deleteFavArena({required String arenaId}) async {
//     debugPrint("deleting arena id - $arenaId");
//     try {
//       final response =
//           await ApiService.delete("${ApiConst.removeFavArenaByID}/$arenaId/");
//       debugPrint("Response: $response");
//     } catch (e) {
//       if (e is DioException && e.response?.statusCode == 404) {
//         debugPrint('Arena not found in favorites: ${e.response?.data}');
//       } else {
//         debugPrint('Error while deleting: $e');
//       }
//     }
//   }
// }
