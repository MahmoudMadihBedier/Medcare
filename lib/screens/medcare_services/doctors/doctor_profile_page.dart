import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medicare/components/buttons/primary_button.dart';
import 'package:medicare/constants/app_colors.dart';
import 'package:medicare/core/nav_manager.dart';
import 'package:medicare/data/app_data.dart';
import 'confirmation_page.dart';

class DoctorProfilePage extends StatefulWidget {
  final Doctor doctor;

  const DoctorProfilePage({super.key, required this.doctor});

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
  Appointment appointment = Appointment(day: '', time: '');
  late List<String> timeSlots;

  @override
  void initState() {
    super.initState();
    // Generate time slots once and store them
    timeSlots = _generateTimeSlots();
  }

  List<String> _generateTimeSlots() {
    final random = Random();
    List<String> slots = [];
    for (int i = 0; i < 6; i++) {
      final hour = random.nextInt(12) + 1; // 1 to 12
      final minute = random.nextInt(60); // 0 to 59
      final isAM = random.nextBool(); // Randomly choose AM or PM
      final time =
          '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} ${isAM ? 'AM' : 'PM'}';
      slots.add(time);
    }
    return slots;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor details'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share_rounded,
              size: 18,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 20,
            ),
            Hero(
              tag: 'doctor-${widget.doctor.name}',
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: primaryColor, width: 1.8)),
                child: ClipOval(
                  child: Image.asset(
                    widget.doctor.image,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 14),
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
            SizedBox(
              height: 8,
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
            SizedBox(height: 20),
            Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Row(
                    spacing: 16,
                    children: List.generate(2, (index) {
                      return Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
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
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Text(
                    'Practice Location',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ExpansionTile(
                  childrenPadding: EdgeInsets.symmetric(horizontal: 16),
                  collapsedIconColor: primaryColor,
                  title: Text(
                    'Rossi Cardiology Clinic',
                    style: TextStyle(
                      fontSize: 14,
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Lexend',
                    ),
                  ),
                  children: [
                    Row(
                      spacing: 6,
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: Colors.grey[500],
                          size: 14,
                        ),
                        Text(
                          'Via Roma 12, 20100 Milano',
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      spacing: 6,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/phone.svg',
                          colorFilter: ColorFilter.mode(
                              Colors.grey[500]!, BlendMode.srcIn),
                          height: 14,
                        ),
                        Text(
                          '+98(213)8893240',
                          style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Text(
                    'Working Hours',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Wrap(
                    runSpacing: 6,
                    spacing: 6,
                    children: List.generate(timeSlots.length, (index) {
                      final time = timeSlots[index];
                      final selected = appointment.time == time;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            appointment = Appointment(
                              day: appointment.day,
                              time: time,
                            );
                          });
                        },
                        child: AnimatedContainer(
                          duration: 130.ms,
                          height: 40,
                          width: MediaQuery.of(context).size.width / 4.59,
                          decoration: BoxDecoration(
                            color: selected ? primaryColor : Colors.white,
                            border: Border.all(
                                color:
                                    selected ? primaryColor : Colors.grey[500]!,
                                width: 1.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                              child: Text(
                            time,
                            style: TextStyle(
                                color: selected ? Colors.white : Colors.grey[600],
                                fontSize: 12),
                            textAlign: TextAlign.center,
                          )),
                        ),
                      );
                    }),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
                  child: Text(
                    'Schedule',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 365,
                    itemBuilder: (context, index) {
                      DateTime date = DateTime.now().add(Duration(days: index));
        
                      String day = DateFormat('d').format(date);
                      String weekDay = DateFormat('EEE').format(date);
                      bool isWeekend = date.weekday == DateTime.saturday ||
                          date.weekday == DateTime.sunday;
                      String dayForStoring =
                          DateFormat('EEEE, d MMM').format(date);
                      final isSelected = appointment.day == dayForStoring;
        
                      return GestureDetector(
                        onTap: () {
                          if (isWeekend) return;
                          setState(() {
                            appointment = Appointment(
                              day: dayForStoring,
                              time: appointment.time,
                            );
                          });
                        },
                        child: AnimatedContainer(
                          duration: 300.ms,
                          width: 60,
                          margin: const EdgeInsets.only(left: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color:
                                    isSelected ? primaryColor : Colors.grey[500]!,
                                width: 1.3),
                            color: isSelected ? primaryColor : Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                weekDay,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: isWeekend
                                      ? Colors.grey
                                      : isSelected
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                              Text(
                                day,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: isWeekend
                                      ? Colors.grey
                                      : isSelected
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                            .animate()
                            .effect(duration: 600.ms)
                            .fade()
                            .moveX(begin: index.toDouble(), end: 0),
                      );
                    },
                  ),
                ),
                PrimaryButton(
                  text: 'Book Appointment',
                  buttonColor:
                      appointment.time.isNotEmpty && appointment.day.isNotEmpty
                          ? primaryColor
                          : Colors.grey[300]!,
                  textColor:
                      appointment.time.isNotEmpty && appointment.day.isNotEmpty
                          ? Colors.white
                          : Colors.grey[600]!,
                  onTap: () {
                    if (appointment.time.isEmpty || appointment.day.isEmpty)
                      return;
        
                    NavManager.goTo(AppointmentConfirmationPage(
                      doctor: widget.doctor,
                      appointment: appointment,
                    ));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
