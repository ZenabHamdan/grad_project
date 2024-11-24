import 'package:grad_project/exports/exports.dart';
import 'package:grad_project/widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 30.0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.borderColor),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppImages.categoryIcon),
                    ),
                  ),
                  Text(
                    "Friday, 26",
                    style: AppTextStyles.title,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.borderColor),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(AppImages.notificationsIcon),
                    ),
                  ),
                ],
              ),
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
                                  progressBarColor:
                                      cardsData[index].progressBarColor,
                                  textColor: cardsData[index].textColor,
                                  subtitleColor: cardsData[index].subtitleColor,
                                ),
                              );
                            }),
                      ),
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
