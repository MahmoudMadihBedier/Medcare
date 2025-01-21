import 'package:flutter/material.dart';
import 'package:medicare/core/nav_manager.dart';
import '../../../constants/app_colors.dart';
import '../../../data/app_data.dart';
import 'appointment_confirmed_page.dart';

class AppointmentConfirmationPage extends StatefulWidget {
  final Doctor doctor;
  final Appointment appointment;
  const AppointmentConfirmationPage(
      {super.key, required this.doctor, required this.appointment});

  @override
  State<AppointmentConfirmationPage> createState() =>
      _AppointmentConfirmationPageState();
}

class _AppointmentConfirmationPageState
    extends State<AppointmentConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 20,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  spacing: 16,
                  children: [
                    Row(
                      spacing: 14,
                      children: [
                        Hero(
                          tag: 'doctor-${widget.doctor.name}',
                          child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: primaryColor, width: 1.8)),
                            child: ClipOval(
                              child: Image.asset(
                                widget.doctor.image,
                                height: 110,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.doctor.name,
                              style: TextStyle(
                                fontFamily: 'Lexend',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: widget.doctor.speciality,
                                    style: TextStyle(
                                      fontFamily: 'Lexend',
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' - ',
                                    style: TextStyle(
                                      fontFamily: 'Lexend',
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.doctor.experience,
                                    style: TextStyle(
                                      fontFamily: 'Lexend',
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(5, (index) {
                                if (index == 4) {
                                  // Add border to the last star
                                  return Icon(
                                    Icons.star_border_rounded,
                                    color: Color(0xFFFFA740),
                                  );
                                }
                                return Icon(
                                  Icons.star_rounded,
                                  color: Color(0xFFFFA740),
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      spacing: 16,
                      children: List.generate(2, (index) {
                        return Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: Colors.grey[300]!, width: 1.3)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              spacing: 4,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(index == 0 ? "Education" : "Licence No.",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                                Text(
                                  index == 0
                                      ? "University of Milan "
                                      : "8776123908123",
                                  style: TextStyle(color: primaryColor),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      'Detail Appointment',
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    Divider(
                      color: Colors.grey[300],
                    ),
                    Text(
                      'Date & time',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                    Text(
                      widget.appointment.day,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Location',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                    Text(
                      'Rossi Cardiology Clinic',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(
                      'Via Roma 12, 20100 Milano',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
                  NavManager.goTo(AppointmentConfirmedPage());
                },
                child: Container(
                  padding: EdgeInsets.all(14),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      'Confirm Appointment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Lexend',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
