import 'package:flutter/material.dart';
import 'package:medicare/constants/app_colors.dart';
import 'package:medicare/data/app_data.dart';

class DoctorProfilePage extends StatelessWidget {
  final Doctor doctor;
  const DoctorProfilePage({super.key, required this.doctor});

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
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 20,
          ),
          Hero(
            tag: 'doctor-${doctor.name}',
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: primaryColor, width: 1.8)),
              child: ClipOval(
                child: Image.asset(
                  doctor.image,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 14),
          Text(doctor.name,
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
          SizedBox(height: 8,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              if (index == 4) { // Add border to the last star
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
          )

        ],
      ),
    );
  }
}
