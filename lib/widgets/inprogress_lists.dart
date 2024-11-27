import 'package:grad_project/exports/exports.dart';

class InprogressLists extends StatelessWidget {
  final String category;
  final String title;
  final String time;
  final double progress;

  const InprogressLists(
      {super.key,
      required this.title,
      required this.time,
      required this.category,
      required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: const EdgeInsets.symmetric(vertical: 8,),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border.all(color: AppColors.borderSideColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: AppTextStyles.listTitle,
                ),
                SizedBox(
                  height: 6.0.h,
                ),
                Text(
                  title,
                  style: AppTextStyles.listMainTitle,
                ),
                SizedBox(
                  height: 6.0.h,
                ),
                Text(
                  time,
                  style: AppTextStyles.listTitle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircularPercentIndicator(
              radius: 25.r,
              lineWidth: 4.w,
              percent: progress / 100,
              center: Text(
                "${progress.toInt()}%",
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              progressColor: AppColors.primaryColor,
              backgroundColor: const Color(0xffFFC07B),
              circularStrokeCap: CircularStrokeCap.round,
            ),
          )
        ],
      ),
    );
  }
}
