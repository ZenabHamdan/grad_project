import 'package:grad_project/exports/exports.dart';

class OnboardingScreen1 extends StatelessWidget {
  final VoidCallback onSkip;
  final VoidCallback onNext;
  OnboardingScreen1({super.key, required this.onSkip, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Transform.translate(
                offset: Offset(78.w, -12.h),
                child: SvgPicture.asset(
                  AppImages.logoImage,
                  fit: BoxFit.cover,
                  width: 393.92.w,
                  height: 412.99.h,
                ),
              ),
              OnboardingIndicator(
                currentPage: 0,
                pageCount: 3,
                gradiant: LinearGradient(
                  colors: [
                    AppColors.orangeColor,
                    AppColors.primaryColor,
                  ],
                  stops: [0.1, 1.0],
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Tasky",
                style: AppTextStyles.onboardTitle,
                textAlign: TextAlign.center,
              ),
              Text("Building Better\nWorkplaces",
                  style: AppTextStyles.onboardText,
                  textAlign: TextAlign.center),
              SizedBox(height: 10.h),
              Text(
                  "Create a unique emotional story that\ndescribes better than words",
                  style: AppTextStyles.onboardDescription,
                  textAlign: TextAlign.center),
              SizedBox(height: 42.h),
              CustomButton(
                height: 60.h,
                width: 295.w,
                text: "Get Started",
                textStyle: AppTextStyles.onboardButton,
                isGlowing: true,
                onTap: onNext,
              ),
              SizedBox(height: 56.h)
            ],
          ),
        ),
      ),
    );
  }
}
