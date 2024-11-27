import 'package:grad_project/exports/exports.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int value;
  final int total;
  final Color cardColor;
  final Color textColor;
  final Color subtitleColor;
  final Color progressBarColor;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.total,
    required this.cardColor,
    required this.progressBarColor,
    required this.textColor,
    required this.subtitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.w,
      height: 150.h,
      padding:  EdgeInsets.symmetric(horizontal:  14.0.w, vertical: 14.0.h),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.vector),),
          color: cardColor,
          border: Border.all(color: const Color(0xffEDF4FF)),
          borderRadius: BorderRadius.circular(16),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 12.0.h,
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: subtitleColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 26.0.h,
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
                    child: Image.asset(AppImages.personImg1),
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
                  Positioned(
                    left: 30.w,
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.backgroundColor),
                      ),
                      child: Image.asset(AppImages.personImg3),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 50.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Progress',
                        style: AppTextStyles.progressText,
                      ),
                      SizedBox(width: 40.w,),
                      Text(
                        '$value/$total',
                        style: AppTextStyles.total,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 114.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: progressBarColor,
                          borderRadius: BorderRadius.circular(2.5.r),
                        ),
                      ),
                      Container(
                        width: 63.w,
                        height: 5.h,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.circular(2.5.r),
                        ),
                      ),
                    ],
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
