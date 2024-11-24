import 'package:grad_project/exports/exports.dart';

class OnboardingScreen3 extends StatefulWidget {
  final VoidCallback onSkip;
  final VoidCallback onNext;
  const OnboardingScreen3(
      {super.key, required this.onSkip, required this.onNext});

  @override
  State<OnboardingScreen3> createState() => _OnboardingScreen3State();
}

class _OnboardingScreen3State extends State<OnboardingScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [

            Positioned(
              top: 80.h,
              left: -4.w,
              child: Container(
                height: 389.h,
                width: 370.w,
                child: Image.asset(
                  AppImages.person,
                ),
              ),
            ),
            Positioned(
              top: 126.h,
              left: 7.w,
              child: Image.asset(
                AppImages.box_2,
                width: 140.w,
                height: 40.h,
              ),
            ),
            Positioned(
              top: 205.h,
              left: 227.w,
              child: Image.asset(
                AppImages.box_1,
                width: 140.w,
                height: 40.h,
              ),
            ),
            PositionedCircle(
                top: 43.h,
                left: 289.w,
                diameter: 8.w,
                color: AppColors.textColor),
            PositionedCircle(
                top: 64.h,
                left: 330.w,
                diameter: 12.w,
                color: AppColors.textColor),
            PositionedCircle(
                top: 72.9.h,
                left: 100.w,
                diameter: 4.w,
                color: AppColors.primaryColor),
            PositionedCircle(
                top: 119.h,
                left: 29.w,
                diameter: 6.w,
                color: AppColors.pinkColor),
            PositionedCircle(
                top: 366.h,
                left: -24.w,
                diameter: 56.w,
                color: AppColors.beigeColor),
            PositionedCircle(
                top: 135.h,
                left: 304.w,
                diameter: 4.w,
                color: AppColors.pinkColor),
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
                      text: "Work more\n",
                      style: AppTextStyles.onboard_description2,
                    ),
                    TextSpan(
                      text: 'Structured',
                      style: AppTextStyles.onboard_description2.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    TextSpan(
                      text: ' and\nOrganized 👌',
                      style: AppTextStyles.onboard_description2,
                    ),
                  ]),
                )),
            Positioned(
              top: 680.h,
              left: 30.w,
              child: OnboardingIndicator(currentPage: 1, pageCount: 3,inactiveWidth: 8,inactiveHeight: 8,activeHeight: 6,activeWidth: 20,inactiveColor: AppColors.pinkColor_2),
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
              top: 670.h,
              left: 241.w,
              child: CustomPaint(
                size: Size(190.w, 180.h),
                painter: CurvedRectanglePainter(),
              ),
            ),
            Positioned(
              top: 671.h,
              left: 273.w,
              child: CustomPaint(
                size: Size(140.w, 150.h),
                painter: ArcPainter(),
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
