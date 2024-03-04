import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_tap/features/home/presentation/widgets/custom_enter_mobile_nember_and_open_tele_whatsapp.dart';
import '../../home_cubit/home_cubit.dart';
import '../../home_cubit/home_state.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        TextEditingController phoneController = TextEditingController();
        return Form(
          key: cubit.phoneFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                CustomEnterMobileNumberAndOPenTeleAndWhatsApp(
                  phoneController: phoneController,
                  cubit: cubit,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
