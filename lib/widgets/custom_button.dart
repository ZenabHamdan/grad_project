import 'package:grad_project/exports/exports.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Color textColor;
  final TextStyle textStyle;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isGlowing;

  const CustomButton(
      {super.key,
        required this.height,
        required this.width,
        required this.text,
        this.textColor = Colors.white,
        required this.textStyle,
        this.backgroundColor,
        required this.onTap,
        this.isGlowing = false,

      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: backgroundColor == null // Use gradient if backgroundColor is not set
              ? LinearGradient(
            colors: [
              AppColors.lightOrangeColor,
              AppColors.primaryColor,
            ],
            stops: [0.4, 1.0]
          )
              : null,
          color: backgroundColor,
            boxShadow: isGlowing
              ?[
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.2),
                  blurRadius: 8.0.r,
                  spreadRadius: 8.0.r,
                ),
            ]
              :[]
        ),

          child: Center(
            child:
                  Text(
                    text,
                    style: textStyle,
                  ),
          ),
        ),
    );}
}