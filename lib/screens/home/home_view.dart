import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicare/data/app_data.dart';
import '../../core/nav_manager.dart';
import '../medcare_services/article_view_page.dart';
import '../medcare_services/doctors/doctor_profile_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              AnimatedContainer(
                duration: 130.ms,
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFF2A083B),
                    Color(0xFF152A65),
                  ]),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(26.0) +
                            EdgeInsets.only(top: 12),
                        child: Column(
                          children: [
                            Text("إدارة رعاية صحية سلسة مع تطبيق ميد كير",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600))
                                .animate()
                                .scale(
                                    duration: 900.ms,
                                    curve: Curves.easeOutBack,
                                    delay: 600.ms),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset(
                        'assets/images/home.png',
                        height: 150,
                        width: 150,
                      ),
                    ).animate().scaleXY(
                        duration: 1.seconds,
                        curve: Curves.easeOutBack,
                        delay: 600.ms),
                  ],
                ),
              ),
              Positioned(
                top: -40,
                left: -45,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFD9D9D9).withValues(alpha: 0.2)),
                ),
              ).animate().moveX(
                  begin: -100, end: 0, duration: 600.ms, curve: Curves.easeIn),
              Positioned(
                top: -40,
                right: -180,
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFD9D9D9).withValues(alpha: 0.2)),
                ),
              ).animate().moveX(
                  begin: 100, end: 0, duration: 600.ms, curve: Curves.easeIn),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 14,
            children: [
              AnimatedContainer(
                margin: EdgeInsets.all(16),
                duration: 130.ms,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[400]!),
                ),
                child: Row(
                  spacing: 4,
                  children: [
                    Icon(
                      CupertinoIcons.search,
                      color: Colors.grey,
                    ),
                    Expanded(
                        child: Text(
                      'ابحث عن طبيب، مستشفى أو دواء',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey),
                    )),
                    SvgPicture.asset(
                      'assets/icons/tuning.svg',
                      colorFilter:
                          ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                      height: 22,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'أطباء قريبون منك',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: AppData.doctors.length,
                    itemBuilder: (context, index) {
                      final doctor = AppData.doctors[index];

                      return Hero(
                          tag: 'doctor-${doctor.name}',
                          child: GestureDetector(
                            onTap: () {
                              NavManager.goTo(
                                  DoctorProfilePage(doctor: doctor));
                            },
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(8),
                                  height: 180,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: AssetImage(doctor.image),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  padding: EdgeInsets.only(bottom: 12),
                                  height: 180,
                                  width: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withValues(alpha: 0.3),
                                        Colors.black.withValues(alpha: 0.8),
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        doctor.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          fontFamily: 'Lexend',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        maxLines: 1,
                                      ),
                                      Text(
                                        doctor.speciality,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          fontFamily: 'Lexend',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        maxLines: 1,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ));
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'أفضل المنتجات',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 105,
                child: GridView.builder(
                    itemCount: AppData.products.length,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10, crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      final delay = (index * 80).ms;
                      final product = AppData.products[index];
                      return Image.asset(product.image)
                          .animate()
                          .fade(delay: delay);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'مقالات طبية',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: 'Lexend',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ...List.generate(2, (index) {
                return GestureDetector(
                  onTap: (){
                    NavManager.goTo(ArticleViewPage(tag: 'article$index'));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[400]!),
                    ),
                    child: Row(
                      spacing: 12,
                      children: [
                        Hero(
                          tag : 'article$index',
                          child: Image.asset(
                            'assets/images/article$index.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            spacing: 2,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الوقاية من الأمراض',
                                style: TextStyle(color: Colors.black54),
                              ),
                              Text(
                                  'فهم التطعيمات وأهمية الطب الوقائي'),
                              Text(
                                '١٤ يناير ٢٠٢٥',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
              SizedBox(height: 20)
            ],
          )
        ],
      ),
    );
  }
}