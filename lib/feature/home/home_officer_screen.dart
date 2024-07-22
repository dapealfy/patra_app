import 'package:app/common/colors.dart';
import 'package:app/common/text_styles.dart';
import 'package:app/core/router/routes_name.dart';
import 'package:app/core/storage/local_storage.dart';
import 'package:app/data/complaint/model/complaint_model.dart';
import 'package:app/feature/home/home_customer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeOfficerScreen extends StatelessWidget {
  const HomeOfficerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeCustomerViewmodel>(
      create: (context) => HomeCustomerViewmodel()..getAllComplaints(),
      child: Consumer<HomeCustomerViewmodel>(builder: (context, vm, child) {
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
                      child: Builder(builder: (context) {
                        int complaintId = vm.allComplaints
                            .firstWhere(
                              (complaint) => complaint.status == 'ongoing',
                              orElse: () => ComplaintModel(
                                  id: 0,
                                  userId: '',
                                  homeAddress: '',
                                  description: '',
                                  handlingAsset: '',
                                  complaintAsset: '',
                                  sparepart: '',
                                  handlingDescription: '',
                                  status: '',
                                  userHandlerId: '',
                                  createdAt: '',
                                  updatedAt: ''),
                            )
                            .id;
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: complaintId == 0 ? Colors.grey : primaryBlue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                if (complaintId != 0) {
                                  context.pushNamed(
                                    RoutesName.detailComplaint,
                                    queryParameters: {
                                      'complaintId': complaintId.toString(),
                                    },
                                  );
                                }
                              },
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
                        );
                      }),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                              imageUrl: vm.allComplaints[index].complaintAsset,
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
      }),
    );
  }
}
