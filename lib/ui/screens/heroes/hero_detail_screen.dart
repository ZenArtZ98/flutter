import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/data/model/hero.dart';
import 'package:my_first_app/ui/resources/icons.dart';
import 'package:my_first_app/ui/widgets/app_card.dart';

class HeroDetailScreen extends StatelessWidget {
  final HeroModel hero;

  const HeroDetailScreen({
    super.key,
    required this.hero,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          hero.name,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.favoriteSolid,
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.network(
                  hero.image,
                  width: 180,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 17),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    AppIcons.health,
                    width: 80,
                    height: 80,
                  ),
                  Text(
                    hero.health.toString(),
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    AppIcons.shield,
                    width: 80,
                    height: 80,
                  ),
                  Text(
                    hero.armor.toString(),
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          AppCard(
            child: Text(
              'quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto',
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // const Block(),
        ],
      ),
    );
  }
}

// class Block extends StatefulWidget {
//   const Block({super.key});
//
//   @override
//   State<Block> createState() => _BlockState();
// }
//
// class _BlockState extends State<Block> {
//   Color color = Colors.blue;
//   final colors = [
//     Colors.purple,
//     Colors.yellow,
//     Colors.green,
//     Colors.blue,
//     Colors.blue,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       padding: const EdgeInsets.all(20),
//       color: Colors.red,
//       child: Column(
//         children: [
//           CenterBlock(color: color),
//           const SizedBox(height: 10),
//           Container(
//             color: Colors.white,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 for (var c in colors)
//                   TextButton(
//                     onPressed: () {
//                       color = c;
//                       setState(() {});
//                     },
//                     child: Container(
//                       height: 20,
//                       width: 20,
//                       color: c,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CenterBlock extends StatefulWidget {
//   final Color color;
//
//   const CenterBlock({
//     super.key,
//     required this.color,
//   });
//
//   @override
//   State<CenterBlock> createState() => _CenterBlockState();
// }
//
// class _CenterBlockState extends State<CenterBlock> {
//   late int colorVal;
//
//   @override
//   void initState() {
//     super.initState();
//     colorVal = widget.color.value;
//   }
//
//   @override
//   void didUpdateWidget(covariant CenterBlock oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.color.value != widget.color.value) {
//       colorVal = widget.color.value;
//       setState(() {});
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 50,
//       color: widget.color,
//       child: Text(colorVal.toString()),
//     );
//   }
// }
