import 'package:flutter/material.dart';
import 'package:mtac/configs/api_config.dart';
import 'package:mtac/controllers/user/login_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ApiConfig _apiConfig = ApiConfig();
  final LoginController _loginController = LoginController();

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    final serverIsUp = await _apiConfig.checkServerStatus();

    if (serverIsUp) {
      await Future.delayed(const Duration(milliseconds: 500));
      _loginController.checkLoginStatus();
    } else {
      _showServerError();
    }
  }

  void _showServerError() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Lỗi kết nối"),
        content: const Text("Không thể kết nối đến máy chủ. Vui lòng kiểm tra mạng hoặc thử lại sau."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _initializeApp(); // thử lại
            },
            child: const Text("Thử lại"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
