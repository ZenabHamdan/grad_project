import 'package:grad_project/exports/exports.dart';

class ScheduleView extends StatelessWidget {
  final List<Map<String, dynamic>> schedule = [
    {
      'time': '10 am',
      'title': 'Wareframe elements ☺',
      'participants': ['User1', 'User2'],
      'duration': '10am - 11am',
      'durationColor': AppColors.durationOneColor,
      'color': AppColors.eventOneColor,
    },
    {
      'time': '12 pm',
      'title': 'Mobile app Design 😍',
      'participants': ['User1', 'User2', 'User3'],
      'duration': '11:40am - 12:40pm',
      'durationColor': AppColors.durationTwoColor,
      'color': AppColors.eventTwoColor,
    },
    {
      'time': '01 pm',
      'title': 'Design Team call 🤗',
      'participants': ['User1', 'User2', 'User3', "User4", "+5"],
      'duration': '01:20pm - 02:20pm',
      'durationColor': AppColors.durationThreeColor,
      'color': AppColors.eventThreeColor,
    },
  ];
  final List<String> hours = [
    "10 am",
    "11 am",
    "12 pm",
    "01 pm",
    "02 pm",
    "03 pm",
  ];

  ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 640.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: hours.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      color: AppColors.borderColor,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      hours[index],
                      style: AppTextStyles.hour,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Positioned.fill(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: schedule.length,
            itemBuilder: (context, index) {
              final event = schedule[index];
              double leftPadding = 70.0;
              if (index == 1) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: _calculateEventTopPadding(event["time"]),
                    ),
                    child: Transform.translate(
                      offset: const Offset(110.0, 0), 
                      child: Container(
                        width: MediaQuery.of(context).size.width - 110,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.vector),
                          ),
                          color: event['color'],
                          borderRadius: BorderRadius.circular(16.0.r),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              event['title'],
                              style: AppTextStyles.eventTitle,
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                buildParticipantAvatars(event['participants']),
                                const Spacer(),
                                Text(
                                  event['duration'],
                                  style: TextStyle(
                                      color: event['durationColor'],
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: _calculateEventTopPadding(event["time"]),
                    left: leftPadding,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.vector),
                      ),
                      color: event['color'],
                      borderRadius: BorderRadius.circular(16.0.r),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event['title'],
                          style: AppTextStyles.eventTitle,
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            buildParticipantAvatars(event['participants']),
                            const Spacer(),
                            Text(
                              event['duration'],
                              style: TextStyle(
                                  color: event['durationColor'],
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

double _calculateEventTopPadding(String time) {
  final Map<String, double> timeToPadding = {
    "10 am": 48.0.w,
    "11 am": 60.0.w,
    "12 pm": 54.0.w,
    "01 pm": 45.0.w,
    "02 pm": 240.0.w,
    "03 pm": 300.0.w,
  };
  return timeToPadding[time] ?? 0.0;
}

Widget buildParticipantAvatars(List<String> participants) {
  int participantCount = participants.length;

  return Stack(
    clipBehavior: Clip.none,
    children: [
      if (participantCount > 0)
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.backgroundColor),
          ),
          child: Image.asset(AppImages.personImg1),
        ),
      if (participantCount > 1)
        Positioned(
          left: 15.w,
          child: Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.backgroundColor),
            ),
            child: Image.asset(AppImages.personImg2),
          ),
        ),
      if (participantCount > 2)
        Positioned(
          left: 30.w,
          child: Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.backgroundColor),
            ),
            child: Image.asset(AppImages.personImg3),
          ),
        ),
      if (participantCount > 3)
        Positioned(
          left: 45.w,
          child: Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: const Color(0xffFFD7A9),
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.eventThreeColor),
            ),
            child: Center(
              child: Text(
                '+5',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 11.sp,
                  color: AppColors.backgroundColor,
                ),
              ),
            ),
          ),
        ),
    ],
  );
}
