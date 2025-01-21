import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicare/constants/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 14,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.2),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    )
                  ],
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                spacing: 16,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/me.jpeg',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        'Imran Farooq',
                        style: TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        spacing: 6,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/mail.svg',
                            colorFilter:
                                ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                            height: 18,
                          ),
                          Text(
                            'imran@gmail.com',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontFamily: 'Lexend',
                            ),
                          )
                        ],
                      ),
                      Row(
                        spacing: 6,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/phone.svg',
                            colorFilter:
                                ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                            height: 18,
                          ),
                          Text(
                            '+923001234567',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontFamily: 'Lexend',
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ).animate().moveY(
                begin: -100,
                end: 0,
                duration: 500.ms,
                curve: Curves.easeOutCirc),
            SizedBox(height: 17),
            Text(
              'Menu',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'Lexend',
                fontWeight: FontWeight.w600,
              ),
            ),
            SettingTIle(imagePath: 'assets/icons/prescription.svg', title: 'Prescription History', subtitle: 'View all your prescriptions',),
            SettingTIle(imagePath: 'assets/icons/health.svg', title: 'Health History', subtitle: 'Check details regarding your medical history',),
            SettingTIle(imagePath: 'assets/icons/transaction.svg', title: 'Transactions', subtitle: 'Look back at your previous transactions',),
          Spacer(),
            AnimatedContainer(
              duration: 140.ms,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.red, width: 1.6)),
              child: Center(
                child: Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.red,
                      fontFamily: 'Lexend',
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ).animate().moveY(
                begin: 100,
                end: 0,
                duration: 500.ms,
                curve: Curves.easeOutCirc),
          ]),
    );
  }
}

class SettingTIle extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  const SettingTIle({
    super.key, required this.imagePath, required this.title, required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 130.ms,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!, width: 1.5),
      ),
      child: Row(
        spacing: 12,
        children: [
          SvgPicture.asset(
           imagePath,
            height: 30,
            colorFilter:
                ColorFilter.mode(primaryColor, BlendMode.srcIn),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               title,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontFamily: 'Lexend',
                  fontSize: 10,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
