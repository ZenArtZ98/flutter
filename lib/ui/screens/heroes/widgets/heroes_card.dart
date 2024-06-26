import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_first_app/data/model/hero.dart';
import 'package:my_first_app/domain/di/get_it_services.dart';
import 'package:my_first_app/ui/resources/icons.dart';
import 'package:my_first_app/ui/widgets/app_card.dart';
import 'package:my_first_app/ui/resources/text.dart';


class HeroesCard extends StatelessWidget {
  final HeroModel hero;

  const HeroesCard({
    super.key,
    required this.hero,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () => getItService.navigatorService.onHeroDetail(hero: hero),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.network(
                hero.image,
                width: 60,
                height: 52,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Text(
              hero.name,
              style: AppText.body,
            ),
          ),
          const SizedBox(width: 22),
          SvgPicture.asset(AppIcons.favorite),
        ],
      ),
    );
  }
}
