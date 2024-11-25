import 'package:grad_project/exports/exports.dart';

class OnboardingScreen4 extends StatefulWidget {
  final VoidCallback onSkip;
  final VoidCallback onNext;
  const OnboardingScreen4(
      {super.key, required this.onSkip, required this.onNext});

  @override
  State<OnboardingScreen4> createState() => _OnboardingScreen4State();
}

class _OnboardingScreen4State extends State<OnboardingScreen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 146.h,
              left: 4.w,
              child: Image.asset(
                AppImages.person_2,
                width: 375.w,
                height: 292.h,
              ),
            ),
            Positioned(
              top: 118.h,
              left: 16.w,
              child: Image.asset(
                AppImages.box_3,
                width: 140.w,
                height: 87.h,
              ),
            ),
            Positioned(
              top: 276.h,
              left: 223.w,
              child: Image.asset(
                AppImages.box_4,
                width: 140.w,
                height: 85.h,
              ),
            ),

            PositionedCircle(
                top: 46.h,
                left: 289.w,
                diameter: 8.w,
                color: AppColors.textColor),
            PositionedCircle(
                top: 67.h,
                left: 330.w,
                diameter: 12.w,
                color: AppColors.primaryColor),
            PositionedCircle(
                top: 47.9.h,
                left: 91.04.w,
                diameter: 4.w,
                color: AppColors.primaryColor),
            PositionedCircle(
                top: 73.h,
                left: 16.w,
                diameter: 6.w,
                color: AppColors.pinkColor),
            PositionedCircle(
                top: 113.h,
                left: 304.w,
                diameter: 4.w,
                color: AppColors.pinkColor),
            PositionedCircle(
                top: 372.h,
                left: -24.w,
                diameter: 56.w,
                color: AppColors.beigeColor),
            Positioned(
                top: 485.h,
                left: 30.w,
                child: Text("Task Management",
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.primaryColor,
                    ))),
            Positioned(
                top: 518.h,
                left: 30.w,
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Manage your\n",
                      style: AppTextStyles.onboard_description2,
                    ),
                    TextSpan(
                      text: 'Tasks',
                      style: AppTextStyles.onboard_description2.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: ' quickly for\nResults✌',
                      style: AppTextStyles.onboard_description2,
                    ),
                  ]),
                )),
            Positioned(
              top: 680.h,
              left: 30.w,
              child: OnboardingIndicator(
                  currentPage: 2,
                  pageCount: 3,
                  inactiveWidth: 8,
                  inactiveHeight: 8,
                  activeHeight: 6,
                  activeWidth: 20,
                  inactiveColor: AppColors.pinkColor_2),
            ),
            Positioned(
              top: 740.h,
              left: 30.w,
              child: GestureDetector(
                onTap: widget.onSkip,
                child: Text(
                  'Skip',
                  style: AppTextStyles.onboard_description2.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 630.h,
              left: 237.w,
              child: Container(
                height: 200.h,
                width: 180.w,
                child: Image.asset(AppImages.rectangle),
              ),
            ),
            Positioned(
              top: 746.h,
              left: 330.w,
              child: GestureDetector(
                onTap: widget.onNext,
                child: SvgPicture.asset(AppImages.arrowRightIcon),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
