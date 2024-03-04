import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_tap/features/home/cubits/add_contact_cubit/add_contact_state.dart';

class AddContactCubit extends Cubit<AddContactState> {
  AddContactCubit() : super(AddContactInitial());

}
