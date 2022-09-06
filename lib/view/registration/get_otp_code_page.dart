import 'package:mmlink/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mmlink/view/home_page.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
// import 'package:thegorgeousotp/stores/login_store.dart';
// import 'package:thegorgeousotp/theme.dart';
// import 'package:thegorgeousotp/widgets/loader_hud.dart';

class GetOTPCodePage extends StatefulWidget {
  const GetOTPCodePage({Key? key}) : super(key: key);

  @override
  _GetOTPCodePageState createState() => _GetOTPCodePageState();
}

class _GetOTPCodePageState extends State<GetOTPCodePage> with CodeAutoFill {
  String text = '';

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
        child: Center(child: Text(text[position], style: TextStyle(color: Colors.black),)),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
      );
    }
  }

  String codeValue = "";

  @override
  void codeUpdated() {
    // TODO: implement codeUpdated
    print("Update code $code");
    setState(() {
      print("codeUpdated");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listenOtp();
  }

  void listenOtp() async {
    await SmsAutoFill().unregisterListener();
    listenForCode();
    await SmsAutoFill().listenForCode;
    print("OTP listen Called");
  }

  @override
  void dispose() {
    // TODO: implement dispose

    SmsAutoFill().unregisterListener();
    print("unregisterListener");

    super.dispose();
  }
    @override
    Widget build(BuildContext context) {
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
        ),
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Enter 4 digits verification code sent to your number', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w500))
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: PinFieldAutoFill(
                    currentCode: codeValue,
                    codeLength: 4,
                    onCodeChanged: (code) {
                      print("onCodeChanged $code");
                      setState(() {
                        codeValue = code.toString();
                      });
                    },
                    onCodeSubmitted: (val) {
                      print("onCodeSubmitted $val");
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                constraints:  BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width/2
                ),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        HomePage()), (Route<dynamic> route) => false);
                  },
                  color: Colors.red,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14))
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Confirm', style: TextStyle(color: Colors.white),),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: Colors.blue,
                          ),
                          child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16,),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                constraints:  BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width/2
                ),
                child: RaisedButton(
                  onPressed: () {
                    listenOtp;
                  },
                  color: Colors.blue,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14))
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Resend', style: TextStyle(color: Colors.white),),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            color: Colors.red,
                          ),
                          child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16,),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              // Expanded(
              //   child: Column(
              //     mainAxisSize: MainAxisSize.max,
              //     children: <Widget>[
              //       Expanded(
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: <Widget>[
              //             // Container(
              //             //   constraints: const BoxConstraints(
              //             //       maxWidth: 500
              //             //   ),
              //             //   child: Row(
              //             //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             //     crossAxisAlignment: CrossAxisAlignment.center,
              //             //     children: <Widget>[
              //             //       otpNumberWidget(0),
              //             //       otpNumberWidget(1),
              //             //       otpNumberWidget(2),
              //             //       otpNumberWidget(3),
              //             //       // otpNumberWidget(4),
              //             //       // otpNumberWidget(5),
              //             //     ],
              //             //   ),
              //             //
              //             //
              //             // ),
              //
              //           ],
              //         ),
              //       ),
              //
              //       // NumericKeyboard(
              //       //   onKeyboardTap: _onKeyboardTap,
              //       //   textColor: Colors.red,
              //       //   rightIcon: Icon(
              //       //     Icons.backspace,
              //       //     color: Colors.red,
              //       //   ),
              //       //   rightButtonFn: () {
              //       //     setState(() {
              //       //       text = text.substring(0, text.length - 1);
              //       //     });
              //       //   },
              //       // )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      );
    }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     resizeToAvoidBottomInset: false,
  //     backgroundColor: Colors.white,
  //     appBar: AppBar(
  //       leading: IconButton(
  //         icon: Container(
  //           padding: const EdgeInsets.all(10),
  //           decoration: BoxDecoration(
  //             borderRadius: const BorderRadius.all(Radius.circular(20)),
  //             // color: MyColors.primaryColorLight.withAlpha(20),
  //           ),
  //           child: Icon(Icons.arrow_back_ios,
  //             // color: MyColors.primaryColor,
  //             size: 16,),
  //         ),
  //         onPressed: () => Navigator.of(context).pop(),
  //       ),
  //       elevation: 0,
  //       brightness: Brightness.light,
  //     ),
  //     body: SafeArea(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: <Widget>[
  //           Expanded(
  //             child: Column(
  //               mainAxisSize: MainAxisSize.max,
  //               children: <Widget>[
  //                 Expanded(
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     children: <Widget>[
  //                       Container(
  //                           margin: const EdgeInsets.symmetric(horizontal: 20),
  //                           child: Text('Enter 4 digits verification code sent to your number', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w500))
  //                       ),
  //                       // Container(
  //                       //   constraints: const BoxConstraints(
  //                       //       maxWidth: 500
  //                       //   ),
  //                       //   child: Row(
  //                       //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       //     crossAxisAlignment: CrossAxisAlignment.center,
  //                       //     children: <Widget>[
  //                       //       otpNumberWidget(0),
  //                       //       otpNumberWidget(1),
  //                       //       otpNumberWidget(2),
  //                       //       otpNumberWidget(3),
  //                       //       // otpNumberWidget(4),
  //                       //       // otpNumberWidget(5),
  //                       //     ],
  //                       //   ),
  //                       //
  //                       //
  //                       // ),
  //                       Center(
  //                         child: PinFieldAutoFill(
  //                           currentCode: codeValue,
  //                           codeLength: 4,
  //                           onCodeChanged: (code) {
  //                             print("onCodeChanged $code");
  //                             setState(() {
  //                               codeValue = code.toString();
  //                             });
  //                           },
  //                           onCodeSubmitted: (val) {
  //                             print("onCodeSubmitted $val");
  //                           },
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 Container(
  //                   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //                   constraints: const BoxConstraints(
  //                       maxWidth: 500
  //                   ),
  //                   child: RaisedButton(
  //                     onPressed: () {
  //                       // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()));
  //                       Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
  //                           HomePage()), (Route<dynamic> route) => false);
  //                     },
  //                     // color: MyColors.primaryColor,
  //                     shape: const RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(14))
  //                     ),
  //                     child: Container(
  //                       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         children: <Widget>[
  //                           Text('Confirm', style: TextStyle(color: Colors.white),),
  //                           Container(
  //                             padding: const EdgeInsets.all(8),
  //                             decoration: BoxDecoration(
  //                               borderRadius: const BorderRadius.all(Radius.circular(20)),
  //                               color: Colors.red,
  //                             ),
  //                             child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16,),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 // ElevatedButton(onPressed: listenOtp, child: const Text("Resend")),
  //                 // NumericKeyboard(
  //                 //   onKeyboardTap: _onKeyboardTap,
  //                 //   textColor: Colors.red,
  //                 //   rightIcon: Icon(
  //                 //     Icons.backspace,
  //                 //     color: Colors.red,
  //                 //   ),
  //                 //   rightButtonFn: () {
  //                 //     setState(() {
  //                 //       text = text.substring(0, text.length - 1);
  //                 //     });
  //                 //   },
  //                 // )
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}


// // ignore: must_be_immutable
// class SendOTPScreen extends StatelessWidget {
//   SendOTPScreen({Key? key}) : super(key: key);
//
//   TextEditingController mobileNumber = TextEditingController();
//
//   void submit(context) async {
//     if (mobileNumber.text == "") return;
//
//     var appSignatureID = await SmsAutoFill().getAppSignature;
//     Map sendOtpData = {
//       "mobile_number": mobileNumber.text,
//       "app_signature_id": appSignatureID
//     };
//     print(sendOtpData);
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const VerifyOTPScreen()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.pink,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: const Color(0xFFC2C0C0),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: TextField(
//                     controller: mobileNumber,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Enter Mobile Number",
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   submit(context);
//                 },
//                 child: const Text("Submit"),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// class VerifyOTPScreen extends StatefulWidget {
//   const VerifyOTPScreen({Key? key}) : super(key: key);
//
//   @override
//   State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
// }
//
// class _VerifyOTPScreenState extends State<VerifyOTPScreen> with CodeAutoFill {
//   String codeValue = "";
//
//
//   @override
//   void codeUpdated() {
//     // TODO: implement codeUpdated
//     print("Update code $code");
//     setState(() {
//       print("codeUpdated");
//     });
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     listenOtp();
//   }
//
//
//
//   void listenOtp() async {
//     await SmsAutoFill().unregisterListener();
//     listenForCode();
//     await SmsAutoFill().listenForCode;
//     print("OTP listen Called");
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//       SmsAutoFill().unregisterListener();
//       print("unregisterListener");
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Center(
//               child: PinFieldAutoFill(
//                 currentCode: codeValue,
//                 codeLength: 4,
//                 onCodeChanged: (code) {
//                   print("onCodeChanged $code");
//                   setState(() {
//                     codeValue = code.toString();
//                   });
//                 },
//                 onCodeSubmitted: (val) {
//                   print("onCodeSubmitted $val");
//                 },
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   print(codeValue);
//                 },
//                 child: const Text("Verify OTP")),
//             ElevatedButton(onPressed: listenOtp, child: const Text("Resend"))
//           ],
//         ),
//       ),
//     );
//   }
// }