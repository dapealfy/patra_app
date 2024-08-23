import 'package:app/common/colors.dart';
import 'package:app/common/text_styles.dart';
import 'package:app/common/widgets/button.dart';
import 'package:app/core/storage/local_storage.dart';
import 'package:app/feature/home/complaint/detail_complaint_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailComplaintScreen extends StatefulWidget {
  final String complaintId;
  const DetailComplaintScreen({super.key, required this.complaintId});

  @override
  State<DetailComplaintScreen> createState() => _DetailComplaintScreenState();
}

class _DetailComplaintScreenState extends State<DetailComplaintScreen> {
  Color appbarColor = primaryBlue;
  bool? isCustomer;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () async {
      LocalStorageService storage = LocalStorageService.instance;
      if (await storage.getToken() != null) {
        if (await storage.getRole() == 'customer') {
          appbarColor = primaryBlue;
          isCustomer = true;
        } else {
          appbarColor = primaryGreen;
          isCustomer = false;
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailComplaintViewmodel>(
      create: (BuildContext context) => DetailComplaintViewmodel()
        ..getComplaint(int.tryParse(widget.complaintId) ?? 0),
      child: Consumer<DetailComplaintViewmodel>(builder: (context, vm, child) {
        int currentStep = 0;
        if (vm.selectedComplaint?.status == 'receive') {
          currentStep = 0;
        } else if (vm.selectedComplaint?.status == 'ongoing') {
          currentStep = 1;
        } else if (vm.selectedComplaint?.status == 'done') {
          currentStep = 2;
        } else {
          currentStep = 0;
        }
        return isCustomer == null
            ? const Scaffold(
                backgroundColor: Colors.white,
              )
            : Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  leading: const BackButton(
                    color: Colors.white,
                  ),
                  backgroundColor: appbarColor,
                  elevation: 0,
                  title: Text(
                    'Progress Pengerjaan Keluhan',
                    style: AppTextStyles.caption1.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  actions: [
                    IconButton(onPressed: (){
                      launchUrl(Uri.parse('https://api.whatsapp.com/send/?phone=6285158884084&text=Halo%20Saya%20Butuh%20Bantuan%20Keluhan&type=phone_number&app_absent=0'), mode: LaunchMode.externalApplication);
                    }, icon: Icon(Icons.headphones, color: Colors.white,))
                  ],
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
                        if (vm.selectedComplaint?.complaintAsset != '') ...[
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
                            imageUrl:
                                vm.selectedComplaint?.complaintAsset ?? '',
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ],
                        const SizedBox(
                          height: 36,
                        ),
                        if (vm.selectedComplaint?.status == 'done') ...[
                          Text(
                            'Jenis Keluhan',
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
                            child: Text(vm.selectedComplaint?.sparepart ?? '',
                                style: AppTextStyles.caption1),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            'Laporan Pengerjaan',
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
                              'Foto Progress',
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
                              imageUrl:
                                  vm.selectedComplaint?.handlingAsset ?? '',
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ],
                          const SizedBox(
                            height: 36,
                          ),
                        ],
                        if (isCustomer == true) ...[
                          Text(
                            'Nama Teknisi',
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
                            child: Text(vm.selectedComplaint?.technicianName ?? '',
                                style: AppTextStyles.caption1),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            'Status Ajuan Keluhan',
                            style: AppTextStyles.caption1.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (vm.selectedComplaint?.status != 'completed') ...[
                            Theme(
                              data: ThemeData(
                                colorScheme: const ColorScheme.light(
                                    primary: primaryBlue),
                              ),
                              child: Stepper(
                                physics: const NeverScrollableScrollPhysics(),
                                currentStep: currentStep,
                                controlsBuilder: (BuildContext context,
                                    ControlsDetails details) {
                                  return Container();
                                },
                                steps: <Step>[
                                  Step(
                                    title: Text('Keluhan Diterima',
                                        style: AppTextStyles.caption1),
                                    content: Container(),
                                    isActive: currentStep >= 0,
                                    state: currentStep > 0
                                        ? StepState.complete
                                        : StepState.indexed,
                                  ),
                                  Step(
                                    title: Text('Sedang di Kerjakan',
                                        style: AppTextStyles.caption1),
                                    content: Container(),
                                    isActive: currentStep >= 1,
                                    state: currentStep > 1
                                        ? StepState.complete
                                        : StepState.indexed,
                                  ),
                                  Step(
                                    title: Text('Pekerjaan telah Selesai',
                                        style: AppTextStyles.caption1),
                                    content: Container(),
                                    isActive: currentStep >= 2,
                                    state: currentStep > 2
                                        ? StepState.complete
                                        : StepState.indexed,
                                  ),
                                ],
                              ),
                            ),
                          ] else ...[
                            Text('Keluhan Terselesaikan',
                                style: AppTextStyles.caption1),
                          ],
                          Visibility(
                            visible: vm.selectedComplaint?.status == 'done',
                            child: PrimaryButton(
                              title: 'SELESAIKAN KELUHAN',
                              isLoading: vm.isLoading,
                              onPressed: () {
                                vm.acceptComplaint('completed');
                              },
                            ),
                          ),
                          const SizedBox(height: 48),
                        ] else ...[
                          Visibility(
                            visible: vm.selectedComplaint?.status == 'receive',
                            child: PrimaryButton(
                              title: 'TERIMA',
                              isLoading: vm.isLoading,
                              onPressed: () {
                                vm.acceptComplaint('ongoing');
                              },
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
