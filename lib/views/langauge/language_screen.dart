import 'package:grad_project/exports/exports.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    final languages = ['English', 'Arabic', 'Spanish', 'French'];
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
              title: "Language",
            ),
            Expanded(
              child: Column(
                children: languages.map((language) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(12.0.r),
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      height: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            language,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.headlinesColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedLanguage = language;
                              });
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: _selectedLanguage == language
                                      ? AppColors.primaryColor
                                      : const Color(0xFF868D95), 
                                  width: 1.0, 
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  width:
                                      16, 
                                  height: 16, 
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _selectedLanguage == language
                                        ? AppColors
                                            .primaryColor 
                                        : Colors
                                            .transparent, 
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageContainer(String language) {
    return Column(
      children: [
        Container(
          height: 58.h,
          child: RadioListTile<String>(
            value: language,
            groupValue: _selectedLanguage,
            onChanged: (val) {
              setState(() {
                _selectedLanguage = val!;
              });
            },
            activeColor: AppColors.primaryColor,
            title: Text(language),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
        ),
      ],
    );
  }
}
