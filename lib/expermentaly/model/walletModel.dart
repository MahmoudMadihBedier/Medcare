class Wallet {
  String? id;
  String? name;
  String? image;
  String? balance;
  String? currency;
  String? description;
  String? type;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
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
  Wallet({
    this.id,
    this.name,
    this.image,
    this.balance,
    this.currency,
    this.description,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.userId,
    this.userName,
    this.userImage,
    this.userEmail,
    this.userPhone,
    this.userAddress,
    this.userCity,
    this.userState,
    this.userCountry,
    this.userZip,
    this.userCreatedAt,
    this.userUpdatedAt,
    this.userDeletedAt,
    this.userIdCard,
    this.userIdCardImage,
    this.userIdCardType,
    this.userIdCardNumber,
    this.userIdCardExpiry,
  });
  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      balance: json['balance'],
      currency: json['currency'],
      description: json['description'],
      type: json['type'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      userId: json['user_id'],
      userName: json['user_name'],
      userImage: json['user_image'],
      userEmail: json['user_email'],
      userPhone: json['user_phone'],
      userAddress: json['user_address'],
      userCity: json['user_city'],
      userState: json['user_state'],
      userCountry: json['user_country'],
      userZip: json['user_zip'],
      userCreatedAt: json['user_created_at'],
      userUpdatedAt: json['user_updated_at'],
      userDeletedAt: json['user_deleted_at'],
      userIdCard: json['user_id_card'],
      userIdCardImage: json['user_id_card_image'],
      userIdCardType: json['user_id_card_type'],
      userIdCardNumber: json['user_id_card_number'],
      userIdCardExpiry: json['user_id_card_expiry'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'balance': balance,
      'currency': currency,
      'description': description,
      'type': type,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
      'user_id': userId,
      'user_name': userName,
      'user_image': userImage,
      'user_email': userEmail,
      'user_phone': userPhone,
      'user_address': userAddress,
      'user_city': userCity,
      'user_state': userState,
      'user_country': userCountry,
      'user_zip': userZip,
      'user_created_at': userCreatedAt,
      'user_updated_at': userUpdatedAt,
      'user_deleted_at': userDeletedAt,
      'user_id_card': userIdCard,
      'user_id_card_image': userIdCardImage,
      'user_id_card_type': userIdCardType,
      'user_id_card_number': userIdCardNumber,
      'user_id_card_expiry': userIdCardExpiry
    };
  }
  @override
  String toString() {
    return 'Wallet{id: $id, name: $name, image: $image, balance: $balance, currency: $currency, description: $description, type: $type, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, userId: $userId, userName: $userName, userImage: $userImage, userEmail: $userEmail, userPhone: $userPhone, userAddress: $userAddress, userCity: $userCity, userState: $userState, userCountry: $userCountry, userZip: $userZip, userCreatedAt: $userCreatedAt, userUpdatedAt: $userUpdatedAt, userDeletedAt: $userDeletedAt, userIdCard: $userIdCard, userIdCardImage: $userIdCardImage, userIdCardType: $userIdCardType, userIdCardNumber: $userIdCardNumber, userIdCardExpiry: $userIdCardExpiry}';
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Wallet &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.balance == balance &&
        other.currency == currency &&
        other.description == description &&
        other.type == type &&
        other.status == status &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.deletedAt == deletedAt &&
        other.userId == userId &&
        other.userName == userName &&
        other.userImage == userImage &&
        other.userEmail == userEmail &&
        other.userPhone == userPhone &&
        other.userAddress == userAddress &&
        other.userCity == userCity &&
        other.userState == userState &&
        other.userCountry == userCountry &&
        other.userZip == userZip &&
        other.userCreatedAt == userCreatedAt &&
        other.userUpdatedAt == userUpdatedAt &&
        other.userDeletedAt == userDeletedAt &&
        other.userIdCard == userIdCard &&
        other.userIdCardImage == userIdCardImage &&
        other.userIdCardType == userIdCardType &&
        other.userIdCardNumber == userIdCardNumber &&
        other.userIdCardExpiry == userIdCardExpiry;
  }
  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        balance.hashCode ^
        currency.hashCode ^
        description.hashCode ^
        type.hashCode ^
        status.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        deletedAt.hashCode ^
        userId.hashCode ^
        userName.hashCode ^
        userImage.hashCode ^
        userEmail.hashCode ^
        userPhone.hashCode ^
        userAddress.hashCode ^
        userCity.hashCode ^
        userState.hashCode ^
        userCountry.hashCode ^
        userZip.hashCode ^
        userCreatedAt.hashCode ^
        userUpdatedAt.hashCode ^
        userDeletedAt.hashCode ^
        userIdCard.hashCode ^
        userIdCardImage.hashCode ^
        userIdCardType.hashCode ^
        userIdCardNumber.hashCode ^
        userIdCardExpiry.hashCode;
  }
  @override
  Wallet copyWith({
    String? id,
    String? name,
    String? image,
    double? balance,
    String? currency,
    String? description,
    String? type,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? userId,
    String? userName,
    String? userImage,
    String? userEmail,
    String? userPhone,
    String? userAddress,
    String? userCity,
    String? userState,
    String? userCountry,  
    String? userZip,
    String? userCreatedAt,
    String? userUpdatedAt,      
    String? userDeletedAt,
    String? userIdCard,
    String? userIdCardImage,
    String? userIdCardType,
    String? userIdCardNumber,
    String? userIdCardExpiry,
  }) {
    return Wallet(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      currency: currency ?? this.currency,
      description: description ?? this.description,
      type: type ?? this.type,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userImage: userImage ?? this.userImage,
      userEmail: userEmail ?? this.userEmail,
      userPhone: userPhone ?? this.userPhone,
      userAddress: userAddress ?? this.userAddress,
      userCity: userCity ?? this.userCity,
      userState: userState ?? this.userState,
      userCountry: userCountry ?? this.userCountry,  
      userZip: userZip ?? this.userZip,
      userCreatedAt: userCreatedAt ?? this.userCreatedAt,
      userUpdatedAt: userUpdatedAt ?? this.userUpdatedAt,      
      userDeletedAt: userDeletedAt ?? this.userDeletedAt,
      userIdCard: userIdCard ?? this.userIdCard,
      userIdCardImage: userIdCardImage ?? this.userIdCardImage,
      userIdCardType: userIdCardType ?? this.userIdCardType,
      userIdCardNumber: userIdCardNumber ?? this.userIdCardNumber,
      userIdCardExpiry: userIdCardExpiry ?? this.userIdCardExpiry
    );
  }
  
}
