import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String phoneNumber;
  final String profilePicture;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String get fullName => "$firstName $lastName";
  // String get username => userName
  String get userUID => uid.substring(0, 8);

  static List<String> splitFullName(fullName) => fullName.split(" ");

  static UserModel empty() => UserModel(
    uid: " ",
    firstName: " ",
    lastName: " ",
    userName: " ",
    email: " ",
    phoneNumber: " ",
    profilePicture: " ",
  );

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  // Factory method to create a UserModel from a firestore document method.
  factory UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    if (json.data() != null) {
      final jsonData = json.data()!;
      return UserModel(
        uid: jsonData['uid'] ?? " ",
        firstName: jsonData['FirstName'] ?? " ",
        lastName: jsonData['LastName'] ?? " ",
        userName: jsonData['UserName'] ?? " ",
        email: jsonData['Email'] ?? " ",
        phoneNumber: jsonData['PhoneNumber'] ?? " ",
        profilePicture: jsonData['ProfilePicture'] ?? " ",
      );
    } else {
      return UserModel.empty();
    }
  }

  UserModel copyWith({
    final String? uid,
    final String? firstName,
    final String? lastName,
    final String? userName,
    final String? email,
    final String? phoneNumber,
    final String? profilePicture,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }
}
