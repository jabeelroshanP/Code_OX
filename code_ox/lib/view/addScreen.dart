import 'package:code_ox/controller/dropDownProvider.dart';
import 'package:code_ox/controller/provider.dart';
import 'package:code_ox/model/products_model.dart';
import 'package:code_ox/view/dropDownScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Addscreen extends StatelessWidget {
  Addscreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleCtrl = TextEditingController();
    TextEditingController priceCtrl = TextEditingController();
    TextEditingController descriptionCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              TextFormField(
                controller: titleCtrl,
                decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: priceCtrl,
                decoration: InputDecoration(
                  hintText: "Price",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                maxLines: 4,
                controller: descriptionCtrl,
                decoration: InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),

              DropdownScreen(),

              ElevatedButton(
                onPressed: () async {
                  if (titleCtrl.text.isNotEmpty &&
                      priceCtrl.text.isNotEmpty &&
                      descriptionCtrl.text.isNotEmpty &&
                      context.read<DropdownProvider>().selectedValue != null) {
                    
                    final product = ProductsModel(
                      title: titleCtrl.text,
                      price: double.tryParse(priceCtrl.text) ?? 0,
                      description: descriptionCtrl.text,
                      category: context.read<DropdownProvider>().selectedValue!,
                    );

                    await provider.addProducts(product);

                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Product Added Successfully")),
                    );
                  }
                },
                child: Text('Add'),
              ),
            ],
          );
        },
      ),
    );
  }
}
