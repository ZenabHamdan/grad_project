import 'package:grad_project/exports/exports.dart';
import 'package:grad_project/widgets/custom_app_bar.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isloading = false;

  Future<void> login(BuildContext context) async {
    setState(() {
      isloading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(leadingSvgPath: AppImages.backArrowIcon, title: "Sign In",
            onLeadingIconTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen(onTap: (){})
            )
            );},
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Center(
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
                            "Please Inter your email address\nand password for Login",
                            style: AppTextStyles.sign_in_description
                                .copyWith(height: 1.7.sp),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
      
                      MyTextField(
                          hintText: 'Enter your mail',
                          obscureText: false,
                          controller: _emailController,
                          hintStyle: AppTextStyles.sign_in_description.copyWith(
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
                      SizedBox(height: 15.h),
                      Container(
                        margin: EdgeInsets.only(left: 160.w),
                        child: Text("Forgot Password?",
                            style: AppTextStyles.sign_in_description.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.headlinesColor)),
                      ),
                      SizedBox(height: 30.h),
                      // Login button
                      CustomButton(
                        height: 48.h,
                        width: 327.w,
                        backgroundColor: AppColors.primaryColor,
                        text: "Sign In",
                        textStyle: AppTextStyles.sign_in,
                        isGlowing: true,
                        onTap: () {},
                      ),
                      SizedBox(height: 40.h),
                      Text("Signin with",
                          style: AppTextStyles.sign_in_description.copyWith(
                            fontWeight: FontWeight.w500
                          )),
      
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 60.h,
                            width: 58.w,
                            // padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColors.borderColor),
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
                            height: 60.h,
                            width: 58.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: AppColors.borderColor),
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
                          Text("Not Register Yet? ",
                              style: AppTextStyles.sign_in_description),
                          GestureDetector(
                              onTap:
                                  (){ Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignupScreen(onTap: (){})
                                  ));},
                              // widget.onTap,
                              child: Text(
                                "Sign Up",
                                style: AppTextStyles.sign_in_description
                                    .copyWith(color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
