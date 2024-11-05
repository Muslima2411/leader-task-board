import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_management_app/src/data/entity/task_model.dart';
import '../../common/server/api/api.dart';
import '../../common/server/api/api_constants.dart';
import 'app_repository.dart';

@immutable
class AppRepositoryImpl implements AppRepository {
  factory AppRepositoryImpl() => _impl;

  const AppRepositoryImpl._internal();

  static const AppRepositoryImpl _impl = AppRepositoryImpl._internal();

  @override
  Future<Map<String, List<TaskModel>>?> getAllInfo() async {
    try {
      final String? response = await ApiService.get(
        ApiConst.getAllInfo,
        ApiParams.emptyParams(),
      );

      if (response != null) {
        // Parse the JSON response into a Map<String, List<TaskModel>>
        final Map<String, dynamic> jsonData = json.decode(response);

        // Convert the Map to a Map<String, List<TaskModel>>
        return jsonData.map((key, value) {
          List<TaskModel> tasks = List<TaskModel>.from(
              value.map((taskJson) => TaskModel.fromJson(taskJson)));
          return MapEntry(key, tasks);
        });
      }

      return null; // Return null if response is null
    } catch (e) {
      debugPrint('Error fetching tasks: $e');
      return null; // Return null on error
    }
  }
}
