import 'package:grad_project/exports/exports.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkIfOnboardingCompleted();
  }

  Future<void> _checkIfOnboardingCompleted() async {
    String? installed = await SharedPreferencesService.getInstalled();
    if (installed == "true") {
      _navigateToLoginOrRegisterPage();
    }
  }

  Future<void> _completeOnboarding(BuildContext context) async {
    await SharedPreferencesService.setInstalled(installed: "true");
    _navigateToLoginOrRegisterPage();
  }

  void _navigateToSecondOnboarding(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.onboardingSecond, // Navigate to second onboarding screen
    );
  }

  void _navigateToThirdOnboarding(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.onboardingThird, // Navigate to third onboarding screen
    );
  }

  void _navigateToForthOnboarding(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.onboardingForth, // Navigate to third onboarding screen
    );
  }

  void _navigateToLoginOrRegisterPage() {
    Navigator.pushReplacementNamed(context, Routes.signIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          OnboardingScreen1(
            onSkip: () => _completeOnboarding(context),
            onNext: () => _navigateToSecondOnboarding(context),
          ),
          OnboardingScreen2(
            onSkip: () => _completeOnboarding(context),
            onNext: () => _navigateToThirdOnboarding(context),
          ),
          OnboardingScreen3(
            onSkip: () => _completeOnboarding(context),
            onNext: () => _navigateToForthOnboarding(context),
          ),
          OnboardingScreen4(
            onSkip: () => _completeOnboarding(context),
            onNext: () => _completeOnboarding(context),
          ),
        ],
      ),
      // floatingActionButton: _currentPage == 3
      //     ? FloatingActionButton(
      //   onPressed: _completeOnboarding,
      //   child: Icon(Icons.check),
      // )
      //     : null,
    );
  }
}
