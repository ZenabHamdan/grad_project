import 'package:grad_project/exports/exports.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      AppImages.closeIcon,
                      color: AppColors.headlinesColor,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: 132.w,
                              height: 132.h,
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Image.asset(
                                AppImages.profileImage,
                                fit: BoxFit.contain,
                              ),
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
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                                width: 110.w,
                                height: 38.h,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.borderSideColor,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                  child: Text(
                                    'View Profile',
                                    style: AppTextStyles.editStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.0.h,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Workspace",
                        style: AppTextStyles.statusTitleMonthlyW600,
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.borderColor, width: 1.w),
                          borderRadius: BorderRadius.circular(16.sp),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Ui Design',
                              style: AppTextStyles.label,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 65.w,
                                height: 28.h,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.borderSideColor,
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Center(
                                  child: Text(
                                    'Invite',
                                    style: AppTextStyles.editStyle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.0.h,
                      ),
                      Text(
                        "Manage",
                        style: AppTextStyles.statusTitleMonthlyW600,
                      ),
                      SizedBox(
                        height: 20.0.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding:  EdgeInsets.symmetric(
                                  horizontal: 20.0.w, vertical: 18.0.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.borderColor, width: 1.w),
                                borderRadius: BorderRadius.circular(16.sp),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Team',
                                    style: AppTextStyles.label,
                                  ),
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  Container(
                                    width: 40.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.borderColor,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '8',
                                        style: AppTextStyles.editStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Container(
                              padding:  EdgeInsets.symmetric(
                                  horizontal: 20.0.w, vertical: 18.0.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.borderColor, width: 1.w),
                                borderRadius: BorderRadius.circular(16.sp),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Labels',
                                    style: AppTextStyles.label,
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Container(
                                    width: 40.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.borderColor,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '13',
                                        style: AppTextStyles.editStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.0.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding:  EdgeInsets.symmetric(
                                  horizontal: 20.0.w, vertical: 18.0.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.borderColor, width: 1.w),
                                borderRadius: BorderRadius.circular(16.sp),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Task',
                                    style: AppTextStyles.label,
                                  ),
                                  SizedBox(
                                    width: 34.w,
                                  ),
                                  Container(
                                    width: 40.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.borderColor,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '8',
                                        style: AppTextStyles.editStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Container(
                              padding:  EdgeInsets.symmetric(
                                  horizontal: 20.0.w, vertical: 18.0.h),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.borderColor, width: 1.w),
                                borderRadius: BorderRadius.circular(16.sp),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Member',
                                    style: AppTextStyles.label,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Container(
                                    width: 40.w,
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.borderColor,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '13',
                                        style: AppTextStyles.editStyle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 39.h,
                      ),
                      CustomButton(
                        height: 50.h,
                        width: 327.w,
                        backgroundColor: AppColors.primaryColor,
                        text: "Log Out",
                        textStyle: AppTextStyles.signin,
                        isGlowing: false,
                        onTap: () async {
                          // Clear login data
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.remove('isLoggedIn');
                          await prefs.remove('token');

                          // Navigate to the sign-in screen
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.signIn,
                            (route) => false, // Remove all previous routes
                          );
                        },
                      ),
                      SizedBox(
                        height: 40.h,
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
