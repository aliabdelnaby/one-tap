class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class SendEmailLoading extends SettingsState {}

final class SendEmailSuccess extends SettingsState {}

final class SendEmailFailure extends SettingsState {
  final String errMessage;

  SendEmailFailure({required this.errMessage});
}

