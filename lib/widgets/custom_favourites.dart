import 'package:grad_project/exports/exports.dart';

class CustomFavourites extends StatelessWidget {
  final String title;
  final String subtitle;
  final int value;
  final int total;
  final Color progressBarColor;
  final Color progressBarBackgroundColor;
  final Color progressColor;

  const CustomFavourites(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.value,
      required this.total,
      required this.progressBarColor,
      required this.progressColor,
      required this.progressBarBackgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.favTitle,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  border: Border.all(color: progressColor),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  '$value/$total',
                  style: AppTextStyles.valueTotalStyle,
                ),
              ),
            ],
          ),
          Text(
            subtitle,
            style: AppTextStyles.favSubtitle,
          ),
          SizedBox(
            height: 7.0.h,
          ),
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.backgroundColor),
                    ),
                    child: Image.asset(AppImages.personImg4),
                  ),
                  Positioned(
                    left: 15.w,
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.backgroundColor),
                      ),
                      child: Image.asset(AppImages.personImg2),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20.0.w,
              ),
              Stack(
                children: [
                  Container(
                    width: 199.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: progressBarBackgroundColor,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  Container(
                    width: 83.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: progressBarColor,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
