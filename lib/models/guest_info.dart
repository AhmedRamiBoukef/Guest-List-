import '../app_data.dart';

class GuestInfo {
  final String fullName;
  final String phoneNumber;
  final Status status;
  final String imageUrl;

  GuestInfo(
      {required this.fullName,
      required this.phoneNumber,
      required this.status,
      required this.imageUrl});
}
