import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/product_page.dart';
import 'package:store_app/services/get_all_products_services.dart';

import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'Home Page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'New Trends',
          style: styleappBar,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
            ),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 65, left: 8, right: 8),
          child: FutureBuilder<List<ProductModel>>(
              future: AllProductsServices().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<ProductModel> products = snapshot.data!;

                  return GridView.builder(
                      clipBehavior: Clip.none,
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.3,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 70),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            // Navigate to the ProductPage and wait for the result
                            bool? updated = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductPage(),
                                settings: RouteSettings(
                                  arguments: products[index],
                                ),
                              ),
                            );

                            // If the product was updated, refresh the product list
                            if (updated == true) {
                              await AllProductsServices().getAllProducts();
                              setState(() {});
                              print(products[index]);
                            }
                          },
                          child: CustomCard(
                            productModel: products[index],
                          ),
                        );
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
