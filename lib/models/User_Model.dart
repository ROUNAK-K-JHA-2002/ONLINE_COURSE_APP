class UserModal {
  String? uid;
  String? firstName;
  String? secondName;
  String? email;

  UserModal({this.uid, this.email, this.firstName, this.secondName});

  //Recieving Data from server
  factory UserModal.fromMap(map) {
    return UserModal(
        uid: map['uid'],
        email: map['email'],
        firstName: map['FirstName'],
        secondName: map['SecondName']);
  }

  //Sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'FirstName': firstName,
      'SecondName': secondName,
    };
  }
}
