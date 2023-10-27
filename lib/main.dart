import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:firebase_core/firebase_core.dart';

//void main() {
Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(apiKey: 'AIzaSyCDJuP53cX0VhTFjiH1P4ytCuNaWiq4KZA', appId: '1:145335883909:android:a9d6bf7fb59d06592931ec', messagingSenderId: '145335883909', projectId: 'flutterfirebase-ddc4a'));
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePg(),
    );
  }
}
class HomePg extends StatefulWidget {
  //const HomePg({Key? key}) : super(key: key);

  @override
  State<HomePg> createState() => _HomePgState();
}

class _HomePgState extends State<HomePg> {
  TextEditingController txtrollnum=new TextEditingController();
  TextEditingController txtname=new TextEditingController();
  TextEditingController txtage=new TextEditingController();
  TextEditingController txtaddress=new TextEditingController();
  TextEditingController txtplace=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    // TextEditingController txtrollnum=new TextEditingController();
    // TextEditingController txtname=new TextEditingController();
    // TextEditingController txtage=new TextEditingController();
    // TextEditingController txtaddress=new TextEditingController();
    // TextEditingController txtplace=new TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body:  SafeArea(
        child: Padding(
          padding:  const EdgeInsets.all(15),
          child: Column(
            children:  [
              TextField(
                controller: txtrollnum,
                decoration: InputDecoration(
                    labelText: "Enter Rollnum",
                    border: OutlineInputBorder()
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(15)
              ),
              TextField(
                controller: txtname,
                decoration: InputDecoration(
                    labelText: "Enter Name",
                    border: OutlineInputBorder()
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(15)
              ),
              TextField(
                controller: txtaddress ,
                decoration: InputDecoration(
                    labelText: "Enter Address",
                    border: OutlineInputBorder()
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(15)
              ),
              TextField(
                controller: txtage,
                decoration: InputDecoration(
                    labelText: "Enter Age",
                    border: OutlineInputBorder()
                ),
              ),
              const Padding(
                  padding: EdgeInsets.all(15)
              ),


              const SizedBox(height: 50,),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: (){
                    //Toast.show("hi"+txtname.text+"your age,place and address are"+txtage.text+","+txtplace.text+","+txtaddress.text, duration: Toast.lengthLong, gravity:  Toast.bottom);
                  createdata(int.parse(txtrollnum.text),txtname.text,txtaddress.text,int.parse(txtage.text));
                  },
                  child:const Text("click"),
                ),

              ),

            ],
          ),

        ),
      ),

    );
  }
  void createdata(int rno,String myname,String address,int age) async{
    var docData=FirebaseFirestore.instance.collection('details').doc();
    final user= {
      'id': docData.id,
      'rollnum': rno,
      'myname': myname,
      'address': address,
      'age': age
    };

   var r= await docData.set(user);


  }
}