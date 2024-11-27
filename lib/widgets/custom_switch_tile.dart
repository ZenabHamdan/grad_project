import 'package:grad_project/exports/exports.dart';

class CustomSwitchTile extends StatefulWidget {
  final String label;
  final bool initialValue;
  final Color activeColor;

  const CustomSwitchTile(
      {super.key,
      required this.label,
      required this.initialValue,
      required this.activeColor});

  @override
  State<CustomSwitchTile> createState() => _CustomSwitchTileState();
}

class _CustomSwitchTileState extends State<CustomSwitchTile> {
  late bool isChecked;
  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.headlinesColor),
            ),
            CustomToggle(
              initialValue: widget.initialValue,
              onChanged: (value) {
                print('Toggle is $value');
              },
            )
          ],
        ),
      ),
    );
  }
}

class CustomSettingsRow extends StatelessWidget {
  final String label;
  final String icon;

  const CustomSettingsRow({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.headlinesColor,
            ),
          ),
          SvgPicture.asset(
            icon,
            color: AppColors.headlinesColor,
          ),
        ],
      ),
    );
  }
}
class CustomProfileRow extends StatelessWidget {
  final String label;
  final String icon;
  final VoidCallback onTap;

  const CustomProfileRow({
    Key? key,
    required this.label,
    required this.icon, required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56.h,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.headlinesColor,
              ),
            ),
            SvgPicture.asset(
              icon,
              color: AppColors.headlinesColor,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomToggle extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomToggle({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue; // Initialize with the given value
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked; // Toggle the value
        });
        widget.onChanged(isChecked); // Notify the parent widget of the change
      },
      child: Container(
        width: 35,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isChecked ? AppColors.primaryColor : const Color(0xFFD7D7D7),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          alignment: isChecked ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.all(2),
            width: 14,
            height: 14,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
