import 'package:flutter/material.dart';
import 'package:design_flutter/constants.dart';
import 'package:design_flutter/widget/navigation_menu.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: Image.asset('assets/logo/toyota_logo.png', height: 250),
              ),
              Text(
                'LOGIN',
                style: TextStyle(
                  color: AppColors.title,
                  fontSize: FontSizes.title,
                  fontWeight: FontAttributes.bold,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: AppColors.greyText,
                  ),
                  hintStyle: TextStyle(color: AppColors.greyText),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.greyText),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.greyText),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.title),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _PasswordTextField(onPasswordChanged: (String) {}),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Quên mật khẩu ?',
                  style: TextStyle(color: AppColors.title, fontSize: 14),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavigationMenu(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.redButton,
                        minimumSize: const Size(0, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(color: AppColors.title, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(Icons.fingerprint, size: 40, color: AppColors.subTitle),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bạn không có tài khoản?",
                    style: TextStyle(color: AppColors.subTitle),
                  ),
                  Text(
                    " Tạo tài khoản mới",
                    style: TextStyle(
                      color: AppColors.redButton,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Text(
                "Hoặc đăng nhập bằng",
                style: TextStyle(color: AppColors.subTitle),
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/gg.png', height: 30),
                  SizedBox(width: 15),
                  Image.asset('assets/icons/fb.png', height: 30),
                ],
              ),
              SizedBox(height: 20),

              Text(
                "Đăng nhập với tư cách khách",
                style: TextStyle(
                  color: AppColors.subTitle,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PasswordTextField extends StatefulWidget {
  final Function(String) onPasswordChanged;

  const _PasswordTextField({required this.onPasswordChanged});

  @override
  State<_PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Mật khẩu',
        labelStyle: TextStyle(color: AppColors.greyText),
        prefixIcon: const Icon(Icons.lock, color: AppColors.greyText),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
            color: AppColors.greyText,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyText),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.greyText),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.title),
        ),
      ),
      style: TextStyle(color: AppColors.title),
      obscureText: _isObscure,
    );
  }
}
