import 'package:grad_project/exports/exports.dart';
import 'package:grad_project/views/signin/view/signin_screen.dart';
import 'package:grad_project/views/signup/controller/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  final void Function()? onTap;
  const SignupScreen({super.key, this.onTap});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final SignUpController signUpController = SignUpController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void initState() {
    super.initState();
    _checkSignupStatus();
  }

  Future<void> _checkSignupStatus() async {
    final isLoggedIn = await signUpController.isLoggedIn();

    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, Routes.home);
    }
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    // Simulate network call (replace with actual API call)
    await Future.delayed(Duration(seconds: 2));

    // Save signup data
    await signUpController.saveSignUpData(
      userName: _userNameController.text,
      email: _emailController.text,
    );

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
                    title: "Sign UP",
                    onLeadingIconTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(onTap: () {})));
                    },
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
                                "Create Account",
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
                                "Please Enter your Informatioin and\ncreate your account",
                                style: AppTextStyles.signinDescription
                                    .copyWith(height: 1.7.sp),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.h),
                          MyTextField(
                              hintText: 'Enter your name',
                              obscureText: false,
                              controller: _userNameController,
                              hintStyle:
                                  AppTextStyles.signinDescription.copyWith(
                                fontSize: 16.sp,
                              ),
                              validator: nameValidator),
                          SizedBox(height: 30.h),
                          MyTextField(
                              hintText: 'Enter your mail',
                              obscureText: false,
                              controller: _emailController,
                              hintStyle:
                                  AppTextStyles.signinDescription.copyWith(
                                fontSize: 16.sp,
                              ),
                              validator: emailValidator),
                          SizedBox(height: 30.h),
                          MyTextField(
                            hintText: 'Enter your password',
                            obscureText: true,
                            controller: _pwController,
                            validator: passwordValidator,
                          ),
                          SizedBox(height: 30.h),
                          CustomButton(
                            height: 50.h,
                            width: 327.w,
                            backgroundColor: AppColors.primaryColor,
                            text: "Sign Up",
                            textStyle: AppTextStyles.signin,
                            isGlowing: true,
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.home);
                            },
                          ),
                          SizedBox(height: 40.h),
                          Text("Signup with",
                              style: AppTextStyles.signinDescription
                                  .copyWith(fontWeight: FontWeight.w500)),
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
                          SizedBox(height: 50.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Have an Account? ",
                                  style: AppTextStyles.signinDescription),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, Routes.signIn);
                                },
                                child: Text(
                                  "Sign In",
                                  style: AppTextStyles.signinDescription
                                      .copyWith(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
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
