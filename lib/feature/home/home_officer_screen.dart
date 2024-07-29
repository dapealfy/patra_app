import 'package:app/common/colors.dart';
import 'package:app/common/text_styles.dart';
import 'package:app/core/router/routes_name.dart';
import 'package:app/core/storage/local_storage.dart';
import 'package:app/feature/home/home_officer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeOfficerScreen extends StatelessWidget {
  const HomeOfficerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeOfficerViewmodel>(
      create: (context) => HomeOfficerViewmodel()
        ..getAllComplaints()
        ..getOnGoingComplaints()
        ..getReceiveComplaints(),
      child: Consumer<HomeOfficerViewmodel>(builder: (context, vm, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: primaryGreen,
            title: Text(
              'HOME',
              style: AppTextStyles.body1.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  LocalStorageService storage = LocalStorageService.instance;
                  storage.deleteAll();
                  context.goNamed(RoutesName.landing);
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
            ],
            centerTitle: true,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<HomeOfficerViewmodel>()
                ..getAllComplaints()
                ..getOnGoingComplaints()
                ..getReceiveComplaints();
            },
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                        if (vm.onGoingComplaints.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'On Going',
                              style: AppTextStyles.caption1.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: vm.onGoingComplaints.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  context.pushNamed(
                                    RoutesName.updateComplaint,
                                    queryParameters: {
                                      'complaintId': vm
                                          .onGoingComplaints[index].id
                                          .toString(),
                                    },
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              vm.onGoingComplaints[index]
                                                  .homeAddress,
                                              style: AppTextStyles.body2,
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              vm.onGoingComplaints[index]
                                                  .description,
                                              style: AppTextStyles.caption2,
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              vm.onGoingComplaints[index]
                                                  .createdAt,
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
                                        imageUrl: vm.onGoingComplaints[index]
                                            .complaintAsset,
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
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                        if (vm.receiveComplaints.isNotEmpty) ...[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Tugas',
                              style: AppTextStyles.caption1.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: vm.receiveComplaints.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  context.pushNamed(
                                    RoutesName.detailComplaint,
                                    queryParameters: {
                                      'complaintId': vm
                                          .receiveComplaints[index].id
                                          .toString(),
                                    },
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 20),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              vm.receiveComplaints[index]
                                                  .homeAddress,
                                              style: AppTextStyles.body2,
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              vm.receiveComplaints[index]
                                                  .description,
                                              style: AppTextStyles.caption2,
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              vm.receiveComplaints[index]
                                                  .createdAt,
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
                                        imageUrl: vm.receiveComplaints[index]
                                            .complaintAsset,
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
                          const SizedBox(
                            height: 24,
                          ),
                        ],
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
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: vm.allComplaints.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                context.pushNamed(
                                  RoutesName.detailComplaint,
                                  queryParameters: {
                                    'complaintId':
                                        vm.allComplaints[index].id.toString(),
                                  },
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 20),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            vm.allComplaints[index].homeAddress,
                                            style: AppTextStyles.body2,
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            vm.allComplaints[index].description,
                                            style: AppTextStyles.caption2,
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            vm.allComplaints[index].createdAt,
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
                                      imageUrl: vm
                                          .allComplaints[index].complaintAsset,
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
                        if (vm.allComplaints.isEmpty)
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Tidak ada laporan keluhan',
                                  style: AppTextStyles.caption2,
                                  textAlign: TextAlign.center,
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
        );
      }),
    );
  }
}
