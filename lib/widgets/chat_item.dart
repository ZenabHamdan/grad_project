import 'package:grad_project/exports/exports.dart';

class ChatItem extends StatelessWidget {
  final String name;
  final String stateSeen;
  final int notificationCount;
  final String avatarImagePath;
  final bool isOnline;

  const ChatItem({
    super.key,
    required this.name,
    required this.stateSeen,
    required this.notificationCount,
    required this.avatarImagePath,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfilePictureWithStatus(
          avatarImagePath: avatarImagePath,
          isOnline: isOnline,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: SizedBox(
            height: 40.0.sp.h,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.nameSelectForBoard,
                ),
                Text(
                  stateSeen,
                  style: AppTextStyles.dateActiveStyle,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
        SvgPicture.asset(AppImages.cameraIcon)
      ],
    );
  }
}

class ChatScreen extends StatelessWidget {
  final List<Map<String, dynamic>> chatData = [
    {
      "name": "Jenny Alxinder",
      "stateSeen": "Active Now",
      "notificationCount": 0,
      "avatarImagePath": AppImages.ava1,
      "isOnline": true,
    },
    {
      "name": "Team Align",
      "stateSeen": "Active 1h ago",
      "notificationCount": 0,
      "avatarImagePath": AppImages.ava5,
      "isOnline": false,
    },
    {
      "name": "Alex Avishek",
      "stateSeen": "Active 1h ago",
      "notificationCount": 0,
      "avatarImagePath": AppImages.ava2,
      "isOnline": false,
    },
    {
      "name": "Jafor Dicrose",
      "stateSeen": "Active 1h ago",
      "time": "2 week ago",
      "notificationCount": 0,
      "avatarImagePath": AppImages.ava3,
      "isOnline": false,
    },
  ];

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: chatData.length,
        itemBuilder: (context, index) {
          final data = chatData[index];
          return ChatItem(
            name: data["name"],
            stateSeen: data["stateSeen"],
            notificationCount: data["notificationCount"],
            avatarImagePath: data["avatarImagePath"],
            isOnline: data["isOnline"],
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey[400], // Customize color
          thickness: 10, // Customize thickness
          indent: 72, // Left margin for alignment
          endIndent: 16, // Right margin
        ),
      ),
    );
  }
}

class ProfilePictureWithStatus extends StatelessWidget {
  final String avatarImagePath;
  final bool isOnline;

  const ProfilePictureWithStatus({
    super.key,
    required this.avatarImagePath,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 19.r,
          backgroundImage: AssetImage(avatarImagePath),
        ),
        if (isOnline)
          Container(
            width: 10.r,
            height: 10.r,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 1.5.w,
              ),
            ),
          ),
      ],
    );
  }
}



class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 17.0),
        filled: true,
        fillColor: Colors.white,
        hintText: 'Search',
        hintStyle: AppTextStyles.hintTextStyle,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(16),
          child: SvgPicture.asset(AppImages.searchIcon),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r), 
          borderSide: BorderSide(
            color: AppColors.borderColor, 
            width: 1.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: AppColors.borderColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: AppColors.borderSideColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
