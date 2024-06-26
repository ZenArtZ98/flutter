import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int characterIndex;
  final bool isLiked;
  final VoidCallback toggleLike;

  DetailScreen({required this.characterIndex, required this.isLiked, required this.toggleLike});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spider man'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: isLiked ? Colors.red : null,
            ),
            onPressed: toggleLike,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  'https://c0.klipartz.com/pngpicture/271/55/gratis-png-spider-man-cartoon-sticker-tencent-qq-jsp-modelo-2-arquitectura-spider-man.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Sunt aut facere repellat provident occaecati excepturi optio reprehenderit',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

