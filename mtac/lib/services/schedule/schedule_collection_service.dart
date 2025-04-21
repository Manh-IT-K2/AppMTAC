import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mtac/configs/api_config.dart';
import 'package:mtac/models/schedule_collection_today_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleCollectionService {
  // initial url
  final String baseUrl = ApiConfig.baseUrl;

  Future<List<ScheduleCollectionTodayModel>> fetchTodaySchedule() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    if (token == null) throw Exception('Chưa có token, cần login lại');

    final response = await http.get(
      Uri.parse('$baseUrl/api/schedule-today'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final body = json.decode(response.body);

      if (body['status'] == true) {
        List<dynamic> data = body['data'];

        return data
            .map((json) => ScheduleCollectionTodayModel.fromMap(json))
            .toList();
      } else {
        throw Exception('Lỗi từ server: status = false');
      }
    } else if (response.statusCode == 403) {
      throw Exception('Không có quyền (scope không đủ)');
    } else if (response.statusCode == 401) {
      throw Exception('Chưa đăng nhập hoặc token hết hạn');
    } else {
      throw Exception('Lỗi kết nối API: ${response.statusCode}');
    }
  }
}
