class AddContactState {}

final class AddContactInitial extends AddContactState {}

final class AddContactLoading extends AddContactState {}

final class AddContactSuccess extends AddContactState {}

final class AddContactFailure extends AddContactState {
  final String errMessage;

  AddContactFailure({required this.errMessage});
}
