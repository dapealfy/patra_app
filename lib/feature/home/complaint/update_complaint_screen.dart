import 'package:app/common/colors.dart';
import 'package:app/common/text_styles.dart';
import 'package:app/common/widgets/button.dart';
import 'package:app/common/widgets/textfield.dart';
import 'package:app/feature/home/complaint/update_complaint_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateComplaintScreen extends StatelessWidget {
  final String complaintId;
  const UpdateComplaintScreen({super.key, required this.complaintId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UpdateComplaintViewmodel()
        ..getComplaint(int.tryParse(complaintId) ?? 0),
      child: Consumer<UpdateComplaintViewmodel>(builder: (context, vm, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: const BackButton(
              color: Colors.white,
            ),
            backgroundColor: primaryGreen,
            elevation: 0,
            title: Text(
              'Tugas Keluhan Masuk',
              style: AppTextStyles.body1.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 36,
                  ),
                  Text(
                    'Nomor Urut Rumah',
                    style: AppTextStyles.caption1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    color: backgroundDark,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: Text(vm.selectedComplaint?.homeAddress ?? '',
                        style: AppTextStyles.caption1),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Keterangan Keluhan',
                    style: AppTextStyles.caption1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    color: backgroundDark,
                    width: double.infinity,
                    height: 150,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    child: Text(vm.selectedComplaint?.description ?? '',
                        style: AppTextStyles.caption1),
                  ),
                  if (vm.selectedComplaint?.handlingAsset != '') ...[
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Foto Laporan',
                      style: AppTextStyles.caption1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    CachedNetworkImage(
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: vm.selectedComplaint?.handlingAsset ?? '',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ],
                  const SizedBox(
                    height: 36,
                  ),
                  Text(
                    'Jenis Keluhan',
                    style: AppTextStyles.caption1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Consumer<UpdateComplaintViewmodel>(
                    builder: (_, vm, __) {
                      return vm.isJenisKeluhanActive
                          ? Container(
                              color: backgroundBlue,
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      vm.sparepartController.text = 'Elektrik';
                                      vm.isJenisKeluhanActive = false;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Elektrik',
                                              style: AppTextStyles.caption1),
                                          vm.sparepartController.text ==
                                                  'Elektrik'
                                              ? Icon(Icons.check,
                                                  color: Colors.green, size: 20)
                                              : Container()
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      vm.sparepartController.text = 'HVAC';
                                      vm.isJenisKeluhanActive = false;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('HVAC',
                                              style: AppTextStyles.caption1),
                                          vm.sparepartController.text == 'HVAC'
                                              ? Icon(Icons.check,
                                                  color: Colors.green, size: 20)
                                              : Container()
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      vm.sparepartController.text = 'Plumbing';
                                      vm.isJenisKeluhanActive = false;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Plumbing',
                                              style: AppTextStyles.caption1),
                                          vm.sparepartController.text ==
                                                  'Plumbing'
                                              ? Icon(Icons.check,
                                                  color: Colors.green, size: 20)
                                              : Container()
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      vm.sparepartController.text = 'Lainnya';
                                      vm.isJenisKeluhanActive = false;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Lainnya',
                                              style: AppTextStyles.caption1),
                                          vm.sparepartController.text ==
                                                  'Lainnya'
                                              ? Icon(Icons.check,
                                                  color: Colors.green, size: 20)
                                              : Container()
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    vm.isJenisKeluhanActive = true;
                                  },
                                  child: IgnorePointer(
                                    child: AppTextField(
                                      controller: vm.sparepartController,
                                      hintText: 'Jenis Keluhan',
                                      isSuffixIconVisible: true,
                                      suffixIcon: Icons.keyboard_arrow_down,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12,),
                                vm.sparepartController.text == 'Lainnya'
                                    ? AppTextField(
                                        controller: vm.sparepartRealController,
                                        hintText: 'Masukkan Jenis Keluhan',
                                      )
                                    : Container()
                              ],
                            );
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Laporan Pekerjaan',
                    style: AppTextStyles.caption1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Selector<UpdateComplaintViewmodel, TextEditingController>(
                    selector: (_, vm) => vm.laporanPengerjaanController,
                    builder: (_, laporanController, __) {
                      return AppTextField(
                        controller: laporanController,
                        hintText: '',
                        maxLines: 5,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Foto Progress',
                    style: AppTextStyles.caption1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Consumer<UpdateComplaintViewmodel>(
                      builder: (context, vm, child) {
                    return InkWell(
                      onTap: () {
                        vm.selectHandlingImage();
                      },
                      child: Container(
                        color: backgroundBlue,
                        height: vm.handlingImage != null ? 250 : 150,
                        width: double.infinity,
                        child: vm.handlingImage != null
                            ? Image.file(
                                vm.handlingImage!,
                                fit: BoxFit.cover,
                              )
                            : const Center(
                                child: Icon(Icons.upload),
                              ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 24,
                  ),
                  Selector<UpdateComplaintViewmodel, Function>(
                    selector: (_, vm) => vm.submitComplaint,
                    builder: (_, submitComplaint, __) {
                      return PrimaryButton(
                        title: 'KIRIM',
                        onPressed: () => submitComplaint(),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
