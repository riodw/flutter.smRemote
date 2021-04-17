import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Pub
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:page_transition/page_transition.dart';
// - timeline - https://github.com/softmarshmallow/flutter-timeline/blob/master/example/lib/screen/plain_timeline_demo.dart
import 'package:flutter_timeline/flutter_timeline.dart';
import 'package:flutter_timeline/indicator_position.dart';
import 'package:flutter_timeline/timeline_theme.dart';
import 'package:flutter_timeline/timeline_theme_data.dart';

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

dynamic command = {
  'id': 0,
  'name': '😈',
  'description': 'This is a description',
};

List<dynamic> commands = [
  {
    'id': 0,
    'name': '🔔',
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

class _MyHomePageState extends State<MyHomePage> {
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
      body: GridView.count(
        // physics: NeverScrollableScrollPhysics(),
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
          // if (commands.length < 31)
          //   GestureDetector(
          //     onTap: () {
          //       print("Container clicked");
          //       setState(() {
          //         commands.add(command);
          //       });
          //     },
          //     child: Container(
          //       margin: EdgeInsets.all(10),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(10),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.grey.withOpacity(0.5),
          //             spreadRadius: 5,
          //             blurRadius: 7,
          //             offset: Offset(0, 3), // changes position of shadow
          //           ),
          //         ],
          //       ),
          //       child: Container(
          //         // decoration: BoxDecoration(
          //         //   boxShadow: [
          //         //     const BoxShadow(
          //         //       color: Colors.transparent,
          //         //     ),
          //         //     BoxShadow(
          //         //       color: Colors.grey.withOpacity(0.5),
          //         //       spreadRadius: 0.0,
          //         //       blurRadius: 2.0,
          //         //     ),
          //         //   ],
          //         // ),
          //         child: Center(
          //           child: Icon(
          //             CupertinoIcons.add,
          //             size: 50,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTop,
                child: SecondPage(),
              ),
            );
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
        child: Icon(Icons.menu),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SecondPage createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {
  TextEditingController _textController;
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'initial text');
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Widget get randomIndicator {
    var candidates = [
      TimelineDots.of(context).circleIcon,
      Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    ];
    final _random = new Random();
    var element = candidates[_random.nextInt(candidates.length)];
    return element;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_dash),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_solid),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.gear_alt_fill),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.app_badge),
            label: 'Switch',
            // title: Text('Views'),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (BuildContext context) {
                return CupertinoPageScaffold(
                  child: SafeArea(
                    child: CustomScrollView(
                      slivers: [
                        CupertinoSliverNavigationBar(
                          leading: GestureDetector(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pop();
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Done',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          // middle: Text('Kindacode.com'),
                          trailing: Material(
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      color: Colors.white10,
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        // mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          const SizedBox(
                                            height: 24,
                                          ),
                                          TextFormField(
                                            maxLength: 2,
                                            controller: myController,
                                            decoration: const InputDecoration(
                                              border:
                                                  const OutlineInputBorder(),
                                              suffix:
                                                  const Text('2 Character Max'),
                                              hintText: 'Title',
                                            ),
                                          ),
                                          TextFormField(
                                            minLines: 1,
                                            // maxLines: ,
                                            // maxLength: 2,
                                            // controller: myController,
                                            decoration: const InputDecoration(
                                              border:
                                                  const OutlineInputBorder(),
                                              // suffix: const Text('Description'),
                                              hintText: 'Description',
                                            ),
                                          ),
                                          // const Text('Modal BottomSheet'),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          ButtonTheme(
                                            minWidth: 300.0,
                                            height: 50.0,
                                            child: FlatButton(
                                              onPressed: () {
                                                if (myController.text.length >
                                                    0) {
                                                  setState(() {
                                                    commands.add(
                                                      {
                                                        'id': 0,
                                                        'name':
                                                            myController.text,
                                                        'description':
                                                            'This is a description',
                                                      },
                                                    );
                                                    Navigator.pop(context);
                                                  });
                                                }
                                                // print(myController.text);
                                              },
                                              color: Colors.blue,
                                              textColor: Colors.white,
                                              child: const Text('Save'),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          ButtonTheme(
                                            minWidth: 300.0,
                                            height: 50.0,
                                            child: OutlineButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              color: Colors.grey,
                                              child: const Text('Cancel'),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          largeTitle: Text('Tasks $index'),
                        ),
                        SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (final BuildContext context, final int index) {
                              final int itemIndex = index ~/ 2;
                              if (index.isEven) {
                                return Slidable(
                                  actionPane: SlidableDrawerActionPane(),
                                  actionExtentRatio: 0.25,
                                  child: Material(
                                    child: Container(
                                      color: Colors.white,
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Text(
                                            commands[itemIndex]['name'],
                                            style: TextStyle(
                                                fontSize: 35,
                                                color: Colors.black),
                                          ),
                                          foregroundColor: Colors.white,
                                        ),
                                        title: Text(
                                          commands[itemIndex]['description'],
                                        ),
                                        subtitle:
                                            Text('SlidableDrawerDelegate'),
                                      ),
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
                                    // IconSlideAction(
                                    //   caption: 'Edit',
                                    //   color: Colors.indigo,
                                    //   icon: Icons.edit,
                                    //   onTap: () {},
                                    // ),
                                    IconSlideAction(
                                      caption: 'Delete',
                                      color: Colors.red,
                                      icon: Icons.delete,
                                      onTap: () => showDialog(
                                        context: context,
                                        builder: (context) =>
                                            CupertinoAlertDialog(
                                          title: Text('Delete ' +
                                              commands[index]['name']),
                                          content: const Text(
                                            'Are you Sure?',
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              textColor: Colors.blue,
                                              child: const Text('Cancel'),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                            FlatButton(
                                              textColor: Colors.red,
                                              child: const Text('DELETE'),
                                              onPressed: () async {
                                                // setState(() {
                                                //   commands.removeAt(index);
                                                //   Navigator.pop(context);
                                                // });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return Divider(height: 0, color: Colors.grey);
                            },
                            childCount: max(0, commands.length * 2 - 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
            break;
          case 1:
            // HISTORY
            return CupertinoTabView(
              builder: (BuildContext context) {
                return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Done',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    // CupertinoNavigationBarBackButton(onPressed: () {
                    //   Navigator.of(context, rootNavigator: true).pop();
                    // }),
                    middle: Text('History $index'),
                    // trailing: GestureDetector(
                    //   onTap: () {},
                    //   child: Icon(Icons.add_sharp),
                    // ),
                  ),
                  child: SafeArea(
                    child: Scaffold(
                      body: TimelineTheme(
                        data: TimelineThemeData(
                          lineColor: Colors.blueAccent,
                          itemGap: 100,
                          lineGap: 0,
                        ),
                        child: Timeline(
                          anchor: IndicatorPosition.center,
                          indicatorSize: 56,
                          altOffset: Offset(10, 10),
                          events: [
                            TimelineEventDisplay(
                              anchor: IndicatorPosition.top,
                              indicatorOffset: Offset(0, 0),
                              child: TimelineEventCard(
                                title: Text("asdf"),
                                content: Text(
                                  "someone commented on your timeline ${DateTime.now()}",
                                ),
                              ),
                              indicator: Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                              ),
                            ),
                            TimelineEventDisplay(
                              child: Card(
                                child: TimelineEventCard(
                                  title: Text("click the + button"),
                                  content: Text("to add a new event item"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
            break;
          case 2:
            // SETTINGS
            return CupertinoTabView(
              builder: (BuildContext context) {
                return CupertinoPageScaffold(
                    child: CustomScrollView(
                  slivers: [
                    CupertinoSliverNavigationBar(
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Material(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Done',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // middle: Text('Kindacode.com'),
                      trailing: Material(
                        child: IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {},
                        ),
                      ),
                      largeTitle: Text('Ash\'s Tasks $index'),
                    ),
                    // SafeArea(
                    //   child: Scaffold(
                    //     body: TimelineTheme(
                    //       data: TimelineThemeData(
                    //         lineColor: Colors.blueAccent,
                    //         itemGap: 100,
                    //         lineGap: 0,
                    //       ),
                    //       child: Column(children: <Widget>[
                    //         CupertinoTextField(controller: _textController)
                    //       ]),
                    //     ),
                    //   ),
                    // ),
                  ],
                )
                    // navigationBar: CupertinoNavigationBar(
                    //   leading: GestureDetector(
                    //     onTap: () {
                    //       Navigator.of(context, rootNavigator: true).pop();
                    //     },
                    //     child: Align(
                    //       alignment: Alignment.centerLeft,
                    //       child: Text(
                    //         'Done',
                    //         style: TextStyle(
                    //           decoration: TextDecoration.underline,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.blue,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    //   middle: Text('Ash\'s Tasks $index'),
                    //   // trailing: GestureDetector(
                    //   //   onTap: () {},
                    //   //   child: Icon(Icons.add_sharp),
                    //   // ),
                    // ),
                    // child: SafeArea(
                    //   child: Scaffold(
                    //     body: TimelineTheme(
                    //       data: TimelineThemeData(
                    //         lineColor: Colors.blueAccent,
                    //         itemGap: 100,
                    //         lineGap: 0,
                    //       ),
                    //       child: Column(children: <Widget>[
                    //         CupertinoTextField(controller: _textController)
                    //       ]),
                    //     ),
                    //   ),
                    // ),
                    );
              },
            );
            break;
          case 3:
            // SWITCH
            return CupertinoTabView(
              builder: (BuildContext context) {
                return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Done',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    // CupertinoNavigationBarBackButton(onPressed: () {
                    //   Navigator.of(context, rootNavigator: true).pop();
                    // }),
                    middle: Text('Ash\'s Tasks $index'),
                    // trailing: GestureDetector(
                    //   onTap: () {},
                    //   child: Icon(Icons.add_sharp),
                    // ),
                  ),
                  child: SafeArea(
                    child: Scaffold(
                      body: TimelineTheme(
                        data: TimelineThemeData(
                          lineColor: Colors.blueAccent,
                          itemGap: 100,
                          lineGap: 0,
                        ),
                        child: Text('Tasks $index'),
                      ),
                    ),
                  ),
                );
              },
            );
            break;
        }
      },
    );
  }
}
