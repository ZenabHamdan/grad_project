import 'package:grad_project/exports/exports.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.borderColor),
                    ),
                    child: IconButton(
                      icon: SvgPicture.asset(AppImages.backArrowIcon),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 95.0.w),
                  Text(
                    'Settings',
                    style: AppTextStyles.title,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      CustomSwitchTile(
                        label: 'Permissiom',
                        initialValue: true,
                        activeColor: AppColors.primaryColor,
                      ),
                      const SizedBox(height: 22),
                      const CustomSwitchTile(
                        label: 'Push Notification',
                        initialValue: false,
                        activeColor: Color(0xffD7D7D7),
                      ),
                      const SizedBox(height: 22),
                      const CustomSwitchTile(
                        label: 'Dark Mood',
                        initialValue: false,
                        activeColor: Color(0xffD7D7D7),
                      ),
                      const SizedBox(height: 22),
                      CustomSettingsRow(
                        label: 'Security',
                        icon: AppImages.arrowIcon,
                      ),
                      const SizedBox(height: 22),
                      CustomSettingsRow(
                        label: 'Help',
                        icon: AppImages.arrowIcon,
                      ),
                      const SizedBox(height: 22),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, Routes.language);
                        },
                        child: CustomSettingsRow(
                          label: 'Langauge',
                          icon: AppImages.arrowIcon,
                        ),
                      ),
                      const SizedBox(height: 22),
                      CustomSettingsRow(
                        label: 'About Application',
                        icon: AppImages.arrowIcon,
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
