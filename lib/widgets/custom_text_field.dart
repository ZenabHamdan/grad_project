import 'package:grad_project/exports/exports.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final InputDecoration? decoration;
  final TextStyle? textStyle;

  const MyTextField(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controller,
      this.validator,
      this.hintStyle,
      this.decoration,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        style: textStyle ??
            TextStyle(
              color: AppColors.headlinesColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(16.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                  style: BorderStyle.solid, color: AppColors.headlinesColor)),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.signInColor_1,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        validator: validator,
      ),
    );
  }
}
