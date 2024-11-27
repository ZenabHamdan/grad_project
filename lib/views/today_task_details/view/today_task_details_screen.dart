import 'package:grad_project/exports/exports.dart';

class TodayTaskDetailsScreen extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onNavigateToMonthly;

  const TodayTaskDetailsScreen(
      {super.key, required this.onBack, required this.onNavigateToMonthly});

  @override
  State<TodayTaskDetailsScreen> createState() => _TodayTaskDetailsScreenState();
}

class _TodayTaskDetailsScreenState extends State<TodayTaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              leadingSvgPath: AppImages.backArrowIcon,
              onLeadingIconTap: widget.onBack,
              title: 'Today Task',
              actionSvgPath: AppImages.editIcon,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'October, 20 ✍',
                                  style: AppTextStyles.headline,
                                ),
                                SizedBox(height: 4.0.h),
                                Text(
                                  '15 task today',
                                  style: AppTextStyles.taskSubtitle,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.borderColor),
                            ),
                            child: IconButton(
                              onPressed: widget.onNavigateToMonthly,
                              icon: SvgPicture.asset(AppImages.calenderIcon),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      DaysList(days: days),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      ScheduleView(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
