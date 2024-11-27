import 'package:grad_project/exports/exports.dart';

class OptionItem extends StatelessWidget {
  final String svgIconPath;
  final String label;
  final VoidCallback onTap;
  const OptionItem(
      {super.key,
      required this.svgIconPath,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color:AppColors.borderColor),
          borderRadius: BorderRadius.circular(12.r)
        ),
        child: ListTile(
          leading: SvgPicture.asset(svgIconPath),
          title: Text(label, style: AppTextStyles.labelStyle,),
        ),
      ),
    );
  }
}
