import 'package:app/common/colors.dart';
import 'package:app/common/text_styles.dart';
import 'package:app/common/widgets/button.dart';
import 'package:app/common/widgets/textfield.dart';
import 'package:app/feature/auth/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 48.r),
        child: ChangeNotifierProvider(
          create: (_) => LoginViewModel(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 56.h,
                ),
                Text(
                  'LOGIN',
                  style: AppTextStyles.headline.copyWith(
                    color: primaryBlue,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Selector<LoginViewModel, TextEditingController>(
                  selector: (_, vm) => vm.emailController,
                  builder: (_, emailController, __) {
                    return AppTextField(
                      controller: emailController,
                      hintText: 'Email',
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Consumer<LoginViewModel>(
                  builder: (_, vm, __) {
                    return AppTextField(
                      controller: vm.passwordController,
                      hintText: 'Password',
                      obscureText: vm.obscureText,
                      isSuffixIconVisible: true,
                      onTapSuffix: () => vm.obscureText = !vm.obscureText,
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Consumer<LoginViewModel>(builder: (_, loginVm, __) {
                  return SizedBox(
                    width: 250,
                    child: PrimaryButton(
                      title: 'MASUK',
                      isLoading: loginVm.isLoading,
                      onPressed: () => loginVm.login(),
                    ),
                  );
                }),
                SizedBox(
                  height: 70.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
