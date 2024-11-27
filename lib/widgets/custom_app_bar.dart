import 'package:grad_project/exports/exports.dart';

class CustomAppBar extends StatelessWidget {
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
      this.onLeadingIconTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 30.0.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.borderColor),
              ),
              child: IconButton(
                onPressed: onLeadingIconTap ?? () {},
                icon: SvgPicture.asset(leadingSvgPath),
              ),
            ),
          ),
          Center(
            child: Text(
              title,
              style: AppTextStyles.title,
              textAlign: TextAlign.center,
            ),
          ),
          if (actionSvgPath != null)
            Align(
              alignment: Alignment.centerRight,
              child: Container(
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
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}

class CustomAppBarTwo extends StatelessWidget {
  final String leadingSvgPath;
  final String title;
  final String actionText;
  final VoidCallback? onActionIconTap;
  const CustomAppBarTwo(
      {super.key,
      required this.leadingSvgPath,
      required this.title,
      required this.actionText, this.onActionIconTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 30.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderColor),
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(leadingSvgPath),
            ),
          ),
          Text(
            title,
            style: AppTextStyles.title,
          ),
          InkWell(
            onTap: onActionIconTap ?? () {},
            child: Text(
              actionText,
              style: AppTextStyles.actionText,
            ),
          ),
        ],
      ),
    );
  }
}
