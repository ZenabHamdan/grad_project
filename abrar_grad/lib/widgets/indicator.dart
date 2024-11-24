import 'package:grad_project/exports/exports.dart';

class OnboardingIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final Color? activeColor;
  final Color? inactiveColor;
  final LinearGradient? gradiant;
  final double activeWidth;
  final double inactiveWidth;
  final double activeHeight;
  final double inactiveHeight;

  OnboardingIndicator({
    required this.currentPage,
    required this.pageCount,
    this.activeColor,
    this.inactiveColor,
    this.gradiant,
    this.activeWidth = 25,
    this.inactiveWidth = 5,
    this.activeHeight = 6.0,
    this.inactiveHeight = 6.0
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 100),
          margin: EdgeInsets.symmetric(horizontal: 3.0.w),
          height:currentPage == index ? activeHeight.h :inactiveHeight.h ,
          width: currentPage == index ? activeWidth.w : inactiveWidth.w ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.r),
            gradient: currentPage == index
            ? gradiant
            : null,
            color: currentPage == index
                ? activeColor ?? AppColors.primaryColor
                : inactiveColor ?? AppColors.orangeColor,
          ),
        );
      }),
    );
  }
}
