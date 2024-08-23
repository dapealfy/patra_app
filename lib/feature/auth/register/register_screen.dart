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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8.h,
                ),
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
                  selector: (_, vm) => vm.nameController,
                  builder: (_, nameController, __) {
                    return AppTextField(
                      controller: nameController,
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
                  selector: (_, vm) => vm.nikController,
                  builder: (_, nikController, __) {
                    return AppTextField(
                      controller: nikController,
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
                      controller: vm.confirmPasswordController,
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
                Consumer<RegisterViewModel>(
                  builder: (_, vm, __) {
                    return AppTextField(
                      controller: vm.alamatRumahController,
                      hintText: 'Alamat Rumah',
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Consumer<RegisterViewModel>(
                  builder: (_, vm, __) {
                    return AppTextField(
                      controller: vm.noTelpController,
                      hintText: 'No Telepon',
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Consumer<RegisterViewModel>(builder: (_, vm, __) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          vm.role = 'petugas';
                        },
                        child: Row(
                          children: [
                            Radio(
                              value: 'petugas',
                              groupValue: vm.role,
                              onChanged: (value) {
                                vm.role = value!;
                              },
                            ),
                            Text(
                              'Teknisi',
                              style: AppTextStyles.caption1,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          vm.role = 'customer';
                        },
                        child: Row(
                          children: [
                            Radio(
                              value: 'customer',
                              groupValue: vm.role,
                              onChanged: (value) {
                                vm.role = value!;
                              },
                            ),
                            Text(
                              'Penghuni',
                              style: AppTextStyles.caption1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
                SizedBox(
                  height: 20.h,
                ),
                Consumer<RegisterViewModel>(builder: (_, registerVm, __) {
                  return SizedBox(
                    width: 250,
                    child: PrimaryButton(
                      title: 'KIRIM/DAFTAR',
                      isLoading: registerVm.isLoading,
                      onPressed: () => registerVm.register(),
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
