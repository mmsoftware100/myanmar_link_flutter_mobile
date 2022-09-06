
import 'package:flutter/material.dart';
import 'package:mmlink/view/payment/payment_state_two_page.dart';

class PrePaymentPage extends StatefulWidget {
  const PrePaymentPage({Key? key}) : super(key: key);

  @override
  _PrePaymentPageState createState() => _PrePaymentPageState();
}

class _PrePaymentPageState extends State<PrePaymentPage> {
  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width/4;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
        title: Center(child: Text("Payment",style: TextStyle(color: Colors.red),)),
      ),
      body: ListView(
        children: [

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Center(
                      child: Text("State 1"),
                    ),
                    SizedBox(height: 20,),
                    Table(
                      children: [
                        TableRow(
                            children: [
                              TableCell(child: Text("Order Code :")),
                              TableCell(child: Text(":")),
                              TableCell(child: Text("#152489657854236")),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("")),
                              TableCell(child: Text("")),
                              TableCell(child: Text("")),
                            ]
                        ),

                        TableRow(
                            children: [
                              TableCell(child: Text("Package Type :")),
                              TableCell(child: Text(":")),
                              TableCell(child: Text("784596523569874")),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("")),
                              TableCell(child: Text("")),
                              TableCell(child: Text("")),
                            ]
                        ),

                        TableRow(
                            children: [
                              TableCell(child: Text("Total Cost")),
                              TableCell(child: Text(":")),
                              TableCell(child: Text("120,00")),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(child: Text("")),
                              TableCell(child: Text("")),
                              TableCell(child: Text("")),
                            ]
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.white,
                  height: myWidth,
                  width: myWidth,
                  child: Card(
                    elevation: 3,
                      child: Image.asset("assets/images/ayapay.png")),
                ),
                Container(
                  color: Colors.white,
                  height: myWidth,
                  width: myWidth,
                  child: Card(
                      elevation: 3,
                      child: Image.asset("assets/images/kpay.png")),
                ),
                Container(
                  color: Colors.white,
                  height: myWidth,
                  width: myWidth,
                  child: Card(
                      elevation: 3,
                      child: Image.asset("assets/images/wavepay.png")),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              //width: MediaQuery.of(context).size.width/3,
              child: Card(
                elevation: 3,
                color: Colors.red,
                child: MaterialButton(
                  child: Text("Next",style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentStateTwoPage()));
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
