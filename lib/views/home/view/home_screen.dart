import 'package:grad_project/exports/exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showTodayTaskDetails = false;
  bool _showMonthlyTask = false;

  @override
  Widget build(BuildContext context) {
    Widget currentView;
    if (_showMonthlyTask) {
      currentView = MonthlyTaskScreen(
        onBack: () {
          setState(() {
            _showMonthlyTask = false; // Return to TodayTaskDetailsScreen
          });
        },
      );
    } else if (_showTodayTaskDetails) {
      currentView = TodayTaskDetailsScreen(
        onBack: () {
          setState(() {
            _showTodayTaskDetails = false; // Return to Home content
          });
        },
        onNavigateToMonthly: () {
          setState(() {
            _showMonthlyTask = true; // Navigate to MonthlyTaskScreen
          });
        },
      );
    } else {
      currentView = _buildHomeContent();
    }

    return Container(
      color: AppColors.backgroundColor,
      child: SafeArea(
        child: currentView,
      ),
    );
  }

  Widget _buildHomeContent() {
    return Column(
      children: [
        CustomAppBar(
          leadingSvgPath: AppImages.categoryIcon,
          onLeadingIconTap: () {
            setState(() {
              _showTodayTaskDetails = true; // Show TodayTaskDetailsScreen
            });
          },
          title: 'Friday, 26',
          actionSvgPath: AppImages.notificationsIcon,
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Let’s make a \nhabits together 🙌',
                      style: AppTextStyles.headline,
                    ),
                  ),
                  SizedBox(
                    height: 30.0.h,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cardsData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: CustomCard(
                            title: cardsData[index].title,
                            subtitle: cardsData[index].subtitle,
                            value: cardsData[index].value,
                            total: cardsData[index].total,
                            cardColor: cardsData[index].cardColor,
                            progressBarColor: cardsData[index].progressBarColor,
                            textColor: cardsData[index].textColor,
                            subtitleColor: cardsData[index].subtitleColor,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "In Progress",
                        style: AppTextStyles.title2,
                      ),
                      const Spacer(),
                      SvgPicture.asset(AppImages.arrowLeftIcon),
                    ],
                  ),
                  SizedBox(
                    height: 20.0.h,
                  ),
                  InprogressListsData(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
