import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('AnimatedAlign',style: TextStyle(fontSize: 15),)
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool selected1 = false;
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected1 = !selected1;
          value = 1;
        });
      },
      child: AnimatedAlign(
        // heightFactor: 100,
        // onEnd: () {},
        //  widthFactor: 2,
        alignment: selected1 ? Alignment.topLeft :  Alignment.center,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
            image: DecorationImage(
              image: NetworkImage('https://cdn.pixabay.com/photo/2017/06/07/10/47/elephant-2380009_960_720.jpg'),
              fit: BoxFit.cover
            )
          ),
        ),
      ),
    );
  }
}