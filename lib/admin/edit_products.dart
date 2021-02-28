import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_stop/providers/product.dart';
import 'package:shop_stop/providers/products_provider.dart';

class EditProduct extends StatefulWidget {
  static const routeName = "/EditProducs";
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _priceFocusNode = FocusNode();
  final _ramNode = FocusNode();
  final _storageNode = FocusNode();
  final _batteryNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageURLController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var products = Product(
    id: null,
    battery: "",
    imageUrl: '',
    name: '',
    price: 0,
    hdd: '',
    ram: '',
  );
  var _initValues = {
    'title': '',
    'storage': '',
    'ram': '',
    'battery': '',
    'price': '',
    'imageUrl': '',
  };
  var _isInit = true;

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageURLController.text.startsWith('http') &&
              !_imageURLController.text.startsWith('https')) ||
          (!_imageURLController.text.endsWith('.png') &&
              !_imageURLController.text.endsWith('.jpg') &&
              !_imageURLController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        products = Provider.of<ProductsProvider>(context, listen: false)
            .findById(productId);
        _initValues = {
          'title': products.name,
          'storage': products.hdd,
          'ram': products.ram,
          'battery': products.battery,
          'price': products.price.toString(),
          // 'imageUrl': _editedProduct.imageUrl,
          'imageUrl': '',
        };
        _imageURLController.text = products.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _ramNode.dispose();
    _storageNode.dispose();
    _batteryNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    if (products.id != null) {
      Provider.of<ProductsProvider>(context, listen: false)
          .updateProduct(products.id, products);
    } else {
      Provider.of<ProductsProvider>(context, listen: false)
          .addProduct(products);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Your Products",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Fill in the fields and click on SUBMIT to add a new product",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 14),
                ),
              ),
              SizedBox(height: 25),
              Form(
                  key: _form,
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: _initValues['name'],
                        cursorColor: Theme.of(context).accentColor,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_priceFocusNode);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter a product name";
                          }
                          return null;
                        },
                        onSaved: (newVal) => products = Product(
                            name: newVal,
                            id: null,
                            imageUrl: products.imageUrl,
                            battery: products.battery,
                            ram: products.ram,
                            price: products.price),
                        decoration: InputDecoration(
                            labelText: "Product name",
                            border: OutlineInputBorder()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: _initValues['price'],
                        textInputAction: TextInputAction.next,
                        cursorColor: Theme.of(context).accentColor,
                        keyboardType: TextInputType.number,
                        focusNode: _ramNode,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter a product price";
                          }
                          return null;
                        },
                        onSaved: (newVal) => products = Product(
                            name: products.name,
                            id: null,
                            imageUrl: products.imageUrl,
                            battery: products.battery,
                            ram: products.ram,
                            price: double.parse(newVal)),
                        decoration: InputDecoration(
                          labelText: "Price",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: _initValues['RAM'],
                        textInputAction: TextInputAction.next,
                        cursorColor: Theme.of(context).accentColor,
                        focusNode: _storageNode,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter a product RAM";
                          }
                          return null;
                        },
                        onSaved: (newVal) => products = Product(
                            name: products.name,
                            id: null,
                            imageUrl: products.imageUrl,
                            battery: products.battery,
                            ram: newVal,
                            price: products.price),
                        decoration: InputDecoration(
                          labelText: "RAM",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: _initValues['storage '],
                        textInputAction: TextInputAction.next,
                        cursorColor: Theme.of(context).accentColor,
                        focusNode: _batteryNode,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter a product storage capacity";
                          }
                          return null;
                        },
                        onSaved: (newVal) => products = Product(
                            name: products.name,
                            id: null,
                            imageUrl: products.imageUrl,
                            battery: products.battery,
                            ram: products.ram,
                            hdd: newVal,
                            price: products.price),
                        decoration: InputDecoration(
                          labelText: "Storage",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        initialValue: _initValues['battery'],
                        cursorColor: Theme.of(context).accentColor,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please enter a product battery size";
                          }
                          return null;
                        },
                        onSaved: (newVal) => products = Product(
                            name: products.name,
                            id: null,
                            imageUrl: products.imageUrl,
                            battery: newVal,
                            ram: products.ram,
                            price: products.price),
                        decoration: InputDecoration(
                          labelText: "Battery",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.only(top: 8, right: 10),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey)),
                            child: _imageURLController.text.isEmpty
                                ? Text("Enter URL")
                                : FittedBox(
                                    child: Image.network(
                                    _imageURLController.text,
                                    fit: BoxFit.cover,
                                  )),
                          ),
                          Expanded(
                            child: TextFormField(
                              initialValue: _initValues['Image URL'],
                              cursorColor: Theme.of(context).accentColor,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter an image URL.';
                                }
                                if (!value.startsWith('http') &&
                                    !value.startsWith('https')) {
                                  return 'Please enter a valid URL.';
                                }
                                if (!value.endsWith('.png') &&
                                    !value.endsWith('.jpg') &&
                                    !value.endsWith('.jpeg')) {
                                  return 'Please enter a valid image URL.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: "Image URL",
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.url,
                              textInputAction: TextInputAction.done,
                              controller: _imageURLController,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          _saveForm();
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
