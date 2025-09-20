import 'package:flutter/material.dart';

void main()=>runApp(Quizzler());

class Quizzler extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Expanded(
              child: Center(
                child: Expanded(child: Text(style: TextStyle(
                  color: Colors.white),
                 'This is where the question text will go')),
              ),
            ),
            
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      child: TextButton(
                        onPressed: () {
                          print('pressed');
                      }, child: const Text(style:TextStyle(color: Colors.white), "True")
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    Expanded(
                      child: Container(
                        color: Colors.red,
                        child: TextButton(
                          onPressed: () {
                            print('pressed');
                          }, child: const Text(style:TextStyle(color: Colors.white), "False")
                        ),
                      ),
                    ),
                 ],
               ),
            ],
          ),
        ),
      )
    ); 
  }
}
