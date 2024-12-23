import 'package:ci_task/Utils/string_constant.dart';
import 'package:ci_task/features/Home_page/Controller/home_controller.dart';
import 'package:ci_task/features/Home_page/Model/photos_api_response.dart';
import 'package:ci_task/features/Home_page/Screens/widget/tile_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<HomeController>(builder: (context, provider, child) {
      if (query.isNotEmpty) {
        provider.searchData(search: query);
      }
      if (provider.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      final photos = provider.searchResponse?.data ?? [];
      return ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return TileCard(
            image: photos[index].thumbnailUrl,
            title: photos[index].title,
          );
        },
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final photos = context.read<HomeController>().photosApiResponse?.data ?? [];
    final List<PhotosData> suggestionList =
        query.isEmpty ? [] : photos.where((item) => (item.title ?? '').toLowerCase().contains(query.toLowerCase())).toList();
    if (suggestionList.isEmpty) {
      return Center(
        child: Text(
          query.isEmpty ? StringResources.startTyping : StringResources.noSuggestion,
          style: const TextStyle(color: Colors.grey),
        ),
      );
    }
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return TileCard(
          image: suggestionList[index].thumbnailUrl,
          title: suggestionList[index].title,
        );
      },
    );
  }
}
