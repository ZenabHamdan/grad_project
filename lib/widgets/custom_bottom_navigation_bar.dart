import 'package:grad_project/exports/exports.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    ProjectScreen(),
    MessengerScreen(),
    ProfileScreen(),
  ];

  void onItemTapped(int index) {
    if (index == 2) {
       AddBottomSheet().showCustomBottomSheet(context);
    } else {
      setState(() {
        currentIndex = (index > 2) ? index - 1 : index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.backgroundColor,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.secondTextColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? SvgPicture.asset(AppImages.filledHomeIcon)
                : SvgPicture.asset(AppImages.homeIcon),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1
                ? SvgPicture.asset(AppImages.filledProjectIcon)
                : SvgPicture.asset(AppImages.projectsIcon),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: SvgPicture.asset(
                    AppImages.addIcon,
                    fit: BoxFit.contain,
                  ),
                ),),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 2
                ? SvgPicture.asset(AppImages.filledChatIcon)
                : SvgPicture.asset(AppImages.chatIcon),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 3
                ? SvgPicture.asset(AppImages.filledProfileIcon)
                : SvgPicture.asset(AppImages.profileIcon),
            label: '',
          ),
        ],
      ),
    );
  }
}
