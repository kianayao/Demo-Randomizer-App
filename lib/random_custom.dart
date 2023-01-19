import 'package:flutter/material.dart';
import 'package:cs4750_final_project/main.dart';
import 'package:cs4750_final_project/random_num.dart';
import 'package:cs4750_final_project/personalize.dart';
import 'dart:math';
import 'package:page_transition/page_transition.dart';


class cust_gen_page extends StatefulWidget {
  const cust_gen_page({super.key, required this.title});
  final String title;

  @override
  State<cust_gen_page> createState() => _my_cust_gen_page_state();
}

class _my_cust_gen_page_state extends State<cust_gen_page> {
  int selected_index = 1;
  void _onItemTapped(int index) {
    setState(() {
      selected_index = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        PageTransition(type: PageTransitionType.leftToRight, child: num_gen_page(
            title: 'Number Generator')),
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

  final list_together = TextEditingController();
  String display_text = "";

  Map<int, String> get_list(String list_items) {
    final split = list_items.split(',');
    final Map<int, String> values = {
      for (int i = 0; i < split.length; i++)
        i: split[i]
    };
    return values;
  }

  String? get_option(String list_items) {
    Map<int, String> values = get_list(list_items);
    if (values.length != 0) {
      Random random = new Random();
      int rand_num = random.nextInt(values.length);
      return values[rand_num];
    }

    return 'error: no options';
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    list_together.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Generator'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
            children: <Widget> [
        Padding(
        padding: const EdgeInsets.fromLTRB(100, 100, 100, 0),
          child: TextField(
                maxLines: null,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.blue),
                    hintText: "enter \",\" seperated options"
                ),
                controller: list_together,
              ),),
              ElevatedButton(onPressed: (){
                setState(() {
                  display_text = get_option(list_together.text)!;
                });
              }, child: Text("Choose")),
              if (display_text != 'error: no options')
                Text(display_text, style: TextStyle(fontSize: 20),)
              else
                Text(display_text, style: TextStyle(fontSize: 20, color: Colors.red),),
              Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
              child: Text('enter a comma seperated list of options \n'
                          'e.g. jane, jon doe, hello\n'
                          'and a random option will be chsosen',
                style: TextStyle(fontSize: 15),))
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



