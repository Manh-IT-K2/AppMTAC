import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mtac/configs/api_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterService extends GetxService {
   // initial url
  final String baseUrl = ApiConfig.baseUrl;

  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final url = Uri.parse("$baseUrl/register");

    final response = await http.post(
      url,
      body: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final accessToken = data['access_token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', accessToken);
      return true;
    } else {
      if (kDebugMode) {
        print("Đăng ký thất bại: ${response.body}");
      }
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse("$baseUrl/login");

    final response = await http.post(
      url,
      body: {
        'username': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final accessToken = data['access_token'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', accessToken);
      return true;
    } else {
      print("Đăng nhập thất bại: ${response.body}");
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
      print("Lấy thông tin user thất bại: ${response.body}");
      return null;
    }
  }
}
