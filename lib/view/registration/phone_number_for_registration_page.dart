import 'package:mmlink/utils/global.dart';
import 'package:mmlink/view/registration/get_otp_code_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class PhoneNumberForRegistrationPage extends StatefulWidget {
  const PhoneNumberForRegistrationPage({Key? key}) : super(key: key);

  @override
  _PhoneNumberForRegistrationPageState createState() => _PhoneNumberForRegistrationPageState();
}

class _PhoneNumberForRegistrationPageState extends State<PhoneNumberForRegistrationPage> {

  TextEditingController mobileNumber = TextEditingController();

  void submit(context) async {
    if (mobileNumber.text == "") return;

    var appSignatureID = await SmsAutoFill().getAppSignature;
    Map sendOtpData = {
      "mobile_number": mobileNumber.text,
      "app_signature_id": appSignatureID
    };
    print(sendOtpData);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>GetOTPCodePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton( onPressed: (){
          Navigator.pop(context);
        },icon:Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Verify your phone number",style: TextStyle(color: Colors.red),),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 40
                ),
                child: Column(
                  children: [
                    makeInput(label: "Phone"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black)
                      )
                  ),
                  child: MaterialButton(
                      minWidth: double.infinity,
                      color: Colors.red,
                      height: 60,
                      child: Text("Next",style: TextStyle(color: Colors.white),),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                      onPressed: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>GetOTPCodePage()));
                        //Navigator.push(context,MaterialPageRoute(builder: (context)=>SendOTPScreen()));
                        submit(context);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeInput({label,obsureText = false}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,style:TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.red
        ),),
        SizedBox(height: 5,),
        TextField(
          controller: mobileNumber,
          obscureText: obsureText,
          keyboardType: TextInputType.phone,
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
    );
  }

}
