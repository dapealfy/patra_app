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
      create: (context) =>
          UpdateComplaintViewmodel()..getComplaint(int.tryParse(complaintId) ?? 0),
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
              'Ajukan Keluhan',
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
                    'Sparepart',
                    style: AppTextStyles.caption1.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Selector<UpdateComplaintViewmodel, TextEditingController>(
                    selector: (_, vm) => vm.sparepartController,
                    builder: (_, nomorRumahController, __) {
                      return AppTextField(
                        controller: nomorRumahController,
                        hintText: '',
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
