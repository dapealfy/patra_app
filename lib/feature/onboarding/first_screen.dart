import 'package:app/app/assets.dart';
import 'package:app/common/colors.dart';
import 'package:app/common/text_styles.dart';
import 'package:app/common/widgets/button.dart';
import 'package:app/core/router/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

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
              height: 70.h,
            ),
            Text(
              'SELAMAT DATANG DI\nSISTEM PENGADUAN KELUHAN\nPENGHUNI ASET\nPATRALAND BALIKPAPAN',
              style: AppTextStyles.headline.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 70.h,
            ),
            SizedBox(
              width: 250,
              child: PrimaryButton(
                title: 'MULAI',
                onPressed: () => context.goNamed(RoutesName.landing),
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
                const SizedBox(width: 8,),
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
