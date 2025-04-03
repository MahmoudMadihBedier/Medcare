class AppData {
  static List<MyServices> services = [
    MyServices(imagePath: 'assets/icons/specialits.svg', label: 'الأطباء'),
    MyServices(imagePath: 'assets/icons/hospitals.svg', label: 'المستشفيات'),
    MyServices(
        imagePath: 'assets/icons/emergency.svg', label: 'الطوارئ'),
    MyServices(imagePath: 'assets/icons/article.svg', label: 'مقالات طبية'),
    MyServices(
        imagePath: 'assets/icons/medication.svg', label: 'منبه الأدوية'),
    MyServices(
        imagePath: 'assets/icons/specialization.svg', label: 'التخصصات'),
  ];

  static List<Hospital> hospitals = [
    Hospital(
        name: 'مستشفى القاهرة التخصصي',
        image: 'assets/images/hospital0.png',
        location: "شارع مصطفى النحاس، مدينة نصر، القاهرة",
        number: '01001234567'),
    Hospital(
        name: 'مستشفى مصر الدولي',
        image: 'assets/images/hospital1.png',
        location: "شارع الجلاء، وسط البلد، القاهرة",
        number: '01002345678'),
    Hospital(
        name: 'مستشفى الأسكندرية العام',
        image: 'assets/images/hospital2.png',
        location: "شارع سعد زغلول، الأسكندرية",
        number: '01003456789'),
    Hospital(
        name: 'مستشفى أسيوط الجامعي',
        image: 'assets/images/hospital3.png',
        location: "شارع الجامعة، أسيوط",
        number: '01004567890'),
  ];

  static List<Doctor> doctors = [
    Doctor(
        name: 'د. فاطمة محمد',
        image: "",
        speciality: 'أخصائية قلب',
        experience: '5 سنوات خبرة'),
    Doctor(
        name: 'د. ندير نبيل',
        image: 'assets/images/doctor1.png',
        speciality: 'طبيب أسنان',
        experience: '3 سنوات خبرة'),
    Doctor(
        name: 'د. سلمى مجدي',
        image: "",
        speciality: 'طبيبة أطفال',
        experience: '7 سنوات خبرة'),
    Doctor(
        name: 'د. أحمد علي',
        image: 'assets/images/doctor3.png',
        speciality: 'أخصائي جلدية',
        experience: '4 سنوات خبرة'),
    Doctor(
        name: 'د. منى سعيد',
        image: 'assets/images/doctor4.png',
        speciality: 'جراحة عامة',
        experience: '4 سنوات خبرة'),
    Doctor(
        name: 'د. هناء عبد الرحمن',
        image: 'assets/images/doctor5.png',
        speciality: 'أمراض نساء وتوليد',
        experience: '4 سنوات خبرة'),
    Doctor(
        name: 'د. خالد فاروق',
        image: 'assets/images/doctor6.png',
        speciality: 'طب عام',
        experience: '4 سنوات خبرة'),
  ];

  static List<Specialization> specializations = [
    Specialization(name: 'المخ والأعصاب', image: 'assets/icons/brain.svg'),
    Specialization(name: 'القلب', image: 'assets/icons/heart.svg'),
    Specialization(name: 'الأسنان', image: 'assets/icons/tooth.svg'),
    Specialization(name: 'العيون', image: 'assets/icons/eye.svg'),
    Specialization(name: 'العظام', image: 'assets/icons/bone.svg'),
    Specialization(name: 'الصدر', image: 'assets/icons/lungs.svg'),
  ];

  static List<Room> rooms = [
    Room(
        name: 'عنبر عام',
        perPerson: '4 أشخاص في الغرفة',
        totalBeds: '120',
        availableBeds: '80 سرير متاح',
        price: "100-150 جنيه"),
    Room(
        name: 'غرفة خاصة',
        perPerson: 'شخص واحد في الغرفة',
        totalBeds: '50',
        availableBeds: '25 سرير متاح',
        price: "200-300 جنيه"),
    Room(
        name: 'غرفة شبه خاصة',
        perPerson: 'شخصان في الغرفة',
        totalBeds: '70',
        availableBeds: '45 سرير متاح',
        price: "150-200 جنيه"),
    Room(
        name: 'العناية المركزة',
        perPerson: 'شخص واحد في الغرفة',
        totalBeds: '30',
        availableBeds: '10 سرير متاح',
        price: "400-600 جنيه"),
    Room(
        name: 'عنبر الأطفال',
        perPerson: '4 أطفال في الغرفة',
        totalBeds: '40',
        availableBeds: '35 سرير متاح',
        price: "120-180 جنيه"),
  ];

  static List<Products> products = [
    Products(image: 'assets/images/vaccine.png', name: 'لقاح'),
    Products(image: 'assets/images/braces.png', name: 'تقويم أسنان'),
    Products(image: 'assets/images/chair.png', name: 'كرسي متحرك'),
    Products(image: 'assets/images/mask.png', name: 'كمامة طبية'),
  ];
}

class MyServices {
  final String imagePath;
  final String label;

  MyServices({required this.imagePath, required this.label});
}

class Hospital {
  final String name;
  final String image;
  final String location;
  final String number;

  Hospital(
      {required this.name,
      required this.image,
      required this.location,
      required this.number});
}

class Doctor {
  final String name;
  final String image;
  final String speciality;
  final String experience;

  Doctor(
      {required this.name,
      required this.image,
      required this.speciality,
      required this.experience});
}

class Specialization {
  final String name;
  final String image;

  Specialization({required this.name, required this.image});
}

class Room {
  final String name;
  final String perPerson;
  final String totalBeds;
  final String availableBeds;
  final String price;

  Room(
      {required this.name,
      required this.perPerson,
      required this.totalBeds,
      required this.availableBeds,
      required this.price});
}

class Products {
  final String image;
  final String name;

  Products({required this.image, required this.name});
}

class Appointment{
  final String day;
  final String time;

  Appointment({required this.day, required this.time});
}