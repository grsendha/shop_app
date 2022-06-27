import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:BorderRadius.circular(15),
      child: GridTile(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(
              Icons.favorite,
            ),
            onPressed: () {},
            color:Theme.of(context).accentColor,
          ),
          title: Text(title),
          backgroundColor: Color.fromARGB(206, 0, 0, 0),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color:Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
