import 'package:grad_project/exports/exports.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  LoginPage({super.key, this.onTap});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final SigninController signInController = SigninController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final isLoggedIn = await signInController.isLoggedIn();

    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, Routes.home);
    }
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    await signInController.saveLoginStatus(token: "mockToken");

    setState(() {
      isLoading = false;
    });

    // Navigate to HomeScreen
    Navigator.pushReplacementNamed(context, Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomAppBar(
                    leadingSvgPath: AppImages.backArrowIcon,
                    title: "Sign In",
                    onLeadingIconTap: () {},
                  ),
                  Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Welcome Back",
                                style: AppTextStyles.headline,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Please Enter your email address\nand password for Login",
                                style: AppTextStyles.signinDescription
                                    .copyWith(height: 1.7.sp),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.h),

                          MyTextField(
                            hintText: 'Enter your mail',
                            obscureText: false,
                            controller: _emailController,
                            hintStyle: AppTextStyles.signinDescription.copyWith(
                              fontSize: 16.sp,
                            ),
                            validator: emailValidator,
                          ),
                          SizedBox(height: 30.h),
                          MyTextField(
                            hintText: 'Enter your password',
                            obscureText: true,
                            controller: _pwController,
                            validator: passwordValidator,
                          ),
                          SizedBox(height: 15.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 27.0),
                              child: Text(
                                "Forgot Password?",
                                style: AppTextStyles.signinDescription.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.headlinesColor),
                              ),
                            ),
                          ),

                          SizedBox(height: 30.h),
                          // Login button
                          CustomButton(
                            height: 50.h,
                            width: 327.w,
                            backgroundColor: AppColors.primaryColor,
                            text: "Sign In",
                            textStyle: AppTextStyles.signin,
                            isGlowing: true,
                            onTap: (){
                              Navigator.pushReplacementNamed(context, Routes.home);
                            },
                          ),
                          SizedBox(height: 40.h),
                          Text(
                            "Signin with",
                            style: AppTextStyles.signinDescription
                                .copyWith(fontWeight: FontWeight.w500),
                          ),

                          SizedBox(height: 30.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: AppColors.borderColor),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SvgPicture.asset(
                                    AppImages.appleIcon,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: AppColors.borderColor),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SvgPicture.asset(
                                    AppImages.googleIcon,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Not Register Yet? ",
                                  style: AppTextStyles.signinDescription),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, Routes.signUp);
                                },
                                child: Text(
                                  "Sign Up",
                                  style: AppTextStyles.signinDescription
                                      .copyWith(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
