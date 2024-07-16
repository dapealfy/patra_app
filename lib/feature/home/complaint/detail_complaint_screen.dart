import 'package:app/common/colors.dart';
import 'package:app/common/text_styles.dart';
import 'package:flutter/material.dart';

class DetailComplaintScreen extends StatefulWidget {
  final String complaintId;
  const DetailComplaintScreen({super.key, required this.complaintId});

  @override
  State<DetailComplaintScreen> createState() => _DetailComplaintScreenState();
}

class _DetailComplaintScreenState extends State<DetailComplaintScreen> {
  int _currentStep = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: primaryBlue,
        elevation: 0,
        title: Text(
          'Progress Keluhan',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Text('Bambang Susantono', style: AppTextStyles.caption1),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Text('AC Tidak Dingin, kipas pelan',
                    style: AppTextStyles.caption1),
              ),
              const SizedBox(
                height: 36,
              ),
              Text(
                'Status Ajuan Keluhan',
                style: AppTextStyles.caption1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Theme(
                data: ThemeData(
                  colorScheme: const ColorScheme.light(primary: primaryBlue),
                ),
                child: Stepper(
                  currentStep: _currentStep,
                  controlsBuilder:
                      (BuildContext context, ControlsDetails details) {
                    return Container();
                  },
                  steps: <Step>[
                    Step(
                      title: Text('Keluhan Diterima',
                          style: AppTextStyles.caption1),
                      content: Container(),
                      isActive: _currentStep >= 0,
                      state: _currentStep > 0
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                    Step(
                      title: Text('Sedang di Kerjakan',
                          style: AppTextStyles.caption1),
                      content: Container(),
                      isActive: _currentStep >= 1,
                      state: _currentStep > 1
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                    Step(
                      title: Text('Pekerjaan telah Selesai',
                          style: AppTextStyles.caption1),
                      content: Container(),
                      isActive: _currentStep >= 2,
                      state: _currentStep > 2
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
