import 'package:grad_project/exports/exports.dart';

class CustomSearchTabs extends StatefulWidget {
  final ValueChanged<int>? onTabSelected;
  const CustomSearchTabs({super.key, this.onTabSelected});

  @override
  State<CustomSearchTabs> createState() => _CustomSearchTabsState();
}

class _CustomSearchTabsState extends State<CustomSearchTabs> {
  int selectedIndex = 0;
  final List<String> tabs = ['Tasks', 'File'];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            tabs.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                if (widget.onTabSelected != null) {
                  widget.onTabSelected!(index);
                }
              },
              child: Container(
                margin: const EdgeInsets.only(right: 16.0),
                padding: const EdgeInsets.symmetric(
                    vertical: 4.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? AppColors.backgroundColor
                      : Colors.transparent,
                  border: selectedIndex == index
                      ? Border.all(
                          color: AppColors.completedColor,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: selectedIndex == index
                        ? AppColors.headlinesColor
                        : AppColors.secondTextColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        
      ],
    );
  }
}