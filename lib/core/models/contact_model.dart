import 'package:hive_flutter/hive_flutter.dart';
part 'contact_model.g.dart';

@HiveType(typeId: 0)
class ContactModel extends HiveObject {
  @HiveField(0)
  final String number;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final int iconCode;

  ContactModel({
    required this.number,
    required this.date,
    required this.iconCode,
  });
}
