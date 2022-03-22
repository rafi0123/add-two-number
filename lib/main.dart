import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: "simple calculator",
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  int num1 = 0, num2 = 0, result = 0;

  @override
  Widget build(BuildContext context) {
    add() {
      setState(() {
        num1 = int.parse(controller1.text);
        num2 = int.parse(controller2.text);
        result = num1 + num2;
      });
    }

    sub() {
      setState(() {
        num1 = int.parse(controller1.text);
        num2 = int.parse(controller2.text);
        result = num1 - num2;
      });
    }

    mul() {
      setState(() {
        num1 = int.parse(controller1.text);
        num2 = int.parse(controller2.text);
        result = num1 * num2;
      });
    }

    div() {
      setState(() {
        num1 = int.parse(controller1.text);
        num2 = int.parse(controller2.text);
        result = num1 ~/ num2;
      });
    }

    return Scaffold(
        //resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text("Simple Calculator App")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(children: [
            Column(
              children: [
                Text(
                  "Result: $result",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: controller1,
                  decoration: InputDecoration(
                      labelText: "Enter first number",
                      hintText: "should be in number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: controller2,
                  decoration: InputDecoration(
                      labelText: "Enter second number",
                      hintText: "should be in number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // RaisedButton(child:Text("Add"),onPressed: (){},)
                    ElevatedButton(
                        onPressed: () {
                          add();
                          controller1.clear();
                          controller2.clear();
                        },
                        child: Text("Add")),
                    ElevatedButton(
                        onPressed: () {
                          sub();
                          controller1.clear();
                          controller2.clear();
                        },
                        child: Text("Sub")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          mul();
                          controller1.clear();
                          controller2.clear();
                        },
                        child: Text("Mult")),
                    ElevatedButton(
                        onPressed: () {
                          div();
                          controller1.clear();
                          controller2.clear();
                        },
                        child: Text("Div")),
                  ],
                )
              ],
            ),
          ]),
        ));
  }
}
