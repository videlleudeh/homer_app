class FormState {
  final String firstName;
  final String lastName;
  final String userName;
  final String phoneNumber;
  final String email;
  final String password;

  FormState({
    this.firstName = "",
    this.lastName = "",
    this.userName = "",
    this.phoneNumber = "",
    this.email = "",
    this.password = "",
  });

  FormState copyWith({
    final String? firstName,
    final String? lastName,
    final String? userName,
    final String? phoneNumber,
    final String? email,
    final String? password,
  }) {
    return FormState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userName: userName ?? this.userName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
