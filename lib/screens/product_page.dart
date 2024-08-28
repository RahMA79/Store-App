import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/cutom_textfield.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});
  static String id = 'product Page';

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? title, desc, image, price;
  bool isLoading = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Retrieve the product model from the route arguments
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    // Set the initial values for the text fields
    _titleController.text = productModel.title;
    _priceController.text = productModel.price.toString();
    _descController.text = productModel.description;
    _imageController.text = productModel.image;
  }

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Product Details',
            style: styleappBar,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Image.network(
                  productModel.image,
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  height: 15,
                ),
                CutomTextField(
                  labelText: 'title',
                  controller: _titleController,
                  onChanged: (data) {
                    title = data;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CutomTextField(
                  labelText: 'price',
                  controller: _priceController,
                  onChanged: (data) {
                    price = data;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CutomTextField(
                  labelText: 'description',
                  controller: _descController,
                  onChanged: (data) {
                    desc = data;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CutomTextField(
                  labelText: 'image',
                  controller: _imageController,
                  onChanged: (data) {
                    image = data;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: 'Update Product',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});

                    try {
                      await updateProduct(productModel);
                      log('Success');
                      Navigator.pop(context);
                    } catch (e) {
                      log(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel productModel) async {
    await UpdateProductService().updateProduct(
        id: productModel.id,
        title: title == null ? productModel.title : title!,
        price: price == null ? productModel.price.toString() : price!,
        description: desc == null ? productModel.description : desc!,
        image: image == null ? productModel.image : image!,
        category: productModel.category);
  }

  @override
  void dispose() {
    // Dispose the controllers to free up resources
    _titleController.dispose();
    _priceController.dispose();
    _descController.dispose();
    _imageController.dispose();
    super.dispose();
  }
}
