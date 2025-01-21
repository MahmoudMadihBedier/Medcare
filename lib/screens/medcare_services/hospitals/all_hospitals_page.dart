import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicare/core/nav_manager.dart';
import 'package:medicare/data/app_data.dart';
import '../../../constants/app_colors.dart';
import 'hospital_detail_page.dart';

class AllHospitalsPage extends StatelessWidget {
  const AllHospitalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hospitals'),
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
              padding: EdgeInsets.symmetric(vertical: 13),
              placeholder: '   Search for hospitals...',
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
                  itemCount: AppData.hospitals.length,
                  itemBuilder: (context, index) {
                    final delay = (index * 80).ms;
                    final hospital = AppData.hospitals[index];
                    return GestureDetector(
                      onTap: () {
                        NavManager.goTo(HospitalDetailPage(hospital: hospital));
                      },
                      child: AnimatedContainer(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 8),
                        duration: 130.ms,
                        // height: 100,
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
                        child: Column(
                          spacing: 3,
                          children: [
                            Row(
                              spacing: 14,
                              children: [
                                Hero(
                                  tag: hospital.image,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      hospital.image,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                ),
                                Expanded(
                                  child: Column(
                                    spacing: 4,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        hospital.name,
                                        style: TextStyle(
                                          fontFamily: 'Lexend',
                                          fontSize: 16,
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
                                            colorFilter: ColorFilter.mode(
                                                primaryColor, BlendMode.srcIn),
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
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.grey[300],
                            ),
                            Row(
                              spacing: 8,
                              children: [
                                Expanded(
                                  child: AnimatedContainer(
                                    duration: 130.ms,
                                    padding: EdgeInsets.symmetric(vertical: 7),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: primaryColor, width: 1.5),
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    child: Center(
                                      child: Text(
                                        'Bed Detail',
                                        style: TextStyle(
                                          color: primaryColor,
                                          fontFamily: 'Lexend',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: AnimatedContainer(
                                    duration: 130.ms,
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    child: Center(
                                      child: Text(
                                        'Contact Now',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Lexend',
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
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
