
import 'package:flutter/material.dart';
import 'package:mmlink/view/home_page.dart';

class PaymentStateTwoPage extends StatefulWidget {
  const PaymentStateTwoPage({Key? key}) : super(key: key);

  @override
  _PaymentStateTwoPageState createState() => _PaymentStateTwoPageState();
}

class _PaymentStateTwoPageState extends State<PaymentStateTwoPage> {
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
          Center(
            child: Text("State 2"),
          ),
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
                          child: Text("Total Cost : ")),
                      TableCell(
                          child: Text("120,000"))
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
                          child: SizedBox(height: 20,)),
                      TableCell(
                          child: SizedBox(height: 20,)),
                    ]
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  height: myWidth,
                  width: myWidth,
                  child: Image.asset("assets/images/kpay.png"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("KBZ Pay ငွေလွှဲရမည့် Phone No"),
                    Text("09698012415 သို့ငွေလွှဲပါ။"),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("KBZ Pay သို့ငွေလွှဲပြီးပါက ငွေလွဲအမှတ်စဉ်"),
                Text("နောက်ဆုံးဂဏန်း ၆ လုံးကိုမှတ်သားပါ။"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Transaction last 6 digits",style:TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87
                ),),
                SizedBox(height: 5,),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    filled:true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                    ),
                  ),
                ),
                SizedBox(height: 30,)

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Transaction screen shot",style:TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87
                ),),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: myWidth*2,
                      child: TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          filled:true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(
                      child: Text("Upload photo"),
                        onPressed: (){

                    })
                  ],
                ),
                SizedBox(height: 30,)

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
                  child: Text("Done",style: TextStyle(color: Colors.white),),
                  onPressed: (){

                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        HomePage()), (Route<dynamic> route) => false);                  },
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.phone),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ငွေသွင်းရာတွင်အခက်အခဲတစ်စုံတစ်ရာ"),
                    Text("ရှိပါက ၁၉၉ သို့ဆက်သွယ်ပါ။")

                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
