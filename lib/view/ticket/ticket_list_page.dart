import 'package:flutter/material.dart';
import 'package:mmlink/view/ticket/ticket_condition_page.dart';
import 'package:mmlink/view/ticket/ticket_page.dart';

class TicketListpage extends StatefulWidget {
  const TicketListpage({Key? key}) : super(key: key);

  @override
  _TicketListpageState createState() => _TicketListpageState();
}

class _TicketListpageState extends State<TicketListpage> {

  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Center(child: Text("Ticket List",style: TextStyle(color: Colors.red),)),
      ),
      body: ListView(
        children: [
          itemCard('#158965236', 'Premium'),
          itemCard('#8549652365', 'Gold'),
          itemCard('#8596485125', 'Silver'),
          itemCard('#8596526688', 'Platinium'),
          itemCard('#158965236', 'Premium'),
          itemCard('#8549652365', 'Gold'),
          itemCard('#8596485125', 'Silver'),
          itemCard('#8596526688', 'Platinium'),
          itemCard('#158965236', 'Premium'),
          itemCard('#8549652365', 'Gold'),
          itemCard('#8596485125', 'Silver'),
          itemCard('#8596526688', 'Platinium'),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>TicketPage()));
        },
      ),
    );
  }

  Widget itemCard(String ticketCode, String packaetType) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Container(
        height: 150.0,
        width: double.infinity,
        color: Colors.white,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                              child: Text(
                                "Ticket Code",
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
                          ),
                          TableCell(
                            child: Text(
                              ticketCode,
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]
                      ),
                      TableRow(
                          children: [
                            TableCell(
                              child: Text(
                                "Package Type",
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            TableCell(
                              child: Text(
                                packaetType,
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Container(
                        height: 40.0,
                        width: 100.0,
                        child: Card(
                          color: Color(
                              getColorHexFromStr('#FF0000')
                          ),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey, width: 0.5),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              'Detail',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TicketConditionPage()));
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
