import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit_product_screen';
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final priceFocusNode = FocusNode();
  final descriptionNode = FocusNode();
  void dispose() {
    priceFocusNode.dispose();
    descriptionNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(priceFocusNode);
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(descriptionNode);
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Descrption',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                textInputAction: TextInputAction.next,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: descriptionNode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
