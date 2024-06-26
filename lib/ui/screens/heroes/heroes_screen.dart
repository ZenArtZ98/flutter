import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_first_app/data/model/hero.dart';
import 'package:my_first_app/domain/di/get_it_services.dart';
import 'package:my_first_app/ui/resources/icons.dart';
import 'package:my_first_app/ui/screens/heroes/widgets/heroes_card.dart';

class StateHero {
  late bool isLoading;
  late String? error;
  late List<HeroModel> heroes;

  StateHero({
    this.isLoading = false,
    this.error,
    required this.heroes,
  });
}

class HeroesScreen extends StatefulWidget {
  const HeroesScreen({super.key});

  @override
  State<HeroesScreen> createState() => _HeroesScreenState();
}

class _HeroesScreenState extends State<HeroesScreen> {
  final state = StateHero(heroes: []);

  @override
  void initState() {
    super.initState();
    getData();
  }


  void getData() async {
    state.isLoading = true;
    setState(() {});
    final answer = await getItService.heroRepository.getListHero();
    if (answer.data != null) {
      state.heroes = answer.data!;
    } else {
      state.error = answer.error;
    }
    state.isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heroes'),
        actions: [
          IconButton(
            onPressed: getItService.navigatorService.onSettings,
            icon: SvgPicture.asset(
              AppIcons.setting,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                Theme.of(context).appBarTheme.iconTheme!.color!,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: state.isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : state.error != null
          ? Center(
        child: Text(state.error!),
      )
          : state.heroes.isEmpty
          ? const Center(
        child: Text('Героев нет'),
      )
          : ListView.separated(
        itemCount: state.heroes.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (_, index) => HeroesCard(
          hero: state.heroes[index],
        ),
        separatorBuilder: (_, index) => const SizedBox(height: 8),
      ),
    );
  }
}
