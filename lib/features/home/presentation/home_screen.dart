import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sadec_smart_city/features/home/logic/home_cubit.dart';
import 'package:sadec_smart_city/features/home/presentation/widgets/citizen_services_grid.dart';
import 'package:sadec_smart_city/features/home/presentation/widgets/slider_banner.dart';
import 'package:sadec_smart_city/shared/widgets/smart_theme_switch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleStyle = GoogleFonts.sora(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );

    return BlocProvider(
      create: (context) => HomeCubit()..fetchMenuItems(),
      child: _HomeView(titleStyle: titleStyle),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({required this.titleStyle});

  final TextStyle titleStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sa Đéc Smart City'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: SmartThemeSwitch(),
          ),
        ],
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo_sdc.png'),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SliderBanner(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Công dân số", style: titleStyle),
                  Builder(
                    builder: (context) {
                      final hour = DateTime.now().hour;
                      final greeting =
                          (hour >= 5 && hour < 18)
                              ? 'Chào buổi sáng 🌞'
                              : 'Chào buổi tối 🌙';
                      return Text(
                        greeting,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeLoaded) {
                    return CitizenServicesGrid(items: state.items);
                  } else if (state is HomeError) {
                    return Center(child: Text("Lỗi: ${state.message}"));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
