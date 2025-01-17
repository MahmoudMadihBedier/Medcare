import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicare/data/app_data.dart';

import '../../constants/app_colors.dart';

class HospitalDetailPage extends StatelessWidget {
  final Hospital hospital;
  const HospitalDetailPage({super.key, required this.hospital});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospital details'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          top: false,
          child: Column(
            spacing: 6,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: hospital.image,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    hospital.image,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                hospital.name,
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                hospital.location,
                style: TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              Row(
                spacing: 6,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/phone.svg',
                    colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
                    height: 18,
                  ),
                  Text(
                    hospital.number,
                    style: TextStyle(
                      fontSize: 12,
                      color: primaryColor,
                      fontFamily: 'Lexend',
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 1,
                color: Colors.grey[200],
              ),
              Text(
                'Specialities',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Wrap(
                spacing: 7,
                runSpacing: 7,
                children: List.generate(AppData.specializations.length, (index) {
                  final delay = (index * 100).ms;
                  final speciality = AppData.specializations[index];
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[200]!,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                    height: 90,
                    width: 96.7,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          speciality.image,
                          height: 40,
                          width: 40,
                        ),
                        Text(
                          speciality.name,
                          style: TextStyle(
                            fontSize: 12,
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Lexend',
                          ),
                        )
                      ],
                    ),
                  ).animate().fade(delay: delay);
                }),
              ),
              Text(
                'Room types',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w600,
                ),
              ),
              ...List.generate(AppData.rooms.length, (index) {
                final room = AppData.rooms[index];
                final delay = (index * 100).ms;
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[500]!),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: room.name,
                              style: TextStyle(
                                fontSize: 14,
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Lexend',
                              ),
                            ),
                            TextSpan(
                              text: ' (${room.perPerson})',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontFamily: 'Lexend',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Total Beds: ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withValues(alpha: 0.6),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Lexend',
                              ),
                            ),
                            TextSpan(
                              text: room.totalBeds,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontFamily: 'Lexend',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Remaining availability: ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withValues(alpha: 0.6),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Lexend',
                              ),
                            ),
                            TextSpan(
                              text: room.availableBeds,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontFamily: 'Lexend',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Price per night: ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withValues(alpha: 0.6),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Lexend',
                              ),
                            ),
                            TextSpan(
                              text: room.price,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontFamily: 'Lexend',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).animate().slideY(delay: delay);
              }),
            ],
          ),
        ),
      ),
    );
  }



}

