import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicare/core/nav_manager.dart';
import 'package:medicare/data/app_data.dart';
import '../medcare_services/doctors/doctors_page.dart';
import '../medcare_services/hospitals/all_hospitals_page.dart';
import '../medcare_services/medication_reminder/all_reminders.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: GridView.builder(
                padding: EdgeInsets.all(16),
                itemCount: AppData.services.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12),
                itemBuilder: (context, index) {
                  final delay = (index * 80).ms;
                  final service = AppData.services[index];
                  return GestureDetector(
                    onTap: (){
                      if(index == 0){
                        NavManager.goTo(DoctorsPage());
                      }else if(index == 1){
                        NavManager.goTo(AllHospitalsPage());
                      }else if(index == 4){
                        NavManager.goTo(AllReminders());
                      }
                    },
                    child: AnimatedContainer(
                      duration: 140.ms,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                        children: [
                          SvgPicture.asset(
                            service.imagePath,
                            height: 52,
                            width: 52,
                          ),
                          Spacer(),
                          Text(
                            service.label,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: 'Lexend', fontSize: 13),
                          ),
                          Spacer(),
                        ],
                      ),
                    )
                        .animate()
                        .scale(alignment: Alignment.centerLeft, delay: delay),
                  );
                }))
      ],
    );
  }
}
