import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicare/constants/app_colors.dart';
import 'package:medicare/home/home_view.dart';
import 'package:medicare/home/profile_view.dart';
import 'package:medicare/home/services_view.dart';

class ViewHandler extends StatefulWidget {
  const ViewHandler({super.key});

  @override
  State<ViewHandler> createState() => _ViewHandlerState();
}

class _ViewHandlerState extends State<ViewHandler> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text.rich(
          TextSpan(
            text: "Med",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: "Care",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // Navigate to the AddRecordPage
              },
              icon: SvgPicture.asset('assets/icons/cart.svg')),
          IconButton(
              onPressed: () {
                // Navigate to the AddRecordPage
              },
              icon: SvgPicture.asset('assets/icons/bell.svg')),
          SizedBox(width: 12),
        ],
      ),
      
      body: handleScreen(currentIndex),
      
      
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: bgColor,
          selectedItemColor: primaryColor,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 12,
          unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 10),
          selectedIconTheme: IconThemeData(color: primaryColor, size: 24),
          selectedLabelStyle: TextStyle(color: primaryColor, fontSize: 10.4),
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: List.generate(navigationItems.length, (index) {
            final item = navigationItems[index];
            return BottomNavigationBarItem(
                icon: index == currentIndex
                    ? SvgPicture.asset(
                        item.selectedIcon,
                        colorFilter:
                            ColorFilter.mode(primaryColor, BlendMode.srcIn),
                      )
                    : SvgPicture.asset(item.unSelectedIcon),
                label: item.label);
          })),
    );
  }
  
  Widget handleScreen(int index){
    switch(index){
      case 0:
        return HomeView();
      case 1:
        return ServicesView();
      case 2:
        return ServicesView(); //TODO change this to HistoryView
      case 3:
        return ProfileView();
      default:
        return HomeView();
    }
  }
  
  
}

class NavigationItems {
  final String unSelectedIcon;
  final String selectedIcon;
  final String label;

  NavigationItems(
      {required this.unSelectedIcon,
      required this.selectedIcon,
      required this.label});
}

List<NavigationItems> navigationItems = [
  NavigationItems(
      unSelectedIcon: 'assets/icons/home.svg',
      selectedIcon: 'assets/icons/homeFilled.svg',
      label: 'Home'),
  NavigationItems(
      unSelectedIcon: 'assets/icons/services.svg',
      selectedIcon: 'assets/icons/servicesFilled.svg',
      label: 'Services'),
  NavigationItems(
      unSelectedIcon: 'assets/icons/history.svg',
      selectedIcon: 'assets/icons/historyFilled.svg',
      label: 'History'),
  NavigationItems(
      unSelectedIcon: 'assets/icons/profile.svg',
      selectedIcon: 'assets/icons/profileFilled.svg',
      label: 'Profile'),
];
