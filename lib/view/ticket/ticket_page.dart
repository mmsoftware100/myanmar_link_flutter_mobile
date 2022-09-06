import 'package:flutter/material.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {

  int _currentTimeValue = 1;

  final _buttonOptions = [
    TimeValue(30,  "Green Light"),
    TimeValue(60,  "Red Light"),
    TimeValue(120, "Bandwidth"),
    // TimeValue(240, "4 hours"),
    // TimeValue(480, "8 hours"),
    // TimeValue(720, "12 hours"),
  ];

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
        title: Center(child: Text("Ticket",style: TextStyle(color: Colors.red),)),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          TableCell(child: Text("Ticket Code :")),
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
                          TableCell(child: Text("ID :")),
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
                          TableCell(child: Text("Package Type")),
                          TableCell(child: Text(":")),
                          TableCell(child: Text("Premium")),
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
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  //padding: EdgeInsets.all(8.0),
                  children: _buttonOptions.map((timeValue) => RadioListTile<int>(
                    groupValue: _currentTimeValue,
                    title: Text(timeValue._value),
                    value: timeValue._key,
                    onChanged: (val) {
                      setState(() {
                        debugPrint('VAL = $val');
                        _currentTimeValue = val!;
                      });
                    },
                  )).toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width/3,
              child: Card(
                color: Colors.red,
                child: MaterialButton(
                  child: Text("Send Ticket",style: TextStyle(color: Colors.white),),
                    onPressed: (){

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

class TimeValue {
  final int _key;
  final String _value;
  TimeValue(this._key, this._value);
}
