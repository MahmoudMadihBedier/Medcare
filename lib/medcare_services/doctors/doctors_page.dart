import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:medicare/constants/app_colors.dart';
import 'package:medicare/core/nav_manager.dart';
import 'package:medicare/data/app_data.dart';
import 'doctor_profile_page.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Doctors'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CupertinoSearchTextField(
              padding: EdgeInsets.symmetric(vertical: 14),
              placeholder: '   Search for doctors...',
              placeholderStyle: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontFamily: 'Lexend',
              ),
            ),
            SizedBox(height: 14),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  itemCount: AppData.doctors.length,
                  itemBuilder: (context, index) {
                    final delay = (index * 80).ms;
                    final doctor = AppData.doctors[index];
                    return GestureDetector(
                      onTap: (){
                        NavManager.goTo(DoctorProfilePage(doctor: doctor,));
                      },
                      child: AnimatedContainer(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 6),
                        duration: 130.ms,
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.2),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            )
                          ],
                        ),
                        child: Row(
                          spacing: 14,
                          children: [
                            Hero(
                              tag : 'doctor-${doctor.name}',
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  doctor.image,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctor.name,
                                    style: TextStyle(
                                      fontFamily: 'Lexend',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: doctor.speciality,
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
                                          text: doctor.experience,
                                          style: TextStyle(
                                            fontFamily: 'Lexend',
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: primaryColor.withValues(alpha: 0.1),
                                    ),
                                    child: Text(
                                      'Available on Wed - Fri',
                                      style: TextStyle(
                                        fontFamily: 'Lexend',
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CupertinoListTileChevron()
                          ],
                        ),
                      ).animate().fade(delay: delay, duration: 400.ms),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
