import 'package:grad_project/exports/exports.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController controller;

  const CustomSearchBar({super.key, required this.controller});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
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
        contentPadding: const EdgeInsets.symmetric(vertical: 17.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: AppColors.borderColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: AppColors.borderSideColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: AppColors.borderColor,
            width: 1,
          ),
        ),
        hintText: "Search",
        hintStyle: AppTextStyles.hintTextStyle,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(AppImages.searchIcon),
        ),
      ),
    );
  }
}
