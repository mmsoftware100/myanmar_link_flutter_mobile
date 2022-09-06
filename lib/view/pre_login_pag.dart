import 'package:flutter/material.dart';
import 'package:mmlink/utils/global.dart';
import 'package:mmlink/view/login_page.dart';
import 'package:mmlink/view/registration/sign_up_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PreLoginPage extends StatefulWidget {
  const PreLoginPage({Key? key}) : super(key: key);

  @override
  _PreLoginPageState createState() => _PreLoginPageState();
}

class _PreLoginPageState extends State<PreLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            //padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Text(
                      "Hello There!",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    SizedBox(height: 30,),
                    Text("Automatic identity verification which enable you to verify your identity",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/3,
                      decoration: BoxDecoration(
                          image:DecorationImage(image: AssetImage('assets/images/mmlink_logo.png'))
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height:60,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                        },
                        color: Colors.indigoAccent[400],
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Text("Login",style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white70

                        ),),),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height:60,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));

                        },
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: Text("Sign UP",style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white70

                        ),),
                      ),
                    ),

                    SizedBox(height: 20,),
                    Text("Sign in with"),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomWidgets.socialButtonCircle(
                              facebookColor, FontAwesomeIcons.facebookF,
                              iconColor: Colors.white, onTap: () {
                          }),
                          CustomWidgets.socialButtonCircle(
                              googleColor, FontAwesomeIcons.googlePlusG,
                              iconColor: Colors.white, onTap: () {
                          }),
                          // CustomWidgets.socialButtonCircle(
                          //     whatsappColor, FontAwesomeIcons.whatsapp,
                          //     iconColor: Colors.white, onTap: () {
                          // }),
                          CustomWidgets.socialButtonCircle(
                              twitterColor, FontAwesomeIcons.twitter,
                              iconColor: Colors.white, onTap: () {
                          }),
                        ],
                      ),
                    ),



                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomWidgets {
  static Widget socialButtonCircle(color, icon, {iconColor, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 50,
            height: 50,
            // padding: const EdgeInsets.all(20.0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              color: color,
            ),
            child: Center(
              child: Icon(
                icon,
                color: iconColor,
              ),
            )),
      ), //
    );
  }
}
