import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/product_model.dart';
import 'package:shopping_app/models/cart_provider.dart';
import 'package:shopping_app/screens/cart_page.dart';

class ProductListingPage extends StatelessWidget {
  final List<Product> products = [
    Product(image:Image.asset("assets/images/image1.jpg") , name: 'Blanket', price: 99),
    Product(image: Image.asset("assets/images/image2.jpg"), name: 'Laptop', price: 299),
    Product(image: Image.asset("assets/images/image3.jpg"), name: 'Jacket', price: 450),
    Product(image: Image.asset("assets/images/image4.jpg"), name: 'Hat', price: 350),
    Product(image: Image.asset("assets/images/image5.jpg"), name: 'Table', price: 699),
    Product(image: Image.asset("assets/images/image6.jpg"), name: 'Mirror', price: 99),
    Product(image: Image.asset("assets/images/image7.jpg"), name: 'Books', price: 199),
    Product(image: Image.asset("assets/images/image8.jpg"), name: 'Kettle', price: 599),
    Product(image: Image.asset("assets/images/image9.jpg"), name: 'Diary', price: 89),
    Product(image: Image.asset("assets/images/image10.jpg"), name: 'Rope', price: 35),
    Product(image: Image.asset("assets/images/image11.jpg"), name: 'Lights', price: 250),
    Product(image: Image.asset("assets/images/image12.jpg"), name: 'Colours', price: 100),
  ];  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: Icon(Icons.trolley),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          bool isInCart = Provider.of<CartProvider>(context)
              .cartItems
              .contains(product);

          return ListTile(
            leading: CircleAvatar(child:product.image),
            title: Text(product.name),
            trailing: isInCart
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check),
                      SizedBox(width: 4),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .removeFromCart(product);
                        },
                      ),
                    ],
                  )
                : IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .addInCart(product);
                    },
                  ),
          );
        },
      ),
    );
  }
}
