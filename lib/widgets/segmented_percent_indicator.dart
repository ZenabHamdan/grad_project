import 'package:grad_project/exports/exports.dart';

class SegmentedPercentIndicator extends StatelessWidget {
  final double todoPercentage;
  final double inProgressPercentage;
  final double completedPercentage;

  const SegmentedPercentIndicator(
      {super.key,
      required this.todoPercentage,
      required this.inProgressPercentage,
      required this.completedPercentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // To Do Segment
            CircularPercentIndicator(
              radius: 100.0.r,
              lineWidth: 20.0.sp,
              percent: 1.0,
              backgroundColor: Colors.transparent,
              progressColor: AppColors.toDoColor,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            // In Progress Segment
            CircularPercentIndicator(
              radius: 100.0.r,
              lineWidth: 20.0.sp,
              percent: inProgressPercentage / 100,
              startAngle: 270.0 + (360 * (todoPercentage / 100)),
              backgroundColor: Colors.transparent,
              progressColor: AppColors.primaryColor,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            

            // Completed Segment
            CircularPercentIndicator(
              radius: 100.0.r,
              lineWidth: 20.0.sp,
              percent: completedPercentage / 100,
              startAngle: 270.0 +
                  (360 * (todoPercentage / 100)) +
                  (360 * (inProgressPercentage / 100)),
              backgroundColor: Colors.transparent,
              progressColor: AppColors.completedColor,
              circularStrokeCap: CircularStrokeCap.round,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "65 %",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.headlinesColor,
                    ),
                  ),
                  Text(
                    'Complete',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Legend
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LegendItem(color: AppColors.toDoColor, label: 'To Do'),
              LegendItem(color: AppColors.primaryColor, label: 'In Progress'),
              LegendItem(color: AppColors.completedColor, label: 'Completed'),
            ],
          ),
        ),
      ],
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8.w,
          height: 8.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(width: 10.w),
        Text(label),
      ],
    );
  }
}

class TaskSummaryApp extends StatelessWidget {
  const TaskSummaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.0.w),
      child: Column(
        children: [
          TaskCard(
            title: 'Completed',
            taskNow: '18 Task now',
            taskDetails: '18 Task Completed',
            borderColor: AppColors.completedColor,
          ),
          SizedBox(height: 16.h),
          TaskCard(
            title: 'In Progress',
            taskNow: '2 Task now',
            taskDetails: '1 started',
            borderColor: Colors.grey.shade300,
          ),
          SizedBox(height: 16.h),
          TaskCard(
            title: 'To Do',
            taskNow: '2 Task now',
            taskDetails: '1 Upcoming',
            borderColor: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String taskNow;
  final String taskDetails;
  final Color borderColor;

  const TaskCard({
    required this.title,
    required this.taskNow,
    required this.taskDetails,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.w),
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: ListTile(
        title: Text(
          title,
          style: AppTextStyles.statusTitleTaskCardW500,
        ),
        subtitle: Text(
          '$taskNow • $taskDetails',
          style: AppTextStyles.statusTaskDetailsTaskCardW400,
        ),
        trailing: SvgPicture.asset(AppImages.moreIcon),
      ),
    );
  }
}
