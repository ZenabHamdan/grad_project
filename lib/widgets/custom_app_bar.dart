import 'package:grad_project/exports/exports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String leadingSvgPath;
  final String title;
  final String? actionSvgPath;
  final Color? iconColor;
  final VoidCallback? onLeadingIconTap;

  CustomAppBar(
      {super.key,
      required this.leadingSvgPath,
      required this.title,
      this.actionSvgPath,
      this.iconColor,
      this.onLeadingIconTap
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 30.0.h),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderColor),
            ),
            child: IconButton(
              onPressed:onLeadingIconTap ?? () {},
              icon: SvgPicture.asset(leadingSvgPath),
            ),
          ),
          SizedBox(width: 70.w),
          Text(
            title,
            style: AppTextStyles.title,
          ),
          if (actionSvgPath != null)
            Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.borderColor),
              ),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  actionSvgPath!,
                  color: iconColor ?? AppColors.headlinesColor,
                ),
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(220.h);
}
