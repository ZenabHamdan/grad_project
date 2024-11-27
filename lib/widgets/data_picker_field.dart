import 'package:grad_project/exports/exports.dart';
import 'package:intl/intl.dart';


class DatePickerField extends StatefulWidget {
  const DatePickerField({super.key});

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime? _selectedDate;

  // Helper function to pick a date
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _pickDate(context),
          child: Container(
            width: double.infinity,
            height: 64.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: Text(
                _selectedDate != null
                    ? DateFormat('MMMM dd, yyyy').format(_selectedDate!)
                    : 'November 01, 2021',
                style: AppTextStyles.insideFieldText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TimePickerField extends StatefulWidget {
  const TimePickerField({super.key});

  @override
  _TimePickerFieldState createState() => _TimePickerFieldState();
}

class _TimePickerFieldState extends State<TimePickerField> {
  TimeOfDay? _selectedTime;

  // Helper function to pick a time
  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: () => _pickTime(context),
          child: Container(
            width: 148.w,
            height: 64.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: Text(
                  _selectedTime != null
                      ? _selectedTime!
                          .format(context) // Format time to a readable format
                      : 'Select Time',
                  style: AppTextStyles.title),
            ),
          ),
        ),
      ],
    );
  }
}

class SelectableAvatar extends StatefulWidget {
  final String imagePath;
  final String nameAvatar;

  const SelectableAvatar(
      {Key? key, required this.imagePath, required this.nameAvatar})
      : super(key: key);

  @override
  _SelectableAvatarState createState() => _SelectableAvatarState();
}

class _SelectableAvatarState extends State<SelectableAvatar> {
  bool isSelected = false;

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSelection, // Change state on tap
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: AssetImage(widget.imagePath),
                backgroundColor: isSelected
                    ? Colors.orange.withOpacity(0.9)
                    : Colors.black.withOpacity(1),
              ),
              if (isSelected)
                Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 25.r,
                ),
            ],
          ),
          SizedBox(height: 6.h), // Space between avatar and text
          Text(
            isSelected ? "Avishek" : widget.nameAvatar,
            // Changes name based on selection
            style: AppTextStyles.nameForAddTask,
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatefulWidget {
  final String categoryName;

  const CategoryItem({super.key, required this.categoryName});

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool isSelected = false; // Track if the category is selected

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected; // Toggle the selected state
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSelection, // Toggle selection on tap
      child: Container(
        width: 110.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.borderColor, // Change color based on selection
            width:1.0, 
          ),
        ),

        child: Center(
          child: Text(
            widget.categoryName,
            style: isSelected? AppTextStyles.nameSelectForBoard:AppTextStyles.nameForAddTask,
          ),
        ),
      ),
    );
  }
}
class SelectableHorizontalImages extends StatefulWidget {
  @override
  _SelectableHorizontalImagesState createState() =>
      _SelectableHorizontalImagesState();
}

class _SelectableHorizontalImagesState
    extends State<SelectableHorizontalImages> {
  // List of team members and their selection states
  final List<Map<String, dynamic>> teamMembers = [
    {"name": "Jeny", "image": AppImages.ava1, "isSelected": false},
    {"name": "Mehrin", "image": AppImages.ava1, "isSelected": false},
    {"name": "Avishek", "image": AppImages.ava2, "isSelected": false},
    {"name": "Jafor", "image": AppImages.ava3, "isSelected": false},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: teamMembers.map((member) {
          int index = teamMembers.indexOf(member); 
          return Padding(
            padding: EdgeInsets.only(right: 8.w), 
            child: GestureDetector(
              onTap: () {
                setState(() {
                  for (var member in teamMembers) {
                    member['isSelected'] = false;
                  }
                  teamMembers[index]['isSelected'] = true;
                });
              },
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      
                      ClipOval(
                        child: Image.asset(
                          member['image'],
                          
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (member['isSelected']) ...[
                        Container(
                          width: 55.w,
                          height: 55.h,
                          decoration: BoxDecoration(
                            color: Color(0xffFFC07B).withOpacity(0.83),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Icon(
                          Icons.check,
                          size: 22.sp,
                          color: Colors.white,
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 8.h),
                  // Name
                  Text(
                    member['name'],
                    style: AppTextStyles.teamMemberText,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}



List<String> categories = [
  'Urgent',
  'Running',
  'ongoing',
  'Urgent',
];
List<String> typeCreateTeam = [
  'Private',
  'Public',
  'Secret',
];
