import 'package:fake_store/utils/colors.dart';
import 'package:fake_store/utils/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({
    super.key,
    required this.title,
    this.isPassword = false,
    required this.hintText,
    required this.controller,
  });

  final TextEditingController controller;
  final String title;
  final String hintText;
  final bool isPassword;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        12.ph,
        TextField(
          keyboardType: TextInputType.text,
          textInputAction:
              widget.isPassword ? TextInputAction.done : TextInputAction.next,
          maxLength: 20,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: AppColors.c2B2B2B, fontFamily: 'Poppins'),
          obscureText: _isObscured,
          controller: widget.controller,
          decoration: InputDecoration(
            counterText: "",
            contentPadding: EdgeInsets.symmetric(
                horizontal: editW(14), vertical: editH(16)),
            fillColor: AppColors.cF7F7F9,
            hintText: widget.hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppColors.c6A6A6A, fontFamily: 'Poppins'),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                    icon: Icon(
                        !_isObscured ? Icons.visibility : Icons.visibility_off))
                : const SizedBox(),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: const BorderSide(color: Colors.transparent)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(14.r)),
          ),
        ),
      ],
    );
  }
}
