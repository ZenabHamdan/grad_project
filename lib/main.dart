import 'package:grad_project/exports/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isFirstLaunch = await checkIfFirstLaunch();
  runApp(MyApp(appRouter: AppRouter(), isFirstLaunch: isFirstLaunch));
}

Future<bool> checkIfFirstLaunch() async {
  String? installed = await SharedPreferencesService.getInstalled();

  if (installed == null || installed == 'false') {
    await SharedPreferencesService.setInstalled(installed: 'true');
    return true;
  }

  return false;
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool isFirstLaunch;

  const MyApp(
      {super.key, required this.appRouter, required this.isFirstLaunch});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Tasky',
          debugShowCheckedModeBanner: false,
          color: AppColors.backgroundColor,
          initialRoute: isFirstLaunch ? Routes.onboardingFirst : Routes.signIn,
          onGenerateRoute: appRouter.generateRoute,
          theme: ThemeData(
            fontFamily: 'Poppins',
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
