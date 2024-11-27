import 'package:grad_project/exports/exports.dart';

class MonthsList extends StatefulWidget {
  final List<Map<String, String>> months;
  const MonthsList({super.key, required this.months});

  @override
  State<MonthsList> createState() => _MonthsListState();
}

class _MonthsListState extends State<MonthsList> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.months.length,
          itemBuilder: (context, index) {
            final monthData = widget.months[index];
            final isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(right: 12.0.w),
                width: 64.w,
                height: 118.h,
                decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.backgroundColor,
                    border: Border.all(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(16.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      monthData['date']!,
                      style: isSelected
                          ? AppTextStyles.dateSelectedStyle
                          : AppTextStyles.dateStyle,
                    ),
                    SizedBox(
                      height: 8.0.h,
                    ),
                    Text(
                      monthData['day']!,
                      style: isSelected
                          ? AppTextStyles.daySelectedStyle
                          : AppTextStyles.dayStyle,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}