import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'smRemote'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _layout_grid = false;

  dynamic command = {
    'id': 0,
    'name': '😈',
    'description': 'This is a description',
  };

  List commands = [
    {
      'id': 0,
      'name': '😈',
      'description': 'This is a description',
    },
    {
      'id': 0,
      'name': '🔱',
      'description': 'This is a description',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      //   brightness: Brightness.dark,
      //   actions: <Widget>[
      //     IconButton(
      //         icon: Icon(Icons.more_vert),
      //         onPressed: () {
      //           return;
      //         }),
      //   ],
      // ),
      body: (_layout_grid == true)
          ? GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: <Widget>[
                // GRIDVIEW
                for (var command in commands)
                  GestureDetector(
                    onTap: () {
                      print("Container clicked2222");
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Container(
                        // decoration: BoxDecoration(
                        //   boxShadow: [
                        //     const BoxShadow(
                        //       color: Colors.transparent,
                        //     ),
                        //     BoxShadow(
                        //       color: Colors.grey.withOpacity(0.5),
                        //       spreadRadius: 0.0,
                        //       blurRadius: 2.0,
                        //     ),
                        //   ],
                        // ),
                        child: Center(
                          child: Text(
                            command['name'],
                            style: TextStyle(fontSize: 35),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (commands.length < 31)
                  GestureDetector(
                    onTap: () {
                      print("Container clicked");
                      setState(() {
                        commands.add(command);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Container(
                        // decoration: BoxDecoration(
                        //   boxShadow: [
                        //     const BoxShadow(
                        //       color: Colors.transparent,
                        //     ),
                        //     BoxShadow(
                        //       color: Colors.grey.withOpacity(0.5),
                        //       spreadRadius: 0.0,
                        //       blurRadius: 2.0,
                        //     ),
                        //   ],
                        // ),
                        child: Center(
                          child: Icon(
                            CupertinoIcons.add,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            )
          : SafeArea(
              child: ListView.separated(
                itemCount: commands.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(height: 3, color: Colors.grey),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    // color: Colors.amber[100],
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          commands[index]['name'],
                          style: TextStyle(fontSize: 35),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          commands[index]['description'],
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _layout_grid = !_layout_grid;
          });
          // showModalBottomSheet<void>(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return Container(
          //       // height: 200,
          //       color: Colors.amber,
          //       child: Center(
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           mainAxisSize: MainAxisSize.min,
          //           children: <Widget>[
          //             const Text('Modal BottomSheet'),
          //             ElevatedButton(
          //               child: const Text('Close BottomSheet'),
          //               onPressed: () => Navigator.pop(context),
          //             )
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // );
        },
        tooltip: 'Increment',
        child: _layout_grid ? Icon(Icons.menu) : Icon(Icons.apps_rounded),
      ),
    );
  }
}
