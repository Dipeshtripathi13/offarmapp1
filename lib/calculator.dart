// ignore_for_file: camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';

class silencecalc extends StatefulWidget {
  const silencecalc({Key? key}) : super(key: key);

  @override
  _silencecalcState createState() => _silencecalcState();
}

class _silencecalcState extends State<silencecalc> {
  final _operation = ['Add', 'Subtracte', 'Multiply', 'Divide'];
  var _values = "Add";
  var _displayText = "";

  TextEditingController textBox1 = TextEditingController();
  TextEditingController textBox2 = TextEditingController();

  // ignore: prefer_typing_uninitialized_variables
  var textStyle; //added due to error in textstyle why?don't know haha
  @override
  Widget build(BuildContext context) {
    //TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          children: <Widget>[
            //first item
            DropdownButton<String>(
              value: _values,
              style: textStyle,
              items: _operation.map((String values) {
                return DropdownMenuItem<String>(
                  value: values,
                  child: Text(values),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _values = value!;
                  // ignore: avoid_print
                  print("value changed to $value");
                });
                value = _values;
              },
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 5.0),
            ),
            //second Item
            SizedBox(
              height: 45,
              child: TextField(
                controller: textBox1,
                keyboardType: TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: "First Number",
                    hintText: "000",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            //Third Item
            SizedBox(
              height: 45,
              child: TextField(
                controller: textBox2,
                keyboardType: TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: "Second Number",
                    hintText: "000",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      
                    )),
                    
              ),
            ),
            //forth item
            Text(
              _displayText,
              style: const TextStyle(fontSize: 20),
            ),
            //fifth item
            Row(
              children: <Widget>[
                Expanded(
                 
                  child: RaisedButton(
                    child: const Text('calculate'),
                    onPressed: () {
                      setState(() {
                        double first = double.parse(textBox1.text);
                        double second = double.parse(textBox2.text);
                        switch (_values) {
                          case "Add":
                            _displayText = "= ${first + second}";
                            break;
                          case "Subtracte":
                            _displayText = "= ${first - second}";
                            break;
                          case "Multiply":
                            _displayText = "= ${first * second}";
                            break;
                          case "Divide":
                            var div = first / second;
                            _displayText =
                                "= " + div.toStringAsFixed(2);
                            break;
                          default:
                            _displayText = "Something Went Wrong";
                        }
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    child: const Text('clear'),
                    onPressed: () {
                      _clearAll();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _clearAll() {
    textBox1.text = "";
    textBox2.text = "";
  }

}
