import 'package:carbon_credit_trading/services/check_validate.dart';
import 'package:carbon_credit_trading/theme/custome_textformfield.dart';
import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String labelText; // Thêm thuộc tính cho label text

  const CustomPasswordField({
    super.key,
    this.controller,
    this.validator,
    this.labelText = 'Mật khẩu', // Giá trị mặc định
  });

  @override
  CustomPasswordFieldState createState() => CustomPasswordFieldState();
}

class CustomPasswordFieldState extends State<CustomPasswordField> {
  bool obscureText = true; // Trạng thái ẩn hiện mật khẩu

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      validator: (value) {
        return Validators.validatePassword(value);
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.labelText, // Sử dụng labelText ở đây
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              obscureText = !obscureText; // Toggle password visibility
            });
          },
        ),
      ),
      obscureText: obscureText, // Truyền trạng thái ẩn hiện
    );
  }
}
