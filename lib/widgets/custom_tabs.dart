import 'package:grad_project/exports/exports.dart';

class CustomTabs extends StatefulWidget {
  final ValueChanged<int>? onTabSelected;
  const CustomTabs({super.key, this.onTabSelected});

  @override
  State<CustomTabs> createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  int selectedIndex = 0;
  final List<String> tabs = ['Favourites', 'Recents', 'All'];

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
                margin:  EdgeInsets.only(right: 16.0.w),
                padding:  EdgeInsets.symmetric(
                    vertical: 4.0.h, horizontal: 10.0.w),
                decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? AppColors.backgroundColor
                      : Colors.transparent,
                  border: selectedIndex == index
                      ? Border.all(
                          color: AppColors.primaryColor,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(16.r),
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
        const Spacer(),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppImages.categoryIcon,
                color: AppColors.secondTextColor,
                width: 24.w,
                height: 24.h,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
