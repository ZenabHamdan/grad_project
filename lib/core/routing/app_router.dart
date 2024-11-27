import 'package:grad_project/exports/exports.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onboardingFirst:
        return MaterialPageRoute(
          builder: (_) => OnboardingScreen1(
            onSkip: () {},
            onNext: () {
              Navigator.pushNamed(_, Routes.onboardingSecond);
            },
          ),
        );
      case Routes.onboardingSecond:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen2(
            onSkip: () {
              Navigator.pushReplacementNamed(context, Routes.signIn);
            },
            onNext: () {
              Navigator.pushNamed(context, Routes.onboardingThird);
            },
          ),
        );
      case Routes.onboardingThird:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen3(
            onSkip: () {
              Navigator.pushReplacementNamed(context, Routes.signIn);
            },
            onNext: () {
              Navigator.pushNamed(context, Routes.onboardingForth);
            },
          ),
        );
      case Routes.onboardingForth:
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen4(
            onSkip: () {
               Navigator.pushReplacementNamed(context, Routes.signIn);
            },
            onNext: () {
              Navigator.pushNamed(context, Routes.signIn);
            },
          ),
        );
      case Routes.signIn:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (_) => SignupScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => CustomBottomNavigationBar(),
        );
      // case Routes.todayTaskDetails:
      //   return MaterialPageRoute(
      //     builder: (_) => TodayTaskDetailsScreen(),
      //   );
      // case Routes.monthlyTask:
      //   return MaterialPageRoute(
      //     builder: (_) => MonthlyTaskScreen(),
      //   );
      case Routes.projects:
        return MaterialPageRoute(
          builder: (_) => ProjectScreen(),
        );
      // case Routes.add:
      //   return MaterialPageRoute(
      //     builder: (_) => AddBottomSheet(),
      //   );
      case Routes.addTask:
        return MaterialPageRoute(
          builder: (_) => AddTask(),
        );
      case Routes.createTeam:
        return MaterialPageRoute(
          builder: (_) => CreateTeamScreen(),
        );
      case Routes.chat:
        return MaterialPageRoute(
          builder: (_) => ChatScreen(),
        );
      case Routes.profile:
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
        );
      case Routes.editProfile:
        return MaterialPageRoute(
          builder: (_) => EditProfileScreen(),
        );
      case Routes.sideMenu:
        return MaterialPageRoute(
          builder: (_) => SideMenu(),
        );
      case Routes.search:
        return MaterialPageRoute(
          builder: (_) => SearchScreen(),
        );
      // case Routes.taskStatus:
      //   return MaterialPageRoute(
      //     builder: (_) => TaskStatus(),
      //   );
      case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
        );
      case Routes.language:
        return MaterialPageRoute(
          builder: (_) => LanguageScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined for this screen')),
          ),
        );
    }
  }
}
