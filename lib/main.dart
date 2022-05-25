import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'Standards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Startup Name Generator',
      home: MainBody(),
    );
  }

}

class MainBody extends StatelessWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
          future: readJsonData(),
          builder: (context, data) {
            if(data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if(data.hasData) {
              return ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Teacher's profile",
                            style: GoogleFonts.getFont('Epilogue',
                                textStyle: const TextStyle(
                                  color: Color(0xFF270F36),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  height: 5,
                                )),
                          ),
                        ],
                      ),
                      Text(
                        "Which Grades & Subjects you teach",
                        style: GoogleFonts.getFont('Epilogue',
                            textStyle: const TextStyle(
                                color: Color(0xFF270F36),
                                fontWeight: FontWeight.w700,
                                fontSize: 28)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return const StandardClasses();
                    },
                  ),
                ],
              );
            } else {
                return Center(child: Text("hehe"));
            }
          }
        ),
      ),
    );
  }

  Future<List<Standards>> readJsonData() async{
    final jsonData = await rootBundle.rootBundle.loadString('json/classes.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => Standards.fromJson(e)).toList();
  }
}

class StandardClasses extends StatelessWidget {
  const StandardClasses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('standard'),
        const SizedBox(
          height: 16,
        ),
        Container(
          height: 200,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const ClassView();
            },
          ),
        ),
      ],
    );
  }
}

class ClassView extends StatelessWidget {
  const ClassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 160,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade100,
                  offset: Offset(2, 4),
                  spreadRadius: 6,
                  blurRadius: 4),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.pink.shade50,
                height: 140,
                width: double.infinity,
                child: Image.network(
                  'https://picsum.photos/200/300',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('class name'),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 30, bottom: 20, right: 20, top: 50),
      child: Column(
        children: const [
          Progress(),
          // StandardList(),
          ButtonOptions(),
        ],
      ),
    ));
  }
}

// class StandardList extends StatefulWidget {
//   const StandardList({Key? key}) : super(key: key);
//
//   @override
//   State<StandardList> createState() => _StandardListState();
// }
//
// class _StandardListState extends State<StandardList> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//
//     )
//
//   }
// }

class Progress extends StatelessWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Teacher's profile",
              style: GoogleFonts.getFont('Epilogue',
                  textStyle: const TextStyle(
                    color: Color(0xFF270F36),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    height: 5,
                  )),
            ),
          ],
        ),
        Text(
          "Which Grades & Subjects you teach",
          style: GoogleFonts.getFont('Epilogue',
              textStyle: const TextStyle(
                  color: Color(0xFF270F36),
                  fontWeight: FontWeight.w700,
                  fontSize: 28)),
        ),
      ],
    );
  }
}

class ButtonOptions extends StatefulWidget {
  const ButtonOptions({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ButtonOptionsState();
  }
}

class ButtonOptionsState extends State<ButtonOptions> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [buildCard(), const SizedBox(width: 12)],
    );
  }
}

Widget _buildItems(int index) {
  return Container(
      // color: Colors.blue,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Row(children: [
            // buildCard(),
            // const SizedBox(width: 12),
            // buildCard(),
            // const SizedBox(width: 12)
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
                },
                child: const SizedBox(
                  width: 300,
                  height: 300,
                  child: Text('A card that can be tapped'),
                ),
              ),
            ),
          ])
        ],
      ));
}

Widget buildCard() => Container(
      width: 200,
      height: 200,
      color: Colors.red,
    );

// class RandomWords extends StatefulWidget {
//   const RandomWords({Key? key}) : super(key: key);
//
//   @override
//   State<RandomWords> createState() => _RandomWordsState();
// }
//
// class StandardsView extends StatefulWidget {
//   const StandardsView({Key? key}) : super(key: key);
//
//   @override
//   State<StandardsView> createState() => _StandardsViewState();
// }

// class _StandardsViewState extends State<StandardsView> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class StandardList extends StatefulWidget {
//   const StandardList({Key? key}) : super(key: key);
//
//   @override
//   State<StandardList> createState() => _StandardListState();
// }
//
// class _StandardListState extends State<StandardList> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class _RandomWordsState extends State<RandomWords> {
//   final _suggestions = <WordPair>[];
//   final _biggerFont = const TextStyle(fontSize: 18);
//
//   @override
//   Widget build(BuildContext context) {
//     final wordPair = WordPair.random();
//     return ListView.builder(
//       padding: const EdgeInsets.all(16.0),
//       itemBuilder: /*1*/ (context, i) {
//         if (i.isOdd) return const Divider(); /*2*/
//
//         final index = i ~/ 2; /*3*/
//         if (index >= _suggestions.length) {
//           _suggestions.addAll(generateWordPairs().take(10)); /*4*/
//         }
//         return ListTile(
//           title: Text(
//             _suggestions[index].asPascalCase,
//             style: _biggerFont,
//           ),
//         );
//       },
//     );
//   }
// }
