import 'package:app/common/colors.dart';
import 'package:app/common/text_styles.dart';
import 'package:app/common/widgets/button.dart';
import 'package:app/common/widgets/textfield.dart';
import 'package:app/feature/auth/register/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
          create: (_) => RegisterViewModel(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'REGISTER',
                style: AppTextStyles.headline.copyWith(
                  color: primaryBlue,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Selector<RegisterViewModel, TextEditingController>(
                selector: (_, vm) => vm.emailController,
                builder: (_, emailController, __) {
                  return AppTextField(
                    controller: emailController,
                    hintText: 'Nama',
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Selector<RegisterViewModel, TextEditingController>(
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
              Selector<RegisterViewModel, TextEditingController>(
                selector: (_, vm) => vm.emailController,
                builder: (_, emailController, __) {
                  return AppTextField(
                    controller: emailController,
                    hintText: 'NIK',
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Consumer<RegisterViewModel>(
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
              Consumer<RegisterViewModel>(
                builder: (_, vm, __) {
                  return AppTextField(
                    controller: vm.passwordController,
                    hintText: 'Confirm Password',
                    obscureText: vm.obscureText,
                    isSuffixIconVisible: true,
                    onTapSuffix: () => vm.obscureText = !vm.obscureText,
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Selector<RegisterViewModel, Function>(
                  selector: (_, vm) => vm.register,
                  builder: (_, register, __) {
                    return SizedBox(
                      width: 250,
                      child: PrimaryButton(
                        title: 'MASUK',
                        onPressed: () => register(),
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
    );
  }
}
