import 'package:grad_project/exports/exports.dart';
import 'package:grad_project/widgets/custom_profile_fields.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBarTwo(
              leadingSvgPath: AppImages.backArrowIcon,
              title: 'Edit Profile',
              actionText: 'Save',
              onActionIconTap: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                  child: Column(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Container(
                                width: 132.w,
                                height: 132.h,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: Image.asset(
                                  AppImages.profileImage,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 18,
                              child: Container(
                                width: 28.0,
                                height: 28.0,
                                decoration: BoxDecoration(
                                  color: AppColors.arrowsColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1.0, color: Colors.white),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: SvgPicture.asset(
                                    AppImages.cameraIcon,
                                    color: AppColors.backgroundColor,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Name",
                                  style: AppTextStyles.hintTextStyle),
                            ),
                            SizedBox(height: 16.0.h),
                            CustomProfileFields(
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              hintText: 'Alvart Ainstain',
                              hintStyle: AppTextStyles.labelStyle,
                            ),
                            SizedBox(
                              height: 20.0.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Email",
                                style: AppTextStyles.hintTextStyle,
                              ),
                            ),
                            SizedBox(height: 16.0.h),
                            CustomProfileFields(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              hintText: 'albart.ainstain@gmail.com',
                              hintStyle: AppTextStyles.labelStyle,
                            ),
                            SizedBox(
                              height: 20.0.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Username",
                                  style: AppTextStyles.hintTextStyle),
                            ),
                            SizedBox(height: 16.0.h),
                            CustomProfileFields(
                              controller: userNameController,
                              keyboardType: TextInputType.text,
                              hintText: '@albart.ainstain',
                              hintStyle: AppTextStyles.labelStyle,
                            ),
                            SizedBox(
                              height: 20.0.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Number",
                                  style: AppTextStyles.hintTextStyle),
                            ),
                            SizedBox(height: 16.0.h),
                            CustomProfileFields(
                              controller: numberController,
                              keyboardType: TextInputType.number,
                              hintText: '+010 2120 112312',
                              hintStyle: AppTextStyles.labelStyle,
                            ),
                          ],
                        ),
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
