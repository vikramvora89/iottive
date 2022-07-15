import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';

import 'package:iottive/model/order_history_model.dart';
import 'package:iottive/pages/product_detail.dart';
import 'package:iottive/services/services.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    ScrollController _controller = ScrollController();
    ScrollController _controller1 = ScrollController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            child: Container(
              color: Colors.purpleAccent,
              height: 2.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
        title: Center(
          child: const Text(
            "Home",
            style: const TextStyle(color: Colors.purpleAccent),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 5.0, 10.0),
        child: FutureBuilder<OrderHistoryModel>(
            future: Service().orderhistory(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var order = snapshot.data.data;
                if (order != null && order.isNotEmpty) {
                  return DraggableScrollbar.rrect(
                    alwaysVisibleScrollThumb: true,
                    backgroundColor: Colors.purpleAccent,
                    controller: _controller,
                    child: ListView.builder(
                        controller: _controller,
                        itemCount: order.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 22.0, 8.0),
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Colors.cyan.shade50,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Order ID: " +
                                              order[index].orderID.toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Date: " +
                                              order[index].date.toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Amount: " +
                                              order[index]
                                                  .paidAmount
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Status: " +
                                              order[index]
                                                  .paymentStatus
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "No. of Product: " +
                                              order[index]
                                                  .product
                                                  .length
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.black),
                                  SizedBox(
                                    height: 100,
                                    child: ListView.builder(
                                        controller: _controller1,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: order[index].product.length,
                                        itemBuilder: (context, i) {
                                          var productlist =
                                              order[index].product;
                                          return Container(
                                            padding: const EdgeInsets.all(5.0),
                                            decoration: BoxDecoration(
                                              color: Colors.cyan.shade50,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProductDetail(
                                                                  product:
                                                                      productlist[
                                                                          i])));
                                                },
                                                child: Image.network(
                                                    productlist[i]
                                                        .productOtherUrl),
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  return Center(
                      child: Text("No results found for the searched text"));
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
