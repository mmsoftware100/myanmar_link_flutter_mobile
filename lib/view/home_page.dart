
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mmlink/view/login_page.dart';
import 'package:mmlink/view/order/available_order_page.dart';
import 'package:mmlink/view/order/order_list_page.dart';
import 'package:mmlink/view/payment/pre_payment_page.dart';
import 'package:mmlink/view/pre_login_pag.dart';
import 'package:mmlink/view/ticket/ticket_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  final CategoriesScroller categoriesScroller = CategoriesScroller();

  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(InkWell(
        child: Container(
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post["name"],
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        post["brand"],
                        style: const TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "\$ ${post["price"]}",
                        style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/images/${post["image"]}",
                    height: double.infinity,
                  )
                ],
              ),
            )),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderListPage()));
        },
      ));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostsData();
    controller.addListener(() {

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height*0.20;
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        //backgroundColor: Colors.white,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        //   leading: Icon(
        //     Icons.menu,
        //     color: Colors.black,
        //   ),
        //   actions: <Widget>[
        //     IconButton(
        //       icon: Icon(Icons.search, color: Colors.black),
        //       onPressed: () {},
        //     ),
        //     IconButton(
        //       icon: Icon(Icons.person, color: Colors.black),
        //       onPressed: () {},
        //     )
        //   ],
        // ),
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 150.0,
                    width: double.infinity,
                    color: Color(
                        // getColorHexFromStr('#FDD148')
                      getColorHexFromStr('#6500FF')
                    ),
                  ),
                  Positioned(
                    bottom: 50.0,
                    right: 100.0,
                    child: Container(
                      height: 200.0,
                      width: 400.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200.0),
                          color: Color(
                            //0x6500FF
                              // getColorHexFromStr('#FEE16D')
                              getColorHexFromStr('#FF0000')
                      )
                              .withOpacity(0.4)),
                    ),
                  ),
                  Positioned(
                    bottom: 100.0,
                    left: 150.0,
                    child: Container(
                        height: 300.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(150.0),
                            color: Color(
                                // getColorHexFromStr('#FEE16D')
                                // 0xF00000
                              getColorHexFromStr('#FF0000')
                            )
                                .withOpacity(0.5))),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 15.0),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 15.0),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 2.0),
                                image: DecorationImage(
                                    image: AssetImage('assets/images/girl.jpg'))),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 120.0),
                          Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () {
                                  scaffoldKey.currentState?.openDrawer();
                              },
                              color: Colors.white,
                              iconSize: 30.0,
                            ),
                          ),
                          SizedBox(height: 15.0),
                        ],
                      ),
                       SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Mrs.Thinzar Nwe Win',
                          style: TextStyle(
                            color: Colors.white,
                              fontFamily: 'Quicksand',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      //SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          '09608012415',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Quicksand',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      //SizedBox(height: 25.0),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      //   child: Material(
                      //     elevation: 5.0,
                      //     borderRadius: BorderRadius.circular(5.0),
                      //     child: TextFormField(
                      //         decoration: InputDecoration(
                      //             border: InputBorder.none,
                      //             prefixIcon: Icon(Icons.search,
                      //                 color:
                      //                 Color(getColorHexFromStr('#FEDF62')),
                      //                 size: 30.0),
                      //             contentPadding:
                      //             EdgeInsets.only(left: 15.0, top: 15.0),
                      //             hintText: 'Search',
                      //             hintStyle: TextStyle(
                      //                 color: Colors.grey,
                      //                 fontFamily: 'Quicksand'))),
                      //   ),
                      // ),
                      SizedBox(height: 10.0)
                    ],
                  )
                ],
              ),
              Stack(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Material(
                      elevation: 1.0,
                      child: Container(height: 75.0, color: Colors.white)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        child: Container(
                          height: 75.0,
                          width: MediaQuery.of(context).size.width / 4,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/order_sketch.png'))),
                              ),
                              Text(
                                'Order',
                                style: TextStyle(fontFamily: 'Quicksand'),
                              )
                            ],
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AvailableOrderPage()));
                        },
                      ),
                      InkWell(
                        child: Container(
                          height: 75.0,
                          width: MediaQuery.of(context).size.width / 4,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                        AssetImage('assets/images/payment_sketch.png'))),
                              ),
                              Text(
                                'Payment',
                                style: TextStyle(fontFamily: 'Quicksand'),
                              )
                            ],
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PrePaymentPage()));
                        },
                      ),
                      InkWell(
                        child: Container(
                          height: 75.0,
                          width: MediaQuery.of(context).size.width / 4,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/ticket_sketch.jpg'))),
                              ),
                              Text(
                                'Ticket',
                                style: TextStyle(fontFamily: 'Quicksand'),
                              )
                            ],
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TicketListpage()));
                        },
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer?0:1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer?0:categoryHeight,
                    //child: categoriesScroller
                  child:CarouselSlider(
                    // items: [
                    //   Container(
                    //     margin: EdgeInsets.all(8.0),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       image: DecorationImage(
                    //         image: NetworkImage("https://cdn.pixabay.com/photo/2017/01/08/13/58/cube-1963036__340.jpg"),
                    //         fit: BoxFit.cover,
                    //       ),
                    //     ),
                    //   ),
                    //   Container(
                    //     margin: EdgeInsets.all(8.0),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       image: DecorationImage(
                    //         image: NetworkImage("https://cdn.pixabay.com/photo/2015/03/25/23/46/cube-689619__340.jpg"),
                    //         fit: BoxFit.cover,
                    //       ),
                    //     ),
                    //   ),
                    //   Container(
                    //     margin: EdgeInsets.all(8.0),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       image: DecorationImage(
                    //         image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJqqqTEDG47DmRff3nNLGXTq5CpMgiPWaVfw56m-Ulnb86AT005TvuIaQB58jJURMKlHk&usqp=CAU"),
                    //         fit: BoxFit.cover,
                    //       ),
                    //     ),
                    //   ),
                    // ],
                    items: carouselList.map<Widget>((i){
                      return new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: new EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: new BoxDecoration(
                            color: Colors.amber
                        ),
                        // child: new Text('text $i', style: new TextStyle(fontSize: 16.0),)
                        child: Image.asset("assets/images/"+i,fit: BoxFit.fill,),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 80.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ),
              ),


              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform:  Matrix4.identity()..scale(scale,scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.7,
                                alignment: Alignment.topCenter,
                                child: itemsData[index]),
                          ),
                        );
                      })),
            ],
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                child: new Container(
                  width: MediaQuery.of(context).size.width,
                  margin: new EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: new BoxDecoration(
                      color: Colors.amber
                  ),
                  // child: new Text('text $i', style: new TextStyle(fontSize: 16.0),)
                  child: Image.asset("assets/images/mmlink_logo.png",fit: BoxFit.cover,),
                ),
              ),
              Expanded(
                  child: Container()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: Text("Logout"),
                    trailing: Icon(Icons.logout),
                    onTap: (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          PreLoginPage()), (Route<dynamic> route) => false);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List FOOD_DATA = [
    {
      "name":"Package One",
      "brand":"Hawkers",
      "price":2.99,
      "image":"mmlink_logo.png"
    },{
      "name":"Package Two",
      "brand":"Hawkers",
      "price":4.99,
      "image":"mmlink_logo.png"
    },
    {
      "name":"Package Three",
      "brand":"Mcdonald",
      "price":1.49,
      "image":"mmlink_logo.png"
    },
    {
      "name":"Package Four",
      "brand":"Mcdonald",
      "price":2.99,
      "image":"mmlink_logo.png"
    },
    {
      "name":"Package Five",
      "brand":"Ben & Jerry's",
      "price":9.49,
      "image":"mmlink_logo.png"
    },
    {
      "name":"Package Six",
      "brand":"Hawkers",
      "price":4.49,
      "image":"mmlink_logo.png"
    },
    {
      "name":"Package Seven",
      "brand":"Dominos",
      "price":17.99,
      "image":"mmlink_logo.png"
    },
    {
      "name":"Package Eight",
      "brand":"Hawkers",
      "price":2.99,
      "image":"mmlink_logo.png"
    },
    {
      "name":"Package Nine",
      "brand":"Subway",
      "price":6.99,
      "image":"mmlink_logo.png"
    }
  ];
  
  List carouselList = ['slide1.jfif','slide2.jpg','slide3.jpg'];

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


}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.orange.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Most\nFavorites",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.blue.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Newest",
                          style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "20 Items",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 20),
                height: categoryHeight,
                decoration: BoxDecoration(color: Colors.lightBlueAccent.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Super\nSaving",
                        style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "20 Items",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}