import 'package:flutter/material.dart';
import '../model/order_history_model.dart';

class ProductDetail extends StatefulWidget {
  Product product;
  ProductDetail({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade400,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.purple),
        bottom: PreferredSize(
            child: Container(
              color: Colors.purpleAccent,
              height: 2.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
        title: Center(
          child: Text(
            "Product",
            style: const TextStyle(color: Colors.purpleAccent),
          ),
        ),
      ),
      body: OrientationBuilder(
          builder: (context, orientation) => orientation == Orientation.portrait
              ? buildPortrait()
              : buildLandscape()),
    );
  }

  Widget buildPortrait() {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
            height: 200, child: Image.network(widget.product.productOtherUrl)),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Product Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                widget.product.productName,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Product ID",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                widget.product.productId.toString(),
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                widget.product.perProductPrice.toStringAsFixed(2).toString(),
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Count",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                widget.product.productCount.toString(),
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildLandscape() {
    return ListView(
      children: [
        Row(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(70, 10, 50, 10),
                  child: Image.network(widget.product.productOtherUrl),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        widget.product.productName,
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product ID",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        widget.product.productId.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        widget.product.perProductPrice
                            .toStringAsFixed(2)
                            .toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Count",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        widget.product.productCount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 14),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
