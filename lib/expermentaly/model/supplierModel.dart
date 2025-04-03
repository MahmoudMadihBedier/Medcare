import 'package:medicare/expermentaly/model/goodsmodel.dart';
import 'package:medicare/expermentaly/model/institution.dart';

class Supplier {
  String? name;
  String? email;
  String? mobile;
  String? address;
  String? city;
  String? state;
  String? country;
  String? zip;  
  String? image;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? id;
  String? userId;  
  String? userName;
  String? userImage;
  String? userEmail;
  String? userPhone;
  String? userAddress;
  String? userCity;
  String? userState;
  String? userCountry;  
  String? userZip;
  String? userCreatedAt;
  String? userUpdatedAt;      
  String? userDeletedAt;
  String? userIdCard;
  String? userIdCardImage;
  String? userIdCardType;
  String? userIdCardNumber;
  String? userIdCardExpiry;
  List<Goods> avilableGoods = [];
  List<Institution> partners = [];

  Supplier.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zip = json['zip'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    userImage = json['user_image'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
    userAddress = json['user_address'];
    userCity = json['user_city'];
    userState = json['user_state'];
    userCountry = json['user_country'];
    userZip = json['user_zip'];
    userCreatedAt = json['user_created_at'];
    userUpdatedAt = json['user_updated_at'];
    userDeletedAt = json['user_deleted_at'];
    userIdCard = json['user_id_card'];
    userIdCardImage = json['user_id_card_image'];
    userIdCardType = json['user_id_card_type'];
    userIdCardNumber = json['user_id_card_number'];
    userIdCardExpiry = json['user_id_card_expiry'];

    if (json['avilable_goods'] != null) {
      json['avilable_goods'].forEach((v) {
        avilableGoods.add(Goods.fromJson(v));
      });
    }
    if (json['partners'] != null) {
      json['partners'].forEach((v) {
        
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zip'] = this.zip;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_image'] = this.userImage;
    data['user_email'] = this.userEmail;
    data['user_phone'] = this.userPhone;
    data['user_address'] = this.userAddress;
    data['user_city'] = this.userCity;
    data['user_state'] = this.userState;
    data['user_country'] = this.userCountry;    
    data['user_zip'] = this.userZip;    
    data['user_created_at'] = this.userCreatedAt;    
    data['user_updated_at'] = this.userUpdatedAt;    
    data['user_deleted_at'] = this.userDeletedAt;    
    return data;
  }
  @override
  String toString() {
    return 'Supplier{name: $name, email: $email, mobile: $mobile, address: $address, city: $city, state: $state, country: $country, zip: $zip, image: $image, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, id: $id, userId: $userId, userName: $userName, userImage: $userImage, userEmail: $userEmail, userPhone: $userPhone, userAddress: $userAddress, userCity: $userCity, userState: $userState, userCountry: $userCountry, userZip: $userZip}';
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Supplier &&
        other.name == name &&
        other.email == email &&
        other.mobile == mobile &&
        other.address == address &&
        other.city == city &&
        other.state == state &&
        other.country == country &&
        other.zip == zip &&
        other.image == image &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt &&
        other.id == id &&
        other.userId == userId &&
        other.userName == userName &&
        other.userImage == userImage &&
        other.userEmail == userEmail &&
        other.userPhone == userPhone &&
        other.userAddress == userAddress &&
        other.userCity == userCity &&
        other.userState == userState &&
        other.userCountry == userCountry &&        
        other.userZip == userZip;
  }
  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        mobile.hashCode ^
        address.hashCode ^
        city.hashCode ^
        state.hashCode ^
        country.hashCode ^
        zip.hashCode ^
        image.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode ^
        id.hashCode ^
        userId.hashCode ^
        userName.hashCode ^
        userImage.hashCode ^
        userEmail.hashCode ^
        userPhone.hashCode ^
        userAddress.hashCode ^
        userCity.hashCode ^
        userState.hashCode ^
        userCountry.hashCode ^        
        userZip.hashCode;
  }
  
}
