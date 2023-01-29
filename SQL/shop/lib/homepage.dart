import 'package:flutter/material.dart';
import 'package:shop/product.dart';
import 'package:shop/sqlitedb.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pdNameCtrl = TextEditingController();
  final pdQuanCtrl = TextEditingController();
  final pdPriceCtrl = TextEditingController();

  Product product = Product(status: false);

  SQLiteDatebase dbHelper = SQLiteDatebase();

  List<Product> pdList = [];

  _refreshList() async {
    List<Product> lists = await dbHelper.readProducts();
    setState(() {
      pdList = lists;
    });
  }

  @override
  void initState() {
    super.initState();
    product.status = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [buildForm(), buildListView()],
        ),
      ),
    );
  }

  Widget buildForm() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: "ชื่อสินค้า"),
          controller: pdNameCtrl,
        ),
        TextField(
          decoration: InputDecoration(labelText: "จำนวนสินค้า"),
          keyboardType: TextInputType.number,
          controller: pdQuanCtrl,
        ),
        TextField(
          decoration: InputDecoration(labelText: "ราคาต่อหน่วย"),
          keyboardType: TextInputType.number,
          controller: pdPriceCtrl,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('มีสินค้าในสต็อกหรือไม่?'),
            Checkbox(
                value: product.status,
                onChanged: (value) {
                  setState(() {
                    product.status = value!;
                  });
                })
          ],
        ),
        ElevatedButton(
            onPressed: () {
              if (pdNameCtrl.text.isNotEmpty &&
                  pdQuanCtrl.text.isNotEmpty &&
                  pdPriceCtrl.text.isNotEmpty) {
                saveData();
              }
            },
            child: Text('บันทึก'))
      ],
    );
  }

  Widget buildListView() {
    return Expanded(
        child: Card(
      child: Scrollbar(
          child: ListView.builder(
              itemCount: pdList.isEmpty ? 0 : pdList.length,
              itemBuilder: (context, index) {
                int pdID = pdList[index].id!;
                String pdName = pdList[index].name!;
                int pdQuan = pdList[index].quantity!;
                double pdPrice = pdList[index].price!;
                double pdTotal = pdList[index].total!;
                bool pdStatus = pdList[index].status;

                return Column(
                  children: [
                    ListTile(
                      title: Text('$pdID $pdName'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('จำนวน: $pdQuan'),
                          Text('ราคาต่อหน่วย: $pdPrice'),
                          Text('ยอดรวม: $pdTotal'),
                          Text('สต็อกสินค้า: ${pdStatus ? 'มี' : 'ไม่มี'}')
                        ],
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              })),
    ));
  }

  saveData() async {
    product.name = pdNameCtrl.text;
    product.quantity = int.parse(pdQuanCtrl.text);
    product.price = double.parse(pdPriceCtrl.text);
    product.total = product.quantity! * product.price!;

    product = Product(
        name: product.name,
        quantity: product.quantity,
        price: product.price,
        total: product.total,
        status: product.status);

    await dbHelper.createProduct(product);

    setState(() {
      pdNameCtrl.text = '';
      pdQuanCtrl.text = '';
      pdPriceCtrl.text = '';
      product.status = false;
    });

    await _refreshList();
  }
}
