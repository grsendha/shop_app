import 'package:flutter/material.dart';
import '../provider/product.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit_product_screen';
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final priceFocusNode = FocusNode();
  final descriptionNode = FocusNode();
  final imageController = TextEditingController();
  final imageNode = FocusNode();
  final form = GlobalKey<FormState>();
  var editedForm = Product(
    id: null,
    title: '',
    description: '',
    price: 0,
    imageUrl: '',
  );

  void initState() {
    imageNode.addListener(updateUrl);
  }

  void dispose() {
    imageNode.removeListener(updateUrl);
    priceFocusNode.dispose();
    descriptionNode.dispose();
    imageController.dispose();
  }

  void updateUrl() {
    if (!imageNode.hasFocus) {
      setState(() {});
    }
  }

  void saveForm() {
    final isValid = form.currentState.validate();
    if (!isValid) {
      return;
    }
    form.currentState.save();
    print(editedForm.id);
    print(editedForm.title);
    print(editedForm.description);
    print(editedForm.price);
    print(editedForm.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: form,
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
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Plese enter Valid Input';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(priceFocusNode);
                },
                onSaved: (value) {
                  editedForm = Product(
                    id: null,
                    title: value,
                    description: editedForm.description,
                    price: editedForm.price,
                    imageUrl: editedForm.imageUrl,
                  );
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Plese enter Price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid input';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than 0';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(descriptionNode);
                },
                onSaved: (value) {
                  editedForm = Product(
                    id: null,
                    title: editedForm.title,
                    description: editedForm.description,
                    price: double.parse(value),
                    imageUrl: editedForm.imageUrl,
                  );
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Descrption',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Plese enter Valid Input';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: descriptionNode,
                onSaved: (value) {
                  editedForm = Product(
                    id: null,
                    title: editedForm.title,
                    description: value,
                    price: editedForm.price,
                    imageUrl: editedForm.imageUrl,
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      // color: Colors.grey,
                    ),
                    child: imageController.text.isEmpty
                        ? Center(
                            child: Text('No URL'),
                          )
                        : FittedBox(
                            child: Image.network(
                              imageController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Image Url',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: imageController,
                      focusNode: imageNode,
                      onFieldSubmitted: (_) {
                        saveForm();
                      },
                      onSaved: (value) {
                        editedForm = Product(
                          id: null,
                          title: editedForm.title,
                          description: editedForm.description,
                          price: editedForm.price,
                          imageUrl: value,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
