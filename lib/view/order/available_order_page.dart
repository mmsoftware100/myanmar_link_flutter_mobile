
import 'package:flutter/material.dart';
import 'package:mmlink/utils/global.dart';
import 'package:mmlink/view/plan/plan_extension.dart';

class AvailableOrderPage extends StatefulWidget {
  const AvailableOrderPage({Key? key}) : super(key: key);

  @override
  _AvailableOrderPageState createState() => _AvailableOrderPageState();
}

class _AvailableOrderPageState extends State<AvailableOrderPage> {

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
        title: Center(child: Text("Avialable Order",style: TextStyle(color: Colors.red),)),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              itemCard('Plan One', 'assets/images/mmlink_logo.png', false),
              itemCard('Plan Two', 'assets/images/mmlink_logo.png', true),
              itemCard('Plan Three', 'assets/images/mmlink_logo.png', true),
              itemCard('Plan One', 'assets/images/mmlink_logo.png', false),
              itemCard('Plan Two', 'assets/images/mmlink_logo.png', true),
              itemCard('Plan Three', 'assets/images/mmlink_logo.png', true),
              itemCard('Plan One', 'assets/images/mmlink_logo.png', false),
              itemCard('Plan Two', 'assets/images/mmlink_logo.png', true),
              itemCard('Plan Three', 'assets/images/mmlink_logo.png', true)
            ],
          )
        ],
      ),
    );
  }

  Widget itemCard(String title, String imgPath, bool isFavorite) {
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
          child: Row(
            children: <Widget>[
              Container(
                width: 140.0,
                height: 150.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.cover)),
              ),
              SizedBox(width: 4.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 45.0),
                      // Material(
                      //   elevation: isFavorite ? 0.0 : 2.0,
                      //   borderRadius: BorderRadius.circular(20.0),
                      //   child: Container(
                      //     height: 40.0,
                      //     width: 40.0,
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(20.0),
                      //         color: isFavorite
                      //             ? Colors.grey.withOpacity(0.2)
                      //             : Colors.white),
                      //     child: Center(
                      //       child: isFavorite
                      //           ? Icon(Icons.favorite_border)
                      //           : Icon(Icons.favorite, color: Colors.red),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    width: 175.0,
                    child: Text(
                      'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.grey,
                          fontSize: 12.0),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(width: 35.0),
                      // Container(
                      //   height: 40.0,
                      //   width: 50.0,
                      //   color: Color(getColorHexFromStr('#F9C335')),
                      //   child: Center(
                      //     child: Text(
                      //       '\$248',
                      //       style: TextStyle(
                      //           color: Colors.white,
                      //           fontFamily: 'Quicksand',
                      //           fontWeight: FontWeight.bold),
                      //     ),
                      //   ),
                      // ),
                      InkWell(
                        child: Container(
                          height: 40.0,
                          width: 100.0,
                          color: Color(
                              // getColorHexFromStr('#FEDD59')
                              getColorHexFromStr('#FF0000')

                          ),
                          child: Center(
                            child: Text(
                              'Add Plan',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Quicksand',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PlanExtensionPage()));
                        },
                      )
                    ],
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
