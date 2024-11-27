import 'package:grad_project/exports/exports.dart';

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({super.key});

  @override
  State<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  TextEditingController nameTeamController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomAppBar(
                leadingSvgPath: AppImages.backArrowIcon,
                onLeadingIconTap: () {
                  Navigator.pop(context);
                },
                title: "Create Team",
              ),
            ),
            SizedBox(
              width: 400,
              height: 200,
              child: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/xacademy.svg',
                      width: 238.w,
                      height: 44.h,
                    ),
                    Positioned(
                      right: -70,
                      child: SvgPicture.asset(
                        'assets/images/focal X.svg',
                        
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Team Name",
                        style: AppTextStyles.nameForAddTask,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      TextField(
                        style: AppTextStyles.title,
                        controller: nameTeamController,
                        decoration: InputDecoration(
                          hintText: "Team Align",
                          hintStyle: AppTextStyles.teamAlignStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                              color: AppColors.borderColor,
                              width: 1.0.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        "Team Member",
                        style: AppTextStyles.nameForAddTask,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          // Aligns content properly
                          children: [
                            const Column(
                              children: [
                                SelectableAvatar(
                                  imagePath: "assets/images/ava_1.png",
                                  nameAvatar: "Jeny",
                                )
                              ],
                            ),
                            SizedBox(width: 10.w),
                            const Column(
                              children: [
                                SelectableAvatar(
                                  imagePath: "assets/images/ava_4.png",
                                  nameAvatar: "mehrin",
                                )
                              ],
                            ),
                            SizedBox(width: 10.w),
                            const Column(
                              children: [
                                SelectableAvatar(
                                  imagePath: "assets/images/ava_2.png",
                                  nameAvatar: "Alex",
                                )
                              ],
                            ),
                            SizedBox(width: 10.w),

                            const Column(
                              children: [
                                SelectableAvatar(
                                  imagePath: "assets/images/ava_3.png",
                                  nameAvatar: "Jafor",
                                )
                              ],
                            ),
                            SizedBox(width: 10.w),

                            // Fixing the last column without adding text
                            Column(
                              children: [
                                Container(
                                  width: 43,
                                  height: 43,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                    ),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.add_sharp,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                // Add spacing to align with other columns
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Divider(
                        color: AppColors.borderColor,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        "Type",
                        style: AppTextStyles.nameForAddTask,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        height: 40.h,
                        child: ListView.separated(
                          itemBuilder: (context, index) =>
                              CategoryItem(categoryName: typeCreateTeam[index]),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 16.w,
                          ),
                          itemCount: typeCreateTeam.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: SizedBox(
                          width: 218.w,
                          height: 48.h,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  AppColors.primaryColor),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      16.r), // Adjust the radius here
                                ),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Create Team",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.0.h,),
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
