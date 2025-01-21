import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:medicare/constants/app_colors.dart';
import 'package:medicare/data/app_data.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  int type = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: double.infinity,
            child: CupertinoSlidingSegmentedControl(
              thumbColor: primaryColor,
              padding: const EdgeInsets.all(3),
              children: {
                0: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                  child: Text(
                    'Upcoming',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: type == 0 ? Colors.white : Colors.grey),
                  ),
                ),
                1: Text('Completed',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: type == 1 ? Colors.white : Colors.grey))
              },
              groupValue: type,
              onValueChanged: (value) {
                setState(() {
                  type = value!;
                  pageController.animateToPage(value,
                      duration: 250.ms, curve: Curves.easeIn);
                });
              },
            ),
          ).animate().moveY(
              begin: -100, end: 0, duration: 500.ms, curve: Curves.easeOutCirc),
          Expanded(
              child: PageView(
            onPageChanged: (val) {
              setState(() {
                type = val;
              });
            },
            controller: pageController,
            children: [
              UpcomingHistoryView(),
              CompletedHistoryView(),
            ],
          ))
        ],
      ),
    );
  }
}

class UpcomingHistoryView extends StatelessWidget {
  const UpcomingHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        final delay = (index * 80).ms;
        final doctor = AppData.doctors[index];
        return Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            spacing: 14,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          doctor.speciality,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        doctor.image,
                        height: 60,
                        width: 60,
                      )),
                ],
              ),
              Divider(
                color: Colors.grey[300],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date & time",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        Text(
                          'Wednesday, 29 Feb 04:00 pm',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        Text(
                          'Bella Vista Surgery Clinic, Via Garibaldi 10, Milan, Italy',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Reschedule"))),
                ],
              ),
            ],
          ),
        ).animate().fade(delay: delay);
      },
    );
  }
}

class CompletedHistoryView extends StatelessWidget {
  const CompletedHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        final delay = (index * 80).ms;
        final doctor = AppData.doctors[index];
        return Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            spacing: 14,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          doctor.speciality,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        doctor.image,
                        height: 60,
                        width: 60,
                      )),
                ],
              ),
              Divider(
                color: Colors.grey[300],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date & time",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        Text(
                          'Wednesday, 29 Feb 04:00 pm',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        Text(
                          'Bella Vista Surgery Clinic, Via Garibaldi 10, Milan, Italy',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                          side: WidgetStatePropertyAll(BorderSide(color: primaryColor)),
                          foregroundColor: WidgetStatePropertyAll(primaryColor)
                        ),
                          onPressed: () {}, child: Text("Add review",style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Lexend',
                          fontWeight: FontWeight.w500
                      ),))),
                  Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding: WidgetStatePropertyAll(EdgeInsets.zero)
                        ),
                          onPressed: () {}, child: Text("Next appointment",style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w500
                      ),))),
                ],
              ),
            ],
          ),
        ).animate().fade(delay: delay);
      },
    );
  }
}
