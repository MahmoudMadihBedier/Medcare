import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:medicare/core/nav_manager.dart';
import '../../home/view_handler.dart';

class AppointmentConfirmedPage extends StatelessWidget {
  const AppointmentConfirmedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Confirmed'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Image.asset(
            'assets/images/confirmed.png',
            height: 200,
            width: 200,
          ).animate().scale(
              curve: Curves.easeOutBack, delay: 300.ms, duration: 600.ms),
          Text('Appointment have been confirmed',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(
              'Prepare your attendance well, arrive 30 minutes before the appointed time',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          ElevatedButton(onPressed: (){
            NavManager.gotoAndRemoveAllPrevious(ViewHandler());
          }, child: Text("Go to Home"))
        ],
      ),
    );
  }
}
