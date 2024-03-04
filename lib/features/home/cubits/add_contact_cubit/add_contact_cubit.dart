import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:one_tap/core/constants/constants.dart';
import 'package:one_tap/core/functions/custom_toast.dart';
import 'package:one_tap/core/models/contact_model.dart';
import 'package:one_tap/core/utils/app_colors.dart';
import 'package:one_tap/features/home/cubits/add_contact_cubit/add_contact_state.dart';

class AddContactCubit extends Cubit<AddContactState> {
  AddContactCubit() : super(AddContactInitial());

  addContact(ContactModel contact) async {
    try {
      emit(AddContactLoading());
      var contactsBox = Hive.box<ContactModel>(kContacts);
      await contactsBox.add(contact);
      emit(AddContactSuccess());
    } catch (e) {
      emit(AddContactFailure(errMessage: e.toString()));
      showToast(e.toString(), AppColors.primaryColor);
    }
  }
}
