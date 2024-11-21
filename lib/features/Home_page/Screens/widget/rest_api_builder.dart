import 'package:ci_task/features/Home_page/Controller/home_controller.dart';
import 'package:ci_task/features/Home_page/Screens/widget/tile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestApiBuilder extends StatelessWidget {
  const RestApiBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context);
    final photos = provider.photosApiResponse?.data ?? [];
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: photos.length + 1,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (index == photos.length) {
          return provider.isLoading ? const Center(child: CircularProgressIndicator()) : const SizedBox.shrink();
        }
        return TileCard(
          image: photos[index].thumbnailUrl,
          title: photos[index].title,
        );
      },
    );
  }
}
