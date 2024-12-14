class Details {
  String id;
  String address;
  String contactNumber;
  String email;

  Details({
    required this.id,
    required this.address,
    required this.contactNumber,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'address': address,
      'contactNumber': contactNumber,
      'email': email,
    };
  }

  factory Details.fromJson(Map<String, dynamic> map) {
    return Details(
      id: map['_id'] as String,
      address: map['address'] as String,
      contactNumber: map['contactNumber'] as String,
      email: map['email'] as String,
    );
  }
}
