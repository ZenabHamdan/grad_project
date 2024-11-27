import 'package:grad_project/exports/exports.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _focusedDay= DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: TableCalendar(
        startingDayOfWeek: StartingDayOfWeek.monday,
        focusedDay: _focusedDay,
        firstDay: DateTime.utc(2024, 11, 1),
        lastDay: DateTime.utc(2024, 11, 30),
        rowHeight: 50.0,
        selectedDayPredicate: (day) {
           return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        },
        daysOfWeekStyle: DaysOfWeekStyle(
          dowTextFormatter: (date, locale) =>
              DateFormat.E(locale).format(date)[0],
          weekdayStyle: AppTextStyles.weekdayStyle,
        ),
        calendarStyle: CalendarStyle(
          defaultTextStyle: AppTextStyles.defaultTextStyle,
          weekendTextStyle:AppTextStyles.defaultTextStyle,
          outsideTextStyle:AppTextStyles.outsideTextStyle,
          todayTextStyle:AppTextStyles.defaultTextStyle,
          selectedDecoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor, width: 2),
            shape: BoxShape.circle,
          ),
           todayDecoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          
          defaultDecoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          tablePadding: const EdgeInsets.only(left: 10.0, right: 10.0),
          selectedTextStyle: AppTextStyles.selectedTextStyle,
        ),
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            
            if (taskDays.any((taskDay) => isSameDay(taskDay, day))) {
              return Center(
                child: Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      day.day.toString(),
                      style: AppTextStyles.taskDayTextStyle,
                    ),
                  ),
                ),
              );
            }
            return null;
          },
        ),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronIcon: Icon(Icons.arrow_back, color: AppColors.arrowsColor),
          rightChevronIcon:
              Icon(Icons.arrow_forward, color: AppColors.arrowsColor),
          titleTextStyle: AppTextStyles.titleTextStyle,
        ),
      ),
    );
  }
}
