import 'package:app/common/colors.dart';
import 'package:app/common/text_styles.dart';
import 'package:app/core/router/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

class HomeCustomerScreen extends StatefulWidget {
  const HomeCustomerScreen({super.key});

  @override
  State<HomeCustomerScreen> createState() => _HomeCustomerScreenState();
}

class _HomeCustomerScreenState extends State<HomeCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: Text(
          'HOME',
          style: AppTextStyles.body1.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 36.h,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: primaryBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          context.pushNamed(RoutesName.createComplaint);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Row(
                            children: [
                              Text(
                                'AJUKAN\nKELUHAN',
                                style: AppTextStyles.body1.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              const Icon(Icons.add_circle_outlined,
                                  color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: primaryBlue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Row(
                            children: [
                              Text(
                                'PROGRESS\nKELUHAN',
                                style: AppTextStyles.body1.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 18,
                              ),
                              const Icon(Icons.settings_remote,
                                  color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Riwayat Laporan Keluhan',
              style: AppTextStyles.caption1.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Air Conditioner',
                                style: AppTextStyles.body2,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'AC di Ruang tamu dan di kamar tidur bocor dan tidak dingin',
                                style: AppTextStyles.caption2,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                '16 Juli 2024 | 15.00',
                                style: AppTextStyles.body2
                                    .copyWith(color: secondary),
                              ),
                            ],
                          ),
                        ),
                        CachedNetworkImage(
                          width: 120,
                          height: 80,
                          fit: BoxFit.cover,
                          imageUrl: "http://via.placeholder.com/350x150",
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ),
          )
        ],
      ),
    );
  }
}
