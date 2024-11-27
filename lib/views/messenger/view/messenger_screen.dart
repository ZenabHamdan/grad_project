import 'package:grad_project/exports/exports.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              leadingSvgPath: AppImages.backArrowIcon,
              onLeadingIconTap: () {
                Navigator.pushNamed(context, Routes.home);
              },
              title: "Chat",
              actionSvgPath: AppImages.addIcon,
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff6f7fa),
                  borderRadius: BorderRadius.all(Radius.circular(13.r)),
                  border: Border.all(
                    color: const Color(0xfff6f7fa),
                  ),
                ),
                child: const SearchBox(),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            //Avatar_1
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ListView.separated(
                  itemCount: ChatScreen().chatData.length,
                  itemBuilder: (context, index) {
                    final data = ChatScreen().chatData[index];
                    return ChatItem(
                      name: data["name"],
                      stateSeen: data["stateSeen"],
                      notificationCount: data["notificationCount"],
                      avatarImagePath: data["avatarImagePath"],
                      isOnline: data["isOnline"],
                    );
                  },
                  
                  separatorBuilder: (context, index) => Padding(
                    padding:  EdgeInsets.symmetric(vertical: 8.0.h),
                    child: Divider(
                      color: AppColors.borderColor,
                      thickness: 1,
                    ),
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
