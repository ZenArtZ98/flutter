import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkTheme;

  SettingsScreen({required this.toggleTheme, required this.isDarkTheme});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _language = "English";

  void _showLanguageSelection() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageSelectionBottomSheet(
          selectedLanguage: _language,
          onLanguageSelected: (String newLanguage) {
            setState(() {
              _language = newLanguage;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text('Theme'),
              trailing: Switch(
                value: widget.isDarkTheme,
                onChanged: (value) {
                  widget.toggleTheme();
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              trailing: TextButton(
                onPressed: _showLanguageSelection,
                child: Text(_language),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageSelectionBottomSheet extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onLanguageSelected;

  LanguageSelectionBottomSheet({
    required this.selectedLanguage,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose language',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Русский'),
            trailing: selectedLanguage == 'Русский' ? Icon(Icons.check, color: Colors.orange) : null,
            onTap: () => onLanguageSelected('Русский'),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('English'),
            trailing: selectedLanguage == 'English' ? Icon(Icons.check, color: Colors.orange) : null,
            onTap: () => onLanguageSelected('English'),
          ),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Choose'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
