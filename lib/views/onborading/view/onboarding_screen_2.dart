import 'package:grad_project/exports/exports.dart';

class OnboardingScreen2 extends StatefulWidget {
  final VoidCallback onSkip;
  final VoidCallback onNext;

  const OnboardingScreen2({super.key,required this.onSkip,
    required this.onNext});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context)
            .size
            .height,
        child: Stack(
          children: [
            Positioned(
              top: 40.h,
              left: 0,
              child: SvgPicture.asset(
                AppImages.circles,
                fit: BoxFit.cover,
                width: 369.w,
                height: 434.h,
              ),
            ),
            Positioned(
              top: 266.h,
              left: 144.w,
              child: Image.asset(
                AppImages.image_1,
                width: 213.w,
                height: 130.h,
              ),
            ),
            Positioned(
              top: 190.h,
              left: 26.w,
              child: Image.asset(
                AppImages.image_2,
                width: 194.w,
                height: 90.h,
              ),
            ),
            Positioned(
              top: 70.h,
              left: 127.w,
              child: Image.asset(
                AppImages.image_3,
                width: 186.w,
                height: 96.h,
              ),
            ),
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
                      text: "Let's create a\n",
                      style: AppTextStyles.onboard_description2,
                    ),
                    TextSpan(
                      text: 'space ',
                      style: AppTextStyles.onboard_description2.copyWith(
                        color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    TextSpan(
                      text: 'for your\nworkflows.',
                      style: AppTextStyles.onboard_description2,
                    ),
                  ]),
                )),
            Positioned(
              top: 680.h,
              left: 30.w,
              child: OnboardingIndicator(currentPage: 0, pageCount: 3, inactiveWidth: 8,inactiveHeight: 8,activeHeight: 6,activeWidth: 20,inactiveColor: AppColors.pinkColor_2),
            ),
            Positioned(
              top: 740.h,
              left: 30.w,
              child: GestureDetector(
                onTap:widget.onSkip,
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
                onTap:widget.onNext,
                child: SvgPicture.asset(AppImages.arrowRightIcon),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
