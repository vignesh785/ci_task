import 'package:ci_task/Utils/string_constant.dart';
import 'package:ci_task/features/Home_page/Controller/home_controller.dart';
import 'package:ci_task/features/Home_page/Model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDialog {
  static void showProductDialog(BuildContext context, {Product? product, int? index}) {
    final nameController = TextEditingController(text: product?.name);
    final priceController = TextEditingController(text: product?.price.toString());
    final descriptionController = TextEditingController(text: product?.description);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(product == null ? StringResources.addProduct : StringResources.editProduct),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(StringResources.cancel),
            ),
            TextButton(
              onPressed: () async {
                final name = nameController.text;
                final price = double.tryParse(priceController.text) ?? 0.0;
                final description = descriptionController.text;
                if (product == null) {
                  final newProduct = Product(name: name, price: price, description: description);
                  context.read<HomeController>().createProduct(newProduct);
                } else {
                  product.name = name;
                  product.price = price;
                  product.description = description;
                  context.read<HomeController>().updateProduct(index!, product);
                }
                Navigator.pop(context);
              },
              child: Text(product == null ? StringResources.add : StringResources.save),
            ),
          ],
        );
      },
    );
  }
}
