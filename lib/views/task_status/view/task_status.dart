import 'package:grad_project/exports/exports.dart';

class TaskStatus extends StatelessWidget {
  final VoidCallback onBack;

  const TaskStatus({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                leadingSvgPath: AppImages.backArrowIcon,
                onLeadingIconTap: onBack,
                title: "Task Status",
                actionSvgPath: AppImages.filterIcon,
              ),
              SizedBox(
                height: 20.h,
              ),
              const SegmentedPercentIndicator(
                todoPercentage: 39,
                inProgressPercentage: 20,
                completedPercentage: 30,
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Monthly",
                  style: AppTextStyles.statusTitleMonthlyW600,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const TaskSummaryApp()
            ],
          ),
        ),
      ),
    );
  }
}
