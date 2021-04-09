import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/cart.dart';
import 'package:flutter_application_1/pages/detailPage.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/models/catalog.dart';

class HomePage extends StatefulWidget {
  // final num1 = 30;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var item;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  void loadData() async {
    var jsonData = await rootBundle.loadString('assets/files/catalog.json');

    var decodedData = jsonDecode(jsonData);
    var data = CatalogModel.fromJson(decodedData);
    item = data.products;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TestList(item: item);
  }
}

class TestList extends StatelessWidget {
  final item;

  const TestList({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          // Navigator.pushNamed(context, MyRoutes.cartList);
          Navigator.push(
              context, MaterialPageRoute(builder: (conetxt) => MyCart()));
        },
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Catalog App',
                style: GoogleFonts.balooDa(
                  fontSize: 30,
                  //  color:
                  //  Theme.of(context).accentColor
                ),
              ),
              Text(
                'Treanding Products',
                textScaleFactor: 1.2,
                // style: TextStyle(color: Color(0xFF403b58)),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      child: (item != null)
                          ? ListView.builder(
                              itemCount: item.length,
                              itemBuilder: (context, index) {
                                return Card(
                                    child: Container(
                                  height: 150,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  DetailPage(
                                                                      item: item[
                                                                          index])));
                                                    },
                                                    child: Hero(
                                                      tag: Key(item[index]
                                                          .id
                                                          .toString()),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        child: Container(
                                                          color:
                                                              Theme.of(context)
                                                                  .canvasColor,
                                                          width: 150,
                                                          child: Image.network(
                                                            item[index].image,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 20),
                                            Text(
                                              item[index].name,
                                              style: GoogleFonts.balooDa(
                                                fontSize: 18,
                                                // color: Theme.of(context)
                                                // .primaryColor
                                              ),
                                            ),
                                            Expanded(
                                                child: Text(
                                                    '${item[index].desc}')),
                                            ButtonBar(
                                              alignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  '\$${item[index].price}',
                                                  textScaleFactor: 1.3,
                                                  style: GoogleFonts.redressed(
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: Color(int.parse(
                                                          item[index]
                                                              .color
                                                              .replaceFirst("#",
                                                                  "0xff"))),
                                                      shape: BoxShape.circle),
                                                  height: 30,
                                                  width: 30,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                              })
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
