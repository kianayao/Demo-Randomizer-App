import 'package:flutter/material.dart';
import 'package:cs4750_final_project/main.dart';
import 'package:cs4750_final_project/random_custom.dart';
import 'package:cs4750_final_project/personalize.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:page_transition/page_transition.dart';

class num_gen_page extends StatefulWidget {
  const num_gen_page({super.key, required this.title});
  final String title;

  @override
  State<num_gen_page> createState() => _my_num_gen_page_state();
}

class _my_num_gen_page_state extends State<num_gen_page> {
  int selected_index = 0;
  void _onItemTapped(int index) {
    setState(() {
      selected_index = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        PageTransition(type: PageTransitionType.rightToLeft, child: cust_gen_page(
            title: 'Custom Generator')),
      );
    }

    else if (index == 2) {
      Navigator.push(
        context,
          PageTransition(type: PageTransitionType.rightToLeft, child: pers_page(
              title: 'Personalization Page')),
      );
    }
  }

  final min = TextEditingController();
  final max = TextEditingController();
  String display_text = "";
  RegExp digitValidator  = RegExp("[0-9]");
  bool isANumber1 = true, isANumber2 = true;

  void setValidator1(valid){
    setState(() {
      isANumber1 = valid;
    });
  }

  void setValidator2(valid){
    setState(() {
      isANumber2 = valid;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    min.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Number Generator'),
          automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: <Widget> [
        Padding(
        padding: const EdgeInsets.fromLTRB(100, 100, 100, 0),
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (inputValue){
              if(inputValue.isEmpty || digitValidator.hasMatch(inputValue)){
                setValidator1(true);
              } else{
                setValidator1(false);
              }
            },
            decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.blue),
                hintText: "minimum",
                errorText: isANumber1 ? null : "Please enter a number"
            ),
            controller: min,
          ),
        ),
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 5, 100, 10),
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (inputValue){
                  if(inputValue.isEmpty || digitValidator.hasMatch(inputValue)){
                    setValidator2(true);
                  } else{
                    setValidator2(false);
                  }
                },
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.blue),
                    hintText: "maximum",
                    errorText: isANumber2 ? null : "Please enter a number"
                ),
                controller: max,
              ),
            ),
            ElevatedButton(onPressed: (){
              Random random = new Random();
              int mini = int.parse(min.text), maxi = int.parse(max.text);
              int rand_num = random.nextInt(maxi - mini) + mini + 1;
              setState(() {
                display_text = rand_num.toString();
              });
            }, child: Text("Generate")),
            Text(display_text,style: TextStyle(fontSize: 20),),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
              child:Text('enter a minimum and maximum number, and a random number will'
                     ' be generated between the\nbounds you specified',
                     style: TextStyle(fontSize: 15),)),
        ]
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.numbers_rounded),
              label: 'numbers'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.blur_circular_rounded),
            label: 'custom',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.color_lens_outlined),
            label: 'personalization',
          ),
        ],
        currentIndex: selected_index,
        selectedItemColor: Colors.pink[200],
        onTap: _onItemTapped,
      ),
    );
  }
}



