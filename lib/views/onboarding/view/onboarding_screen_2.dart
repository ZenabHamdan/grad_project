import 'package:grad_project/exports/exports.dart';

class OnboardingScreen2 extends StatefulWidget {
  final VoidCallback onSkip;
  final VoidCallback onNext;

  OnboardingScreen2({super.key, required this.onSkip, required this.onNext});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  top: 40.h,
                  left: 0,
                  child: SvgPicture.asset(
                    AppImages.circles,
                    fit: BoxFit.cover,
                    width: 380.w,
                    height: 434.h,
                  ),
                ),
                Positioned(
                  top: 266.h,
                  left: 144.w,
                  child: Image.asset(
                    AppImages.image1,
                    width: 213.w,
                    height: 130.h,
                  ),
                ),
                Positioned(
                  top: 190.h,
                  left: 26.w,
                  child: Image.asset(
                    AppImages.image2,
                    width: 194.w,
                    height: 90.h,
                  ),
                ),
                Positioned(
                  top: 70.h,
                  left: 127.w,
                  child: Image.asset(
                    AppImages.image3,
                    width: 186.w,
                    height: 96.h,
                  ),
                ),
                Positioned(
                  top: 485.h,
                  left: 30.w,
                  child: Text(
                    "Task Management",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Positioned(
                    top: 518.h,
                    left: 30.w,
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Let's create a\n",
                          style: AppTextStyles.onboardDescription2,
                        ),
                        TextSpan(
                          text: 'space ',
                          style: AppTextStyles.onboardDescription2.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: 'for your\nworkflows.',
                          style: AppTextStyles.onboardDescription2,
                        ),
                      ]),
                    )),
                Positioned(
                  top: 720.h,
                  left: 30.w,
                  child: OnboardingIndicator(
                      currentPage: 0,
                      pageCount: 3,
                      inactiveWidth: 8,
                      inactiveHeight: 8,
                      activeHeight: 6,
                      activeWidth: 20,
                      inactiveColor: AppColors.pinkColor_2),
                ),
                Positioned(
                  top: 760.h,
                  left: 30.w,
                  child: GestureDetector(
                    onTap: widget.onSkip,
                    child: Text(
                      'Skip',
                      style: AppTextStyles.onboardDescription2.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 650.h,
                  left: 290.w,
                  child: Image.asset(AppImages.rectangle),
                ),
                Positioned(
                  top: 746.h,
                  left: 325.w,
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
