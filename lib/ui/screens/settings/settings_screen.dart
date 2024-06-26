import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:my_first_app/domain/services/settings_service.dart';
import 'package:my_first_app/ui/resources/colors.dart';
import 'package:my_first_app/ui/resources/icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_first_app/ui/screens/settings/widgets/language_modal.dart';
import 'package:my_first_app/ui/widgets/app_card.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool isDark;
  late SettingsService settingsService;

  @override
  void initState() {
    super.initState();
    settingsService = Provider.of<SettingsService>(context, listen: false);
    isDark = settingsService.isDark;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isDark = Provider.of<SettingsService>(context).isDark;
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primary,
          ),
          onPressed: Navigator.of(context).pop,
        ),
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          AppCard(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => const LanguageModal(),
              );
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  isDark ? AppIcons.moon : AppIcons.sun,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).appBarTheme.iconTheme!.color!,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Theme',
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Switch(
                  value: isDark,
                  onChanged: (val) {
                    settingsService.switchTheme();
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          AppCard(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => const LanguageModal(),
              );
            },
            child: Row(
              children: [
                Text(
                  'Language',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
