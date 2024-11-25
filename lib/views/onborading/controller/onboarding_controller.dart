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
    // _checkIfOnboardingCompleted();
  }

  Future<void> _checkIfOnboardingCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? completed = prefs.getBool('onboardingCompleted');
    if (completed == true) {
      _navigateToLoginOrRegisterPage();
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true);
    _navigateToLoginOrRegisterPage();
  }

  void _navigateToLoginOrRegisterPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>
          LoginPage(onTap: (){})),
    );
  }

  @override
  Widget build(BuildContext context) {
    // if (_isLoading) {
    //   return Scaffold(
    //     body: Center(child: CircularProgressIndicator()),
    //   );
    // }

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          OnboardingScreen1(
            onSkip: _completeOnboarding,
            onNext: () => _pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            ),
          ),
          OnboardingScreen2(
            onSkip: _completeOnboarding,
            onNext: () => _pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            ),
          ),
          OnboardingScreen3(
            onSkip: _completeOnboarding,
            onNext: () => _pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            ),
          ),
          OnboardingScreen4(
            onSkip: _completeOnboarding,
            onNext: _completeOnboarding,
          ),
        ],
      ),
    );
  }
}
