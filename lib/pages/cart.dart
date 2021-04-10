import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cartModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/catalog.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Cart'),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Provider.of<CartModel>(context, listen: true)
                          .selectedProducts
                          .isEmpty
                      ? Center(
                          child: Text(
                          "Item Not Available",
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                          textScaleFactor: 2.0,
                        ))
                      : Consumer<CartModel>(
                          builder: (context, item, child) => _CartList(
                                item: item.selectedProducts,
                              )),
                ),
              ),
            ),
            _Cartbutton(),
            SizedBox(height: 40)
          ],
        ));
  }
}

class _Cartbutton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dynamic total = Provider.of<CartModel>(context, listen: true).price;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("\$$total",
              style: TextStyle(
                  fontSize: 25, color: Theme.of(context).accentColor)),
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("You have purchased Items Successfully"),
                  // backgroundColor: Theme.of(context).cardColor,
                ));
              },
              child: Text(
                'Buy',
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(120, 40)),
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
              ))
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final List<Products>? item;

  const _CartList({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: item!.length,
            itemBuilder: (context, index) => ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                      color: Color(int.parse(
                          item![index].color.replaceFirst("#", "0xff"))),
                      shape: BoxShape.circle),
                  height: 30,
                  width: 30,
                ),
                subtitle: Text('${item![index].desc}'),
                trailing: IconButton(
                    onPressed: () {
                      Provider.of<CartModel>(context, listen: false)
                          .delete(item![index]);
                    },
                    icon: Icon(CupertinoIcons.delete)),
                title: Text(
                  '${item![index].name}',
                ))));
  }
}
