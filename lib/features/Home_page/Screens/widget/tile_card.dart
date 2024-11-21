import 'package:ci_task/Utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class TileCard extends StatelessWidget {
  const TileCard({super.key, this.image, this.title});
  final String? image;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: SizedBox(
          width: context.screenHeight * .09,
          child: Image.network(
            image ?? '',
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1) : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.error);
            },
          ),
        ),
        title: Text(title ?? ''),
      ),
    );
  }
}
