import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void validate(){
    if (_formKey.currentState!.validate() ){

      print("Validate ");
      Navigator.of(context).pushReplacementNamed('/home');

    }else{
      print("not validated");
    }
  }


  var count = 0;
  TextEditingController emailController = TextEditingController();//$$$$$$$$$$$$$$$$$
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var Screen_size = MediaQuery.of(context).size;
    // var count = 0;  ################### not here

    return
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //
      //   primarySwatch: Colors.blue,
      // ),
      // home:

      Scaffold(

        floatingActionButton: FloatingActionButton(onPressed:(){

          setState(() {

            if(_formKey.currentState!.validate()){
              Navigator.of(context).pushReplacementNamed('/home');
              // Navigator.of(context).push( MaterialPageRoute(builder: (context){
              //   return HomePage(username: emailController.text,);
              // })
              //
              // );
            }
          });

        }, ),




        // floatingActionButton: FloatingActionButton(onPressed:() {
        //   setState(() {
        //     count++;
        //   });
        //   print(count);
        // },
        // ) ,
        // backgroundColor: Colors.yellow,
        body:

        Stack(
            children:[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/bird.png"), fit: BoxFit.cover),
                ),

              ),
              Transform.rotate(
                  angle: 0,
                  child:


                  Form(
                    // autovalidateMode: ,
                    key: _formKey,
                    child: Column //Sign in
                      (
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),

                                  labelText: "Email"
                              ),
                              validator:
                              MultiValidator(
                                  [
                                    EmailValidator(errorText: "Not a valid Email"),
                                    RequiredValidator(errorText: "Required "),
                                  ]
                              )

                            //     (String? input)  // input var is nullable
                            // {
                            //
                            //   if(input!= null && input.isEmpty !=  true){
                            //     return null;
                            //   }
                            //   else {
                            //     return "enter a valid text ";
                            //   }
                            // },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child:
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password",
                            ),

                            validator: (String? input_pass) {

                              if( input_pass!= null && input_pass.length > 6){
                                return null;
                              }
                              else {
                                return "choose 6 letters";
                              }
                            },
                          ),

                        ),



                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(onPressed: validate
                              //     (){
                              //   emailController.text = "reem@gmail.com";
                              // }
                              ,
                              child: Text("Log in")),
                        )
                        // SizedBox(width: double.infinity,),
                        //
                        // Center(child: Text("Log in" ,style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.black),),),
                        // SizedBox( width: 0.7*Screen_size.width, child: TextField(style: TextStyle(color: Colors.red ),decoration: InputDecoration(labelText: "Email",hintText: "enter",border: OutlineInputBorder(),),)),
                        // SizedBox( width: 0.7*Screen_size.width, child: TextField(  style: TextStyle(color: Colors.red ),decoration: InputDecoration( labelText: "password" ,hintText: "enter",border: OutlineInputBorder(),),)),
                        // Container(child: Text("$count"),)
                      ],
                    ),
                  )

                // Row(
                //   children: [
                //     Expanded(child: Container(color: Colors.red,)),
                //     Container(color: Colors.white,
                //     child: Center(
                //    child: Image.asset("assets/images/im.png",width: 50,height: 50,) ,)
                //     ),
                //     Container(color: Colors.black,width: 100,),
                //   ],
                // )

              ),
            ]
        ),
      );
  }
}