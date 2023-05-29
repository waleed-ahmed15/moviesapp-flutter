import 'package:flutter/material.dart';
import 'package:moviesapp/utils/text_styles.dart';

class Watch_Search_Row extends StatelessWidget {
  const Watch_Search_Row({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Watch",
          style: title_text_Style,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
