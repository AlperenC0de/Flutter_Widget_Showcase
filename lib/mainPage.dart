
import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  var tfController=TextEditingController();
  String inputString="";
  String imageName="happy.png";
  bool switchControl=false;
  bool checkboxControl=false;
  int radioValue=0;
  bool progressControl=false;
  double process=30.0;
  var tfTime=TextEditingController();
  var tfDate=TextEditingController();
  var countryList=<String>[];
  var choosenCountry="Turkey";
  var clickControl="";

  @override
  void initState() {
    countryList.add("Turkey");
    countryList.add("America");
    countryList.add("France");
    countryList.add("Russia");
    countryList.add("Germany");
    countryList.add("Portugal");
    countryList.add("Spain");
    countryList.add("Italia");// TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widget Usage"),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
                Text(inputString),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                  controller: tfController,
                  decoration: InputDecoration(hintText: "data"),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  )
                  ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    inputString=tfController.text;
                  });
                }, child:Text("receive data")),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){
                      setState(() {
                        imageName="happy.png";
                      });
                    }, child: Text("Image 1")),
                    Image.asset("images/$imageName"),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        imageName="unhappy.png";
                      });
                    }, child: Text("Image 2")),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: SwitchListTile(
                        title:const Text("Dart") ,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: switchControl,
                        onChanged: (data){
                          setState(() {
                            switchControl=data;
                          });
                      }
                    ),
                  ),
                  Expanded(
                    child: CheckboxListTile(
                        title:const Text("Flutter") ,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: checkboxControl,
                        onChanged: (data){
                          setState(() {
                            checkboxControl=data!;
        
                          });
                      }
                    ),
                  ),
                ],),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: RadioListTile(
                        title:const Text("Barcelone") ,
                        value: 1,
                        groupValue: radioValue,
                        onChanged: (data){
                          setState(() {
                            radioValue=data!;
                          });
                      }
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                        title:const Text("Real Madrid") ,
                        value: 2,
                        groupValue: radioValue,
                        onChanged: (data){
                          setState(() {
                            radioValue=data!;
                          });
                      }
                    ),
                  ),
                ],),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progressControl=true;
                    });
                  }, child: Text("Start")),
                  Visibility(visible:progressControl, child: const CircularProgressIndicator(),),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      progressControl=false;
                    });
                  }, child: Text("Finish")),
                ],),
                Text(process.toInt().toString()),
                Slider(max:100.0, min: 0.0, value: process, onChanged:(data){
                  setState(() {
                    process=data;
                  });
                } ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120,
                    child: TextField(controller: tfTime, decoration:const InputDecoration(hintText: "Time"),),
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()))
                      .then((value){
                        tfTime.text=" ${value!.hour}:${value.minute}";
                      });
                    });
                  }, icon: Icon(Icons.access_time)),
                  SizedBox(
                    width: 120,
                    child: TextField(controller: tfDate, decoration:const InputDecoration(hintText: "Date"),),
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      showDatePicker(context: context, firstDate: DateTime(1950), lastDate: DateTime(2030)).then((value){
                        tfDate.text=" ${value!.day}/${value.month}/${value.year}";
                      });
                    });
                  }, icon: const Icon(Icons.date_range)),
                ],),
                DropdownButton(
                  value: choosenCountry,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: countryList.map((country){
                    return DropdownMenuItem(value: country, child: Text(country));
                  }).toList(),
                   onChanged: (data){
                    setState(() {
                      choosenCountry=data!;
                    });
                   }
                   ),
                   GestureDetector(
                    onTap: (){
                      setState(() {
                        clickControl="One Tap";
                      });
                    },
                    onDoubleTap: (){
                      setState(() {
                        clickControl="Double Tap";
                      });
                    },
                    onLongPress: (){
                      setState(() {
                        clickControl="Long Press";
                      });
                    },
                    child:Container(
                      width: 200,
                      height: 200,
                      color: Colors.red,
                      child: Center(child:Text("${clickControl}")),
                    )),
                   
        
            ],
          ),
        ),
      ),
    );
  }
}