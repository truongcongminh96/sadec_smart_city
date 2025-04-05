import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sadec_smart_city/core/di/injector.dart';
import 'package:sadec_smart_city/features/essential_services/categories/automatic_teller_machine/data/repositories/automatic_teller_machine_repository.dart';
import 'package:sadec_smart_city/features/essential_services/categories/automatic_teller_machine/logic/automatic_teller_machine_cubit.dart';
import 'package:sadec_smart_city/features/essential_services/categories/automatic_teller_machine/presentation/widgets/automatic_teller_machine_card.dart';
import 'package:sadec_smart_city/features/essential_services/categories/automatic_teller_machine/presentation/widgets/automatic_teller_machine_search_bar.dart';

class AutomaticTellerMachineScreen extends StatefulWidget {
  const AutomaticTellerMachineScreen({super.key});

  @override
  State<AutomaticTellerMachineScreen> createState() =>
      _AutomaticTellerMachineScreenState();
}

class _AutomaticTellerMachineScreenState
    extends State<AutomaticTellerMachineScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => AutomaticTellerMachineCubit(
            getIt<AutomaticTellerMachineRepository>(),
          )..loadAtms(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Danh sách ATM'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56),
            child: Builder(
              builder:
                  (context) => AutomaticTellerMachineSearchBar(
                    controller: _searchController,
                  ),
            ),
          ),
        ),
        body: BlocBuilder<
          AutomaticTellerMachineCubit,
          AutomaticTellerMachineState
        >(
          builder: (context, state) {
            if (state is AutomaticTellerMachineLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is AutomaticTellerMachineLoaded) {
              final atms = state.atms;
              if (atms.isEmpty) {
                return const Center(
                  child: Text("Không tìm thấy ATM."),
                );
              }
              return AnimationLimiter(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: atms.length,
                  itemBuilder: (context, index) {
                    final atm = atms[index];
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: AutomaticTellerMachineCard(atm: atm),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            if (state is AutomaticTellerMachineError) {
              return Center(child: Text('Lỗi: ${state.message}'));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
