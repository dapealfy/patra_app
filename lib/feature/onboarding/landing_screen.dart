import 'package:app/app/assets.dart';
import 'package:app/common/colors.dart';
import 'package:app/common/text_styles.dart';
import 'package:app/common/widgets/button.dart';
import 'package:app/core/router/routes_name.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32.r),
              child: SizedBox(
                width: double.infinity,
                child: Image.asset(
                  AppAssets.patraLand,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(
              height: 48.h,
            ),
            SizedBox(
              width: 250,
              child: PrimaryButton(
                title: 'LOGIN',
                onPressed: () {
                  context.pushNamed(RoutesName.login);
                },
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              width: 250,
              child: PrimaryButton(
                title: 'REGISTER',
                onPressed: () {
                  context.pushNamed(RoutesName.register);
                },
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'Belum punya akun?',
              style: AppTextStyles.caption2.copyWith(
                color: secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'By',
                  style: AppTextStyles.caption2.copyWith(color: secondary),
                ),
                const SizedBox(
                  width: 8,
                ),
                Image.asset(
                  AppAssets.patraJasa,
                  height: 12.r,
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
