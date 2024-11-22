import 'package:ci_task/Utils/app_color.dart';
import 'package:ci_task/Utils/extensions/context_extension.dart';
import 'package:ci_task/Utils/string_constant.dart';
import 'package:ci_task/features/Home_page/Controller/home_controller.dart';
import 'package:ci_task/features/Home_page/Screens/widget/product_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocalProductBuilder extends StatelessWidget {
  const LocalProductBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context);
    return ListView.builder(
      itemCount: provider.getProduct?.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Dismissible(
          key: UniqueKey(),
          background: Container(
              color: AppColors.redColor,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: context.screenHeight * .020),
              child: Icon(Icons.delete, color: AppColors.whiteColor, size: context.screenHeight * .036)),
          onDismissed: (DismissDirection direction) {
            provider.deleteProduct(index);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(StringResources.deleteItem)));
          },
          child: ExpansionTile(
              childrenPadding:
                  EdgeInsets.only(bottom: context.screenHeight * .010, top: 0, left: context.screenHeight * .020, right: context.screenHeight * .020),
              title: Text(provider.getProduct![index].name),
              subtitle: Text(provider.getProduct![index].price.toString()),
              leading: const Icon(Icons.production_quantity_limits_outlined),
              trailing: IconButton(
                  onPressed: () {
                    ProductDialog.showProductDialog(context, index: index, product: provider.getProduct![index]);
                  },
                  icon: const Icon(Icons.edit)),
              children: [Text(provider.getProduct![index].description, softWrap: true)])),
    );
  }
}
