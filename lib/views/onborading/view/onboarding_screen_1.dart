import 'package:grad_project/exports/exports.dart';
import 'package:grad_project/widgets/custom_button.dart';

class OnboardingScreen1 extends StatefulWidget {
  final VoidCallback onSkip;
  final VoidCallback onNext;
  const OnboardingScreen1({super.key,required this.onSkip,
    required this.onNext});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen1> {
  int currentPage = 0;
  final int pageCount = 3;

  @override
  Widget build(BuildContext context) {
        return SafeArea(
          child: Scaffold(
          body: SingleChildScrollView(
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
                  currentPage: currentPage,
                  pageCount: pageCount,
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
                  style: AppTextStyles.onboard_title,
                  textAlign: TextAlign.center,
                ),
                Text("Building Better\nWorkplaces",
                    style: AppTextStyles.onboard_text,
                    textAlign: TextAlign.center),
                SizedBox(height: 10.h),
                Text(
                    "Create a unique emotional story that\ndescribes better than words",
                    style: AppTextStyles.onboard_description,
                    textAlign: TextAlign.center),
                SizedBox(height: 42.h),
                CustomButton(
                  height: 60.h,
                  width: 295.w,
                  text: "Get Started",
                  textStyle: AppTextStyles.onboard_buttton,
                  isGlowing: true,
                  onTap: widget.onNext
                ),
                SizedBox(height: 56.h)
              ],
            ),
          ),
              ),
        );
  }
}
