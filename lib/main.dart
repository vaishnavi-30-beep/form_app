import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    title: "Registration Form",
    home: SIForm(),
    theme: ThemeData(
      primaryColor: Colors.green,
      accentColor: Colors.grey,
    ),
  ));
}
class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _formKey = GlobalKey<FormState>();
  var _cities= ['Pune', 'Nashik', 'Mumbai'];
  var _currentItemSelected = 'Pune';
  final _minimumPadding = 5.0;
  String farmerName, farmeraddress;
  double MobileNum;

  getfarmerName(name) {
    this.farmerName = name;
  }
  getaddress(address) {
    this.farmeraddress = address;
  }
  getmobileNum(mobileNum){
    this.MobileNum = double.parse(mobileNum);
  }
  SubmittedData(){
    print("Submitted");
  }
  deletedData(){
    print("deleted");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //resizeToAvoidBottomInset: false,

      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Registration Form"),
      ),
      body: Form(
        key: _formKey,
        //margin: EdgeInsets.all(_minimumPadding * 2),
        child: Padding(
          
          padding: EdgeInsets.all(_minimumPadding*2),
          child: ListView(
            children: <Widget>[

              getImageAsset(),
              Padding(
                padding: EdgeInsets.all(_minimumPadding),
                child: TextFormField(
                  onChanged: (String name){
                    getfarmerName(name);
                  } ,
                  decoration: InputDecoration(
                      labelText: "Name",
                      hintText: 'Full Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                  ),
                ),),
              Padding(
                padding: EdgeInsets.all(_minimumPadding),
                child: TextField(

                  onChanged: (String address){
                    getaddress(address);
                  },
                  decoration: InputDecoration(
                      labelText: "Address",
                      hintText: 'Enter Address',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(_minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (String mobileNum){
                          getmobileNum(mobileNum);
                        } ,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Enter Mobile number",
                            hintText: 'Mobile number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )
                        ),
                      ),
                    ),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        items: _cities.map((String value){
                          return DropdownMenuItem<String>(
                            value : value,
                            child : Text(value),
                          );
                        }).toList(),
                        onChanged: (String newValueSelected){
                          _onDropDownItemSelected(newValueSelected);
                        },
                        value: _currentItemSelected,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: _minimumPadding, top: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                          color: Colors.green,
                          splashColor: Colors.lightGreenAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text("Submit",
                            style: TextStyle(
                              color: Colors.white,

                            ),),
                          onPressed: () {
                            SubmittedData();
                          }
                      ),

                    ),
                    Expanded(
                      child: RaisedButton(
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          splashColor: Colors.lightGreenAccent,
                          child: Text("Delete",
                            style: TextStyle(
                              color: Colors.white,

                            ),),
                          onPressed: () {
                            deletedData();
                          }
                      ),

                    ),

                  ],
                ),
              )
            ],
          ),
        )
        
      ),
    );
  }
  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  Widget getImageAsset(){

    AssetImage assetImage = AssetImage('images/5th.jpg');
    Image image = Image(image: assetImage, width: 200.0, height: 200.0,);

    return Container(child: image, margin: EdgeInsets.all(_minimumPadding * 10),);
  }
}

