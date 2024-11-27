import 'package:grad_project/exports/exports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showTaskStatus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: showTaskStatus
            ? TaskStatus(
                onBack: () {
                  setState(() {
                    showTaskStatus = false;
                  });
                },
              )
            : Column(
                children: [
                  CustomAppBar(
                    leadingSvgPath: AppImages.backArrowIcon,
                    onLeadingIconTap: () {
                      Navigator.pushNamed(context, Routes.home);
                    },
                    title: 'Profile',
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 132.w,
                                  height: 132.h,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: Image.asset(
                                    AppImages.profileImage,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Positioned(
                                  child: SvgPicture.asset(
                                      AppImages.profileCircles),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0.h,
                            ),
                            Text(
                              'Alvart Ainstain',
                              style: AppTextStyles.nameStyle,
                            ),
                            SizedBox(
                              height: 8.0.h,
                            ),
                            Text(
                              '@albart.ainstain',
                              style: AppTextStyles.userNameStyle,
                            ),
                            SizedBox(
                              height: 8.0.h,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.editProfile);
                              },
                              child: Container(
                                width: 54.w,
                                height: 28.h,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.borderSideColor,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                  child: Text(
                                    'Edit',
                                    style: AppTextStyles.editStyle,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 28.0.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // First Column
                                Column(
                                  children: [
                                    SvgPicture.asset(AppImages.onGoingIcon),
                                    SizedBox(
                                      height: 6.0.h,
                                    ),
                                    Text(
                                      '5',
                                      style: AppTextStyles.nameStyle,
                                    ),
                                    SizedBox(
                                      height: 4.0.h,
                                    ),
                                    Text(
                                      'On Going',
                                      style: AppTextStyles.userNameStyle,
                                    ),
                                  ],
                                ),
                                //Divider
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 36.0),
                                  child: Column(
                                    children: List.generate(
                                      8,
                                      (index) => Container(
                                        width: 1,
                                        height: 5,
                                        color: AppColors.borderColor,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 2),
                                      ),
                                    ),
                                  ),
                                ),
                                // Second Column
                                Column(
                                  children: [
                                    SvgPicture.asset(AppImages.onGoingIcon),
                                    SizedBox(
                                      height: 6.0.h,
                                    ),
                                    Text(
                                      '25',
                                      style: AppTextStyles.nameStyle,
                                    ),
                                    SizedBox(
                                      height: 4.0.h,
                                    ),
                                    Text(
                                      'Total Complete',
                                      style: AppTextStyles.userNameStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 37.h,
                            ),
                            CustomProfileRow(
                              label: 'My Projects',
                              icon: AppImages.arrowIcon,
                              onTap: () {
                                Navigator.pushNamed(context, Routes.sideMenu);
                              },
                            ),
                            SizedBox(height: 16.h),
                            CustomProfileRow(
                              label: 'Join a Team',
                              icon: AppImages.arrowIcon,
                              onTap: () {
                                Navigator.pushNamed(context, Routes.search);
                              },
                            ),
                            SizedBox(height: 16.h),
                            CustomProfileRow(
                              label: 'Settings',
                              icon: AppImages.arrowIcon,
                              onTap: () {
                                Navigator.pushNamed(context, Routes.settings);
                              },
                            ),
                            SizedBox(height: 16.h),
                            CustomProfileRow(
                              label: 'My Task',
                              icon: AppImages.arrowIcon,
                              onTap: () {
                                setState(() {
                                  showTaskStatus = true;
                                });
                              },
                            ),
                            SizedBox(height: 40.h),
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
