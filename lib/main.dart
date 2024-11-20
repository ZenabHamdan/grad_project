import 'package:grad_project/exports/exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Graduation Project',
          debugShowCheckedModeBanner: false,
          color: AppColors.backgroundColor,
          theme: ThemeData(
            fontFamily: 'Poppins',
            useMaterial3: true,
          ),
          home: const CustomBottomNavigationBar(),
        );
      },
    );
  }
}
