class AppUserModel {
  final String? userId;
  final String userEmail;
  final String userPassword;
  final String? userName;

  AppUserModel(
      {required this.userEmail,
      required this.userPassword,
      this.userId,
      this.userName});
}
