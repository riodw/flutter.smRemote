import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Pub
import 'package:flutter_slidable/flutter_slidable.dart';

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
    {
      'id': 0,
      'name': '😈',
      'description': 'This is a description',
    },
  ];

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

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
                    Divider(height: 1, color: Colors.grey),
                itemBuilder: (final BuildContext context, final int index) {
                  if (index == commands.length - 1)
                    return FlatButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              color: Colors.white10,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    TextFormField(
                                      maxLength: 2,
                                      controller: myController,
                                      decoration: const InputDecoration(
                                        border: const OutlineInputBorder(),
                                        suffix: Text('2 Character Max'),
                                        hintText: 'Title',
                                      ),
                                    ),
                                    const Text('Modal BottomSheet'),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        RaisedButton(
                                          onPressed: () {
                                            setState(() {
                                              commands.add(
                                                {
                                                  'id': 0,
                                                  'name': myController.text,
                                                  'description':
                                                      'This is a description',
                                                },
                                              );
                                              Navigator.pop(context);
                                            });
                                            // print(myController.text);
                                          },
                                          color: Colors.blue,
                                          textColor: Colors.white,
                                          child: const Text('Save'),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        RaisedButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Cancel'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      color: Colors.indigoAccent,
                      height: 54,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          Text('New'),
                        ],
                      ),
                    );

                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: Container(
                      color: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text(
                            commands[index]['name'],
                            style: TextStyle(fontSize: 35),
                          ),
                          foregroundColor: Colors.white,
                        ),
                        title: Text(
                          commands[index]['description'],
                        ),
                        subtitle: Text('SlidableDrawerDelegate'),
                      ),
                    ),
                    // actions: <Widget>[
                    //   IconSlideAction(
                    //     caption: 'Archive',
                    //     color: Colors.blue,
                    //     icon: Icons.archive,
                    //     onTap: () {},
                    //   ),
                    //   IconSlideAction(
                    //     caption: 'Share',
                    //     color: Colors.indigo,
                    //     icon: Icons.share,
                    //     onTap: () {},
                    //   ),
                    // ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Edit',
                        color: Colors.indigo,
                        icon: Icons.edit,
                        onTap: () {},
                      ),
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: Text('Delete ' + commands[index]['name']),
                            content: const Text(
                              'Are you Sure?',
                            ),
                            actions: <Widget>[
                              FlatButton(
                                textColor: Colors.blue,
                                child: const Text('Cancel'),
                                onPressed: () => Navigator.pop(context),
                              ),
                              FlatButton(
                                textColor: Colors.red,
                                child: const Text('DELETE'),
                                onPressed: () async {
                                  setState(() {
                                    commands.removeAt(index);
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
