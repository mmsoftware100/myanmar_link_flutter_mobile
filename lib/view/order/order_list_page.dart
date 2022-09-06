
import 'package:flutter/material.dart';
import 'package:mmlink/view/order/order_detail_page.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              // color: MyColors.primaryColorLight.withAlpha(20),
            ),
            child: Icon(Icons.arrow_back_ios,
              color: Colors.red,
              size: 16,),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Center(child: Text("Order List",style: TextStyle(color: Colors.red),)),
      ),
      body: ListView(
        children: [
          _orderItem(),
          _orderItem(),
          _orderItem(),
          _orderItem(),
          _orderItem(),
        ],
      ),
    );
  }

  Widget _orderItem(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
            height: MediaQuery.of(context).size.height/3.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child:
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Order Code"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Customer Name"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Package Type"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Plan Name"),
                        ],
                      ),
                    ),
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                        color: Colors.red,
                        child: Text("Detail",style: TextStyle(color: Colors.white),),
                          onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDetailPage()));
                      })
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
