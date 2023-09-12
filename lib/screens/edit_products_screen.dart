import 'package:flutter/material.dart';
import 'package:flutter_second_app/providers/product.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = "/edit-product";

  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlcontroller = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedProduct =
      Product(description: "", id: "", imageUrl: "", price: 0, title: "");

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void initState() {
    _imageUrlFocusNode
        .addListener(_updateImageUrl); // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlcontroller.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    print(_editedProduct.description);
    print(_editedProduct.id);
    print(_editedProduct.imageUrl);
    print(_editedProduct.isFavourite);
    print(_editedProduct.price);
    print(_editedProduct.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Product"),
          actions: [
            IconButton(
                onPressed: _saveForm,
                icon: const Icon(
                  Icons.save,
                  color: Colors.white,
                ))
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(15),
          child: Form(
              key: _form,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                        cursorHeight: 20,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_priceFocusNode);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please do not leave the text field empty";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          _editedProduct = Product(
                              description: _editedProduct.description,
                              id: _editedProduct.id,
                              imageUrl: _editedProduct.imageUrl,
                              price: _editedProduct.price,
                              title: value.toString());
                        },
                        decoration: InputDecoration(
                            labelText: "Title",
                            floatingLabelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    strokeAlign:
                                        BorderSide.strokeAlignOutside)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)))),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      cursorHeight: 20,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_descriptionFocusNode);
                      },
                      focusNode: _priceFocusNode,
                      onSaved: (value) {
                        _editedProduct = Product(
                            description: _editedProduct.description,
                            id: _editedProduct.id,
                            imageUrl: _editedProduct.imageUrl,
                            price: double.parse(value!),
                            title: _editedProduct.title);
                      },
                      decoration: InputDecoration(
                          labelText: "Price",
                          floatingLabelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  strokeAlign: BorderSide.strokeAlignOutside)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      maxLines: 3,
                      cursorHeight: 20,
                      textInputAction: TextInputAction.next,
                      focusNode: _descriptionFocusNode,
                      onSaved: (value) {
                        _editedProduct = Product(
                            description: value!,
                            id: _editedProduct.id,
                            imageUrl: _editedProduct.imageUrl,
                            price: _editedProduct.price,
                            title: _editedProduct.title);
                      },
                      decoration: InputDecoration(
                          labelText: "Description",
                          floatingLabelStyle: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  strokeAlign: BorderSide.strokeAlignOutside)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary))),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            cursorHeight: 20,
                            textInputAction: TextInputAction.next,
                            onSaved: (value) {
                              _editedProduct = Product(
                                  description: _editedProduct.description,
                                  id: _editedProduct.id,
                                  imageUrl: value!,
                                  price: _editedProduct.price,
                                  title: _editedProduct.title);
                            },
                            controller: _imageUrlcontroller,
                            focusNode: _imageUrlFocusNode,
                            onFieldSubmitted: (_) {
                              _saveForm();
                            },
                            decoration: InputDecoration(
                                labelText: "Image URL",
                                floatingLabelStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary))),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          margin: const EdgeInsets.only(top: 8, right: 10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          child: _imageUrlcontroller.text.isEmpty
                              ? const Center(child: Text("Enter a URL"))
                              : FittedBox(
                                  child: Image.asset(
                                    _imageUrlcontroller.text,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    /* ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(),
                  child: const SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Center(child: Text("Submit"))),
                )
                */
                  ],
                ),
              )),
        ));
  }
}
