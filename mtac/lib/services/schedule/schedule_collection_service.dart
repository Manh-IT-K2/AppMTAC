import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mtac/configs/api_config.dart';
import 'package:mtac/models/schedule_collection_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleCollectionService {
  // initial url
  final String baseUrl = ApiConfig.baseUrl;

  // Function get token
  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    if (token == null) throw Exception('Chưa có token, cần login lại');
    return token;
  }

  // Functionhandle response
  List<ScheduleCollectionModel> _handleResponse(http.Response response) {
    if (response.statusCode != 200) {
      throw Exception(
        'Lỗi HTTP: ${response.statusCode} - ${response.reasonPhrase}',
      );
    }

    final body = json.decode(response.body);
    if (body['status'] != true) {
      throw Exception('Lỗi từ server: ${body['message'] ?? 'Không rõ lý do'}');
    }

    return (body['data'] as List)
        .map((json) => ScheduleCollectionModel.fromMap(json))
        .toList();
  }

  // get list schedule today
  Future<List<ScheduleCollectionModel>> fetchTodaySchedule() async {
    try {
      final token = await _getToken();

      final response = await http.get(
        Uri.parse('$baseUrl/api/schedule-today'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      return _handleResponse(response);
    } catch (e, stacktrace) {
      debugPrint('Lỗi khi fetch schedule today: $e');
      debugPrint('Stacktrace: $stacktrace');
      rethrow;
    }
  }

  // get list schedule arranged
  Future<List<ScheduleCollectionModel>> fetchArrangedSchedule() async {
    try {
      final token = await _getToken();

      final response = await http.get(
        Uri.parse('$baseUrl/api/schedule-arranged'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      return _handleResponse(response);
    } catch (e, stacktrace) {
      debugPrint('Lỗi khi fetch schedule arranged: $e');
      debugPrint('Stacktrace: $stacktrace');
      rethrow;
    }
  }

   // get list schedule notyet
  Future<List<ScheduleCollectionModel>> fetchNotYetSchedule() async {
    try {
      final token = await _getToken();

      final response = await http.get(
        Uri.parse('$baseUrl/api/schedule-notyet'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      return _handleResponse(response);
    } catch (e, stacktrace) {
      debugPrint('Lỗi khi fetch schedule notyet: $e');
      debugPrint('Stacktrace: $stacktrace');
      rethrow;
    }
  }


  // delete schedule collection
  Future<bool> deleteScheduleCollection(int id) async {
    final token = await _getToken();

    final url = Uri.parse('$baseUrl/api/schedule/$id');
    final response = await http.delete(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("Delete successfully");
      }
      return true;
    } else {
      if (kDebugMode) {
        print("Error: ${response.body}");
      }
      return false;
    }
  }
}
