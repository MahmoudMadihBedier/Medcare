class AppData {
  static List<MyServices> services = [
    MyServices(imagePath: 'assets/icons/specialits.svg', label: 'Doctors'),
    MyServices(imagePath: 'assets/icons/hospitals.svg', label: 'Hospitals'),
    MyServices(
        imagePath: 'assets/icons/emergency.svg', label: 'Emergency Services'),
    MyServices(imagePath: 'assets/icons/article.svg', label: 'Article'),
    MyServices(
        imagePath: 'assets/icons/medication.svg', label: 'Medication Reminder'),
    MyServices(
        imagePath: 'assets/icons/specialization.svg', label: 'Specialization'),
  ];

  static List<Hospital> hospitals = [
    Hospital(
        name: 'St. Mary\'s Medical Center',
        image: 'assets/images/hospital0.png',
        location: "123 Health Lane, Springfield, USA",
        number: '(+1) 555-123-4567'),
    Hospital(
        name: 'Green Valley General Hospital',
        image: 'assets/images/hospital1.png',
        location: "45 Elm Street, Green Valley, USA",
        number: '(+1) 555-234-5678'),
    Hospital(
        name: 'Riverside Community Hospital',
        image: 'assets/images/hospital2.png',
        location: "78 River Road, Rivertown, USA",
        number: '(+1) 555-345-6789'),
    Hospital(
        name: 'Oakwood Medical Facility',
        image: 'assets/images/hospital3.png',
        location: "89 Oakwood Drive, Oakwood City, USA",
        number: '(+1) 555-456-7890'),
  ];

  static List<Doctor> doctors = [
    Doctor(
        name: 'Dr. fatma mohmmed',
        image: '',
        speciality: 'Cardiologist',
        experience: '5 years'),
    Doctor(
        name: 'Dr. Nadeer Nabil',
        image: 'assets/images/doctor1.png',
        speciality: 'Dentist',
        experience: '3 years'),
    Doctor(
        name: 'Dr. Salma Magedy',
        image: '',
        speciality: 'Pediatrician',
        experience: '7 years'),
    Doctor(
        name: 'Dr. John Doe',
        image: 'assets/images/doctor3.png',
        speciality: 'Skin Specialist',
        experience: '4 years'),
    Doctor(
        name: 'Dr. Anna Smith',
        image: 'assets/images/doctor4.png',
        speciality: 'Surgeon',
        experience: '4 years'),
    Doctor(
        name: 'Dr. Emma Anderson',
        image: 'assets/images/doctor5.png',
        speciality: 'Gynecologist',
        experience: '4 years'),
    Doctor(
        name: 'Dr. Fabian White',
        image: 'assets/images/doctor6.png',
        speciality: 'General Physician',
        experience: '4 years'),
  ];

  static List<Specialization> specializations = [
    Specialization(name: 'Brain', image: 'assets/icons/brain.svg'),
    Specialization(name: 'Heart', image: 'assets/icons/heart.svg'),
    Specialization(name: 'Dental', image: 'assets/icons/tooth.svg'),
    Specialization(name: 'Eye', image: 'assets/icons/eye.svg'),
    Specialization(name: 'Bone', image: 'assets/icons/bone.svg'),
    Specialization(name: 'Lungs', image: 'assets/icons/lungs.svg'),
  ];

  static List<Room> rooms = [
    Room(
        name: 'General Ward',
        perPerson: '4 persons per room',
        totalBeds: '120',
        availableBeds: '80 beds',
        price: "\$100-\$150"),
    Room(
        name: 'Private Room',
        perPerson: '1 person per room',
        totalBeds: '50',
        availableBeds: '25 beds',
        price: "\$200-\$300"),
    Room(
        name: 'Semi-Private Room',
        perPerson: '2 persons per room',
        totalBeds: '70',
        availableBeds: '45 beds',
        price: "\$150-\$200"),
    Room(
        name: 'ICU',
        perPerson: '1 person per room',
        totalBeds: '30',
        availableBeds: '10 beds',
        price: "\$400-\$600"),
    Room(
        name: 'Pediatric Ward',
        perPerson: '4 children per room',
        totalBeds: '40',
        availableBeds: '35 beds',
        price: "\$120-\$180"),
  ];

  static List<Products> products = [
    Products(image: 'assets/images/vaccine.png', name: 'Vaccine'),
    Products(image: 'assets/images/braces.png', name: 'Braces'),
    Products(image: 'assets/images/chair.png', name: 'WheelChair'),
    Products(image: 'assets/images/mask.png', name: 'Mask'),
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