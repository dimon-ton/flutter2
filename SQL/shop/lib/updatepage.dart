import 'package:flutter/material.dart';
import 'package:shop/product.dart';
import 'package:shop/sqlitedb.dart';

class UpdatePage extends StatefulWidget {
  final Product editProduct;

  const UpdatePage({Key? key, required this.editProduct}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late TextEditingController pdNameCtrlUpdate;
  late TextEditingController pdQuanCtrlUpdate;
  late TextEditingController pdPriceCtrlUpdate;

  Product editProduct = Product(status: false);
  SQLiteDatebase dbhelper = SQLiteDatebase();

  late int selectID;
  late double editTotal;
  late bool editStatus;

  @override
  void initState() {
    super.initState();
    selectID = widget.editProduct.id!;
    pdNameCtrlUpdate = TextEditingController(text: widget.editProduct.name);
    pdQuanCtrlUpdate =
        TextEditingController(text: widget.editProduct.quantity.toString());
    pdPriceCtrlUpdate =
        TextEditingController(text: widget.editProduct.price.toString());
    editTotal = widget.editProduct.total!;
    editStatus = widget.editProduct.status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
      ),
      body: Column(
        children: [buildEditForm()],
      ),
    );
  }

  Widget buildEditForm() {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: "ชื่อสินค้า"),
            controller: pdNameCtrlUpdate,
          ),
          TextField(
            decoration: InputDecoration(labelText: "จำนวนสินค้า"),
            keyboardType: TextInputType.number,
            controller: pdQuanCtrlUpdate,
          ),
          TextField(
            decoration: InputDecoration(labelText: "ราคาต่อหน่วย"),
            keyboardType: TextInputType.number,
            controller: pdPriceCtrlUpdate,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('มีสินค้าในสต็อกหรือไม่?'),
              Checkbox(
                  value: editStatus,
                  onChanged: (value) {
                    setState(() {
                      editStatus = value!;
                    });
                  })
            ],
          ),
          ElevatedButton(
              onPressed: () {
                if (pdNameCtrlUpdate.text.isNotEmpty &&
                    pdQuanCtrlUpdate.text.isNotEmpty &&
                    pdPriceCtrlUpdate.text.isNotEmpty) {
                  setState(() {
                    editData(context);
                  });
                }
              },
              child: Text('บันทึก'))
        ],
      ),
    );
  }

  void editData(BuildContext context) {
    editProduct.name = pdNameCtrlUpdate.text;
    editProduct.quantity = int.parse(pdQuanCtrlUpdate.text);
    editProduct.price = double.parse(pdPriceCtrlUpdate.text);
    editProduct.total = editProduct.quantity! * editProduct.price!;

    editProduct = Product(
        id: selectID,
        name: editProduct.name,
        quantity: editProduct.quantity,
        price: editProduct.price,
        total: editProduct.total,
        status: editProduct.status);

    dbhelper.updateProduct(editProduct);
    Navigator.pop(context, true);
  }
}
