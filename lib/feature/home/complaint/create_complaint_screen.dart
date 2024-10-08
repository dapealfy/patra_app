import 'package:app/common/colors.dart';
import 'package:app/common/text_styles.dart';
import 'package:app/common/widgets/button.dart';
import 'package:app/common/widgets/textfield.dart';
import 'package:app/feature/home/complaint/create_complaint_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateComplaintScreen extends StatelessWidget {
  const CreateComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateComplaintViewmodel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.white,
          ),
          backgroundColor: primaryBlue,
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
                Selector<CreateComplaintViewmodel, TextEditingController>(
                  selector: (_, vm) => vm.nomorRumahController,
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
                  'Keterangan Keluhan',
                  style: AppTextStyles.caption1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Selector<CreateComplaintViewmodel, TextEditingController>(
                  selector: (_, vm) => vm.keteranganController,
                  builder: (_, keteranganController, __) {
                    return AppTextField(
                      controller: keteranganController,
                      hintText: '',
                      maxLines: 5,
                    );
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Foto Keluhan',
                  style: AppTextStyles.caption1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Consumer<CreateComplaintViewmodel>(
                    builder: (context, vm, child) {
                  return InkWell(
                    onTap: () {
                      vm.selectComplaintImage();
                    },
                    child: Container(
                      color: backgroundBlue,
                      height: vm.complaintImage != null ? 250 : 150,
                      width: double.infinity,
                      child: vm.complaintImage != null
                          ? Image.file(
                              vm.complaintImage!,
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
                Consumer<CreateComplaintViewmodel>(
                  builder: (_, submitComplaintVm, __) {
                    return PrimaryButton(
                      title: 'KIRIM',
                      isLoading: submitComplaintVm.isLoading,
                      onPressed: () => submitComplaintVm.submitComplaint(),
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
      ),
    );
  }
}
