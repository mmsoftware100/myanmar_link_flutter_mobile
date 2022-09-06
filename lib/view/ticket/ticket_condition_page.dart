import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:status_change/status_change.dart';

class TicketConditionPage extends StatefulWidget {
  const TicketConditionPage({Key? key}) : super(key: key);

  @override
  _TicketConditionPageState createState() => _TicketConditionPageState();
}

class _TicketConditionPageState extends State<TicketConditionPage> {

  List myList = ["Report တင်နေသည်","Service အဖွဲ့စေလွှတ်နေသည်","Service အဖွဲ့ပြုပြင်နေသည်","ပြုပြင်ပြီးဖြစ်သည်","ပြန်လည်အသုံးပြုနိုင်ပါပြီ"];

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
        title: Center(child: Text("Ticket Condition",style: TextStyle(color: Colors.red),)),
      ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

              Expanded(
                child: StatusChange.tileBuilder(
                  theme: StatusChangeThemeData(
                    direction: Axis.vertical,
                    connectorTheme:
                    ConnectorThemeData(space: 1.0, thickness: 1.0),
                  ),
                  builder: StatusChangeTileBuilder.connected(
                    itemWidth: (_) =>
                    // MediaQuery.of(context).size.width / _processes.length,
                    MediaQuery.of(context).size.width/4,

                    // contentWidgetBuilder: (context, index) {
                    //   return Padding(
                    //     padding: const EdgeInsets.all(15.0),
                    //     child: Text(
                    //       'add content here',
                    //       style: TextStyle(
                    //         color: Colors
                    //             .blue, // change color with dynamic color --> can find it with example section
                    //       ),
                    //     ),
                    //   );
                    // },
                    // contentWidgetBuilder: (context,index){
                    //   return Padding(
                    //     padding: const EdgeInsets.all(15.0),
                    //     child: Text(myList[index],style: TextStyle(color: Colors.blue),),
                    //   );
                    // },
                    nameWidgetBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          myList[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      );
                    },
                    indicatorWidgetBuilder: (_, index) {
                      if (index <= 1) {
                        return DotIndicator(
                          size: 35.0,
                          border: Border.all(color: Colors.green, width: 1),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return OutlinedDotIndicator(
                          size: 30,
                          borderWidth: 1.0,
                          color: Colors.red,
                        );
                      }
                    },
                    lineWidgetBuilder: (index) {
                      if (index > 0) {
                        if (index == 3) {
                          final prevColor = Colors.green;
                          final color = Colors.green;
                          var gradientColors;
                          gradientColors = [
                            prevColor,
                            Color.lerp(prevColor, color, 0.5)
                          ];
                          return DecoratedLineConnector(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: gradientColors,
                              ),
                            ),
                          );
                        } else {
                          return SolidLineConnector(
                            color: Colors.green,
                          );
                        }
                      } else {
                        return null;
                      }
                    },
                    itemCount: 5,
                  ),
                ),
              ),
            ],
          ),
        )

    );
  }
}
