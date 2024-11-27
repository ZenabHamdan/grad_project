import 'package:grad_project/exports/exports.dart';

class AddTask extends StatefulWidget {
  AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController nameTaskController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 42.w,
            height: 42.h,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderColor),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(AppImages.backArrowIcon),
            ),
          ),
        ),
        title: Text(
          'Add Task',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.categoryName),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Task Name",
                style: AppTextStyles.nameForAddTask,
              ),
              SizedBox(
                height: 16.h,
              ),
              TextField(
                style: AppTextStyles.title,
                controller: nameTaskController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      top: 23.0.w, bottom: 23.0.w, left: 20.0.h),
                  hintText: 'Mobile Application design',
                  hintStyle: AppTextStyles.insideFieldText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                      color: AppColors.borderColor,
                      width: 1,
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
                  children: [
                    SelectableHorizontalImages(),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.w,
                              color: AppColors.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_sharp,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Date",
                style: AppTextStyles.nameForAddTask,
              ),
              SizedBox(
                height: 16.h,
              ),
              const DatePickerField(),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start Time",
                        style: AppTextStyles.nameForAddTask,
                      ),
                      SizedBox(
                        height: 16.0.h,
                      ),
                      Container(
                        width: 140.w,
                        height: 74.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.borderColor,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '9:30 am',
                            hintStyle: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff282828),
                            ),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0.w, 20.0.h, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 55.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "End Time",
                        style: AppTextStyles.nameForAddTask,
                      ),
                      SizedBox(
                        height: 16.0.h,
                      ),
                      Container(
                        width: 135.w,
                        height: 74.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.borderColor,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '3:30 pm',
                            hintStyle: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff282828),
                            ),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0.w, 20.0.h, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Board",
                style: AppTextStyles.nameForAddTask,
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 40.h,
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      CategoryItem(categoryName: categories[index]),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 16.w,
                  ),
                  itemCount: categories.length,
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
                      backgroundColor:
                          WidgetStatePropertyAll(AppColors.primaryColor),
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
                      "Save",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
