import 'package:grad_project/exports/exports.dart';

class CustomProfileFields extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final TextStyle hintStyle;

  const CustomProfileFields({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.hintStyle,
  });

  @override
  State<CustomProfileFields> createState() => _CustomProfileFieldsState();
}

class _CustomProfileFieldsState extends State<CustomProfileFields> {
  bool isFocused = false; 

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          onTap: () {
            setState(() {
              isFocused = true; 
            });
          },
          onEditingComplete: () {
            setState(() {
              isFocused = false; 
            });
          },
          decoration: InputDecoration(
            fillColor: AppColors.backgroundColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: AppColors.borderColor,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: AppColors.borderColor,
                width: 1,
              ),
            ),
            
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: AppColors.borderSideColor, 
                width: 1,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 18,
            ),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
          ),
        ),
      ],
    );
  }
}
