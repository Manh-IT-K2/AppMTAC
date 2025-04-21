import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mtac/configs/api_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  
  // initial url
  final String baseUrl = ApiConfig.baseUrl;
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse("$baseUrl/login");

    final response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Lấy access token đúng chỗ
      final accessToken = data['details']?['access_token'];

      if (accessToken != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', accessToken);
        return true;
      } else {
        if (kDebugMode) {
          print("Không tìm thấy access_token trong response: ${response.body}");
        }
        return false;
      }
    } else {
      if (kDebugMode) {
        print("Đăng nhập thất bại: ${response.body}");
      }
      return false;
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
  }

  Future<Map<String, dynamic>?> getProfile() async {
    final token = await getToken();
    if (token == null) return null;

    final response = await http.get(
      Uri.parse("$baseUrl/me"),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      if (kDebugMode) {
        print("Lấy thông tin user thất bại: ${response.body}");
      }
      return null;
    }
  }

  //
  Future<bool> checkServerStatus() async {
  final url = Uri.parse(ApiConfig.baseUrl); // hoặc Uri.parse("$baseUrl/ping")

  try {
    final response = await http.get(url).timeout(const Duration(seconds: 5));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (kDebugMode) {
        print("✅ Server is running: ${response.body}");
      }
      return true;
    } else {
      if (kDebugMode) {
        print("⚠️ Server responded with status: ${response.statusCode}");
      }
      return false;
    }
  } catch (e) {
    if (kDebugMode) {
      print("❌ Không thể kết nối đến server: $e");
    }
    return false;
  }
}

}
