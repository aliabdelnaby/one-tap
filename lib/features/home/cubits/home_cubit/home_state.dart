class HomeState {}

final class HomeInitial extends HomeState {}

final class OpenWhatsAppLoading extends HomeState {}

final class OpenWhatsAppSuccess extends HomeState {}

final class OpenWhatsAppFailure extends HomeState {
  final String errMessage;

  OpenWhatsAppFailure({required this.errMessage});
}

final class OpenTelegramLoading extends HomeState {}

final class OpenTelegramSuccess extends HomeState {}

final class OpenTelegramFailure extends HomeState {
  final String errMessage;

  OpenTelegramFailure({required this.errMessage});
}

final class AddContactLoading extends HomeState {}

final class AddContactSuccess extends HomeState {}

final class AddContactFailure extends HomeState {
  final String errMessage;

  AddContactFailure({required this.errMessage});
}

final class ContactsLoading extends HomeState {}

final class ContactstSuccess extends HomeState {}

final class ContactsFailure extends HomeState {
  final String errMessage;

  ContactsFailure({required this.errMessage});
}

final class DeleteAllContactsLoading extends HomeState {}

final class DeleteAllContactstSuccess extends HomeState {}

final class DeleteAllContactsFailure extends HomeState {
  final String errMessage;

  DeleteAllContactsFailure({required this.errMessage});
}

final class ChangeLanguageLoading extends HomeState {}

final class ChangeLanguageSuccess extends HomeState {}

final class ChangeLanguageFailure extends HomeState {
  final String errMessage;

  ChangeLanguageFailure({required this.errMessage});
}
