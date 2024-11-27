import 'package:grad_project/exports/exports.dart';

class MonthlyTaskScreen extends StatefulWidget {
   final VoidCallback onBack;
  const MonthlyTaskScreen({super.key, required this.onBack});

  @override
  State<MonthlyTaskScreen> createState() => _MonthlyTaskScreenState();
}

class _MonthlyTaskScreenState extends State<MonthlyTaskScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              leadingSvgPath: AppImages.backArrowIcon,
              onLeadingIconTap: widget.onBack,
              title: 'Monthly Task',
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
                                  'September, 12 ✍',
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
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.borderColor),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                AppImages.calenderIcon,
                                color: AppColors.backgroundColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      MonthsList(months: months),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      CustomCalendar(),
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
