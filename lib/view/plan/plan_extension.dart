
import 'package:flutter/material.dart';
import 'package:mmlink/view/payment/pre_payment_page.dart';

class PlanExtensionPage extends StatefulWidget {
  const PlanExtensionPage({Key? key}) : super(key: key);

  @override
  _PlanExtensionPageState createState() => _PlanExtensionPageState();
}

class _PlanExtensionPageState extends State<PlanExtensionPage> {
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
        title: Center(child: Text("Plan Extension",style: TextStyle(color: Colors.red),)),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Table(
              children: [
                TableRow(
                    children: [
                      TableCell(
                          child: Text("Order Code : ")),
                      TableCell(
                          child: Text("4152896325"))
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                          child: SizedBox(height: 20,)),
                      TableCell(
                          child: SizedBox(height: 20,)),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                          child: Text("Customer Name : ")),
                      TableCell(
                          child: Text("Mr.Aung Aung"))
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                          child: SizedBox(height: 20,)),
                      TableCell(
                          child: SizedBox(height: 20,)),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                          child: Text("Package Type : ")),
                      TableCell(
                          child: Text("Premium"))
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                          child: SizedBox(height: 20,)),
                      TableCell(
                          child: SizedBox(height: 20,)),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                          child: Text("Plan Name : ")),
                      TableCell(
                          child: Text(""))
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                          child: SizedBox(height: 20,)),
                      TableCell(
                          child: SizedBox(height: 20,)),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                          child: Text("Start Date : ")),
                      TableCell(
                          child: Text(""))
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                          child: SizedBox(height: 20,)),
                      TableCell(
                          child: SizedBox(height: 20,)),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                          child: Text("Expire Date : ")),
                      TableCell(
                          child: Text(""))
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                          child: SizedBox(height: 20,)),
                      TableCell(
                          child: SizedBox(height: 20,)),
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                          child: Text("Total Cost : ")),
                      TableCell(
                          child: Text(""))
                    ]
                ),
                TableRow(
                    children: [
                      TableCell(
                          child: SizedBox(height: 20,)),
                      TableCell(
                          child: SizedBox(height: 20,)),
                    ]
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              //width: MediaQuery.of(context).size.width/3,
              child: Card(
                elevation: 10,
                color: Colors.indigo,
                child: MaterialButton(
                  child: Text("Payment",style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PrePaymentPage()));

                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
