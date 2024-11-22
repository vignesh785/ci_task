import 'package:ci_task/Utils/app_color.dart';
import 'package:ci_task/Utils/string_constant.dart';
import 'package:ci_task/features/Home_page/Controller/home_controller.dart';
import 'package:ci_task/features/Home_page/Screens/widget/common_list_tile.dart';
import 'package:ci_task/features/Home_page/Screens/widget/local_product_builder.dart';
import 'package:ci_task/features/Home_page/Screens/widget/product_dialog.dart';
import 'package:ci_task/features/Home_page/Screens/widget/rest_api_builder.dart';
import 'package:ci_task/features/Home_page/Screens/widget/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  Future<void> init() async {
    await context.read<HomeController>().init();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        if (!context.read<HomeController>().isLoading) {
          context.read<HomeController>().fetchData(isPagenation: true);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(StringResources.appbarTitile, style: TextStyle(color: AppColors.whiteColor)),
          backgroundColor: AppColors.primaryColor,
          centerTitle: true),
      body: Consumer<HomeController>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                if (provider.getProduct?.isNotEmpty ?? false) ...[const CommonListTile(title: StringResources.productTitile), const LocalProductBuilder()],
                CommonListTile(
                    title: StringResources.apiTitile,
                    titleAlign: TextAlign.left,
                    iconOnPressed: () async {
                      await showSearch(context: context, delegate: CustomSearchDelegate());
                    },
                    icon: Icons.search),
                const RestApiBuilder(),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
          style: ButtonStyle(backgroundColor: WidgetStateProperty.all(AppColors.primaryColor)),
          onPressed: () {
            ProductDialog.showProductDialog(context, product: null);
          },
          child: const Text(StringResources.addProduct, style: TextStyle(color: AppColors.whiteColor))),
    );
  }
}
