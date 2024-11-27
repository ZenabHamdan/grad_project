import 'dart:ui';
import 'package:grad_project/exports/exports.dart';

class AddBottomSheet {
  void showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300), // Smooth transition
                curve: Curves.easeOut,
                padding:
                    EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 20.0.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 42.w,
                        height: 4.h,
                        margin: EdgeInsets.only(bottom: 16.0.h),
                        decoration: BoxDecoration(
                          color: AppColors.borderColor,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                      SizedBox(height: 40.h),
                      OptionItem(
                        svgIconPath: AppImages.editIcon,
                        label: 'Create Task',
                        onTap: () {
                          Navigator.pushNamed(context, Routes.addTask);
                        },
                      ),
                      SizedBox(height: 16.h),
                      OptionItem(
                        svgIconPath: AppImages.createProjectIcon,
                        label: 'Create Project',
                        onTap: () {},
                      ),
                      SizedBox(height: 16.h),
                      OptionItem(
                        svgIconPath: AppImages.createTeamIcon,
                        label: 'Create Team',
                        onTap: () {
                          Navigator.pushNamed(context, Routes.createTeam);
                        },
                      ),
                      SizedBox(height: 16.h),
                      OptionItem(
                        svgIconPath: AppImages.createEventIcon,
                        label: 'Create Event',
                        onTap: () {},
                      ),
                      SizedBox(height: 20.h),
                  
                      // Close button
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context); // Close the bottom sheet
                          },
                          child: Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: SvgPicture.asset(
                                AppImages.closeIcon,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
