import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:via_whatsapp/features/settings/presentation/settings_cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
}
