import 'package:grad_project/exports/exports.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              leadingSvgPath: AppImages.backArrowIcon,
              onLeadingIconTap: () {
                Navigator.pop(context);
              },
              title: 'Search',
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                  child: Column(
                    children: [
                      CustomSearchBar(controller: searchController),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      CustomSearchTabs(),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      const CustomFavourites(
                        title: 'Unity Dashboard ☺',
                        subtitle: 'Design',
                        value: 10,
                        total: 20,
                        progressBarColor: Color(0xffB0D97F),
                        progressColor: Color(0xffB0D97F),
                        progressBarBackgroundColor: Color(0xffECF4E5),
                      ),
                      const CustomFavourites(
                        title: 'Instagram Shots ✍',
                        subtitle: 'Marketing',
                        value: 10,
                        total: 20,
                        progressBarColor: Color(0xffFFE1AC),
                        progressColor: Color(0xffFFE1AC),
                        progressBarBackgroundColor: Color(0xffF4F0E4),
                      ),
                      const CustomFavourites(
                        title: 'Cubbles 🤓',
                        subtitle: 'Design',
                        value: 10,
                        total: 20,
                        progressBarColor: Color(0xff96C2FF),
                        progressColor: Color(0xff96C2FF),
                        progressBarBackgroundColor: Color(0xffE8EDF4),
                      ),
                      const CustomFavourites(
                        title: 'Ui8 Platfrom 🤠',
                        subtitle: 'Design',
                        value: 10,
                        total: 20,
                        progressBarColor: Color(0xffB2D29D),
                        progressColor: Color(0xffB2D29D),
                        progressBarBackgroundColor: Color(0xffECF4E5),
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
