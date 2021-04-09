import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cartModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final item;

  const DetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.vertical(
                top: Radius.elliptical(MediaQuery.of(context).size.width, 50))),
        height: 70,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '\$${item.price}',
              style: GoogleFonts.redressed(
                  color: Theme.of(context).accentColor, fontSize: 30),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(StadiumBorder()),
                    minimumSize: MaterialStateProperty.all(Size(100, 40)),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).buttonColor)),
                onPressed: () {
                  Provider.of<CartModel>(context, listen: false).add(item);

                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Alert!!!'),
                          content: Text('${item.name} has been Added to cart'),
                        );
                      });
                },
                child: Text(
                  'Add to cart',
                ))
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          'DetailPage',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Hero(
                    tag: Key(item.id.toString()),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.elliptical(
                                    MediaQuery.of(context).size.width, 100)),
                            color: Theme.of(context).canvasColor),
                        height: 400,
                        width: double.infinity,
                        child: Image.network(
                          item.image,
                        )),
                  ),
                ),
              ],
            ),
            Text(
              item.name,
              style: GoogleFonts.balooDa(fontSize: 30),
            ),
            Text(
              '${item.desc}',
              textScaleFactor: 1.5,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'This is the E-Commerce type Application made by Hamza Tarique where you can buy and sell the products as you Like',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
