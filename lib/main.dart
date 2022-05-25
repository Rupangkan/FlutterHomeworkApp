import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'Standards.dart';

Future<String> loadJson() async {
  return await rootBundle.rootBundle.loadString("json/classes.json");
}
Set<String> checkedString = {};
bool buttonState = false;
Color buttonColor = Colors.grey;

void main() {
  runApp(const MyApp());
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
          height: 68,
          width: MediaQuery.of(context).size.width-20,
          child: SizedBox(
              child:FloatingActionButton.extended(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                onPressed: (){
                  Navigator.pop(context);
                }, elevation: 20,
                label: Text('Thank You', style: GoogleFonts.getFont('Epilogue',
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    )),
                ),

                backgroundColor: const Color(0xFF270F36),

              )
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Welcome",
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
                  "You teach these classes & subjects",
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
              itemCount: checkedString.length,
              itemBuilder: (context, index) {
                // return StandardClasses(standards, index);
                List checkedList = checkedString.toList();
                return ListViewClass(checkedList, index);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListViewClass extends StatefulWidget {

  final List checkedList;
  final index;
  const ListViewClass(this.checkedList, this.index, {Key? key}) : super(key: key);

  @override
  State<ListViewClass> createState() => _ListViewClassState();
}

class _ListViewClassState extends State<ListViewClass> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(6),
        child:Container(
          //color: Colors.white10,
            height: 70,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child:
            Row(
                children: <Widget>[

                  Padding(
                      padding: const EdgeInsets.all(6), //top: 5.0, left: 8
                      child:
                      Container(
                        //color: Colors.deepPurple,
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.all(3.0),
                          padding: const EdgeInsets.all(3.0),
                          decoration: const BoxDecoration(
                              color: Color(0xFF270F36),
                              borderRadius: BorderRadius.all(Radius.circular(7.0))),

                          child:
                          Align(
                            alignment: Alignment.center,
                            child:Text(
                              widget.checkedList[widget.index].split(",").first,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13
                              ),
                            ),
                          )
                      )
                  ),

                  Text(
                    widget.checkedList[widget.index].split(",").last,
                    style: const TextStyle(
                        color: Color(0xFF270F36),
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  ),

                  const Padding(padding: EdgeInsets.only(bottom: 75))
                ]
            )
          // )
        )
    );
  }
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

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  late String db;
  late List<dynamic> standards;

  @override
  void initState() {
    super.initState();
    loadJson().then((data) {
      setState(() {
        db = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> classSub = jsonDecode(db);
    standards = classSub['classes'];
    // print(standards);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
          height: 68,
          width: MediaQuery.of(context).size.width-20,
          child: SizedBox(
              child:FloatingActionButton.extended(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                onPressed: (){
                  if(buttonState) {
                    // nextPage();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ListPage()));
                  } else {

                  }
                }, elevation: 20,
                label: Text('Continue', style: GoogleFonts.getFont('Epilogue',
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    )),
                ),

                backgroundColor: const Color(0xFF270F36),

              )
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
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
              itemCount: standards.length,
              itemBuilder: (context, index) {
                return StandardClasses(standards, index);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Future<List<Standards>> readJsonData() async{
  //   final jsonData = await rootBundle.rootBundle.loadString('json/classes.json');
  //   final list = json.decode(jsonData);
  //
  //   return list.map((e) => Standards.fromJson(e)).toList();
  // }
}

class StandardClasses extends StatefulWidget {
  final List<dynamic> standards;
  final int index;
  const StandardClasses(this.standards, this.index,  {Key? key}) : super(key: key);

  @override
  State<StandardClasses> createState() => _StandardClassesState();
}

class _StandardClassesState extends State<StandardClasses> {
  // void printall() {
  //   print("${widget.index}  ");
  // }

  @override
  Widget build(BuildContext context) {
    // printall();
    int index = widget.index;
    List<dynamic> subjects = widget.standards[index]['subjects'];
    // List<dynamic> standardName = widget.standards[index];
    String standardName = widget.standards[index]['standard'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(3.0),
          decoration: const BoxDecoration(
              color:  Color(0xFF270F36),
              borderRadius: BorderRadius.all(Radius.circular(7.0))),
          child:  Align(
            alignment: Alignment.center,
            child: Text('${widget.standards[widget.index]['standard']}',
                style: GoogleFonts.getFont('Epilogue',
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ))
              ),
          ),
        ),

        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: widget.standards[widget.index]["subjects"].length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ClassView(subjects, index, standardName);
            },
          ),
        ),
      ],
    );
  }
}

class ClassView extends StatefulWidget {
  final int index;
  final List<dynamic> subjects;
  final String standardName;
  const ClassView(this.subjects, this.index, this.standardName, {Key? key}) : super(key: key);

  @override
  State<ClassView> createState() => _ClassViewState();
}

class _ClassViewState extends State<ClassView> {
  @override
  Widget build(BuildContext context) {
    String url = widget.subjects[widget.index]["subject_image"];
    String subjectName = widget.subjects[widget.index]["subject_name"];
    String fullSubjectName = "${widget.standardName}, $subjectName";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 180,
          height: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade100,
                  offset: const Offset(2, 4),
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
                height: 118,
                width: double.infinity,
                child: Image.network(
                  url,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Text(subjectName),
              CheckboxListTile(
                title: Text(subjectName, style: GoogleFonts.getFont('Epilogue',
                    textStyle: const TextStyle(
                      color: Color(0xFF270F36),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ))),
                checkColor: Colors.white,
                activeColor: const Color(0xFF270F36),
                value: checkedString.contains(fullSubjectName),
                onChanged: (bool? value) {
                  setState(() {
                  //   checkedValue = newValue;
                    if(checkedString.contains(fullSubjectName)){
                      checkedString.remove(fullSubjectName);
                    } else {
                      checkedString.add(fullSubjectName);
                    }
                    // print(checkedString);
                    if(checkedString.isEmpty) {
                      buttonState = false;
                      buttonColor = Colors.grey;
                    } else {
                      buttonState = true;
                      buttonColor = const Color(0xFF270F36);
                    }

                  });
                },
                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       alignment: Alignment.centerLeft,
//       padding: const EdgeInsets.only(left: 30, bottom: 20, right: 20, top: 50),
//       child: Column(
//         children: const [
//           Progress(),
//           // StandardList(),
//           ButtonOptions(),
//         ],
//       ),
//     ));
//   }
// }
//
// class Progress extends StatelessWidget {
//   const Progress({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Text(
//               "Teacher's profile",
//               style: GoogleFonts.getFont('Epilogue',
//                   textStyle: const TextStyle(
//                     color: Color(0xFF270F36),
//                     fontWeight: FontWeight.w700,
//                     fontSize: 14,
//                     height: 5,
//                   )),
//             ),
//           ],
//         ),
//         Text(
//           "Which Grades & Subjects you teach",
//           style: GoogleFonts.getFont('Epilogue',
//               textStyle: const TextStyle(
//                   color: Color(0xFF270F36),
//                   fontWeight: FontWeight.w700,
//                   fontSize: 28)),
//         ),
//       ],
//     );
//   }
// }
//
// class ButtonOptions extends StatefulWidget {
//   const ButtonOptions({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return ButtonOptionsState();
//   }
// }
//
// class ButtonOptionsState extends State<ButtonOptions> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       scrollDirection: Axis.horizontal,
//       children: [buildCard(), const SizedBox(width: 12)],
//     );
//   }
// }
//
// Widget _buildItems(int index) {
//   return Container(
//       // color: Colors.blue,
//       padding: const EdgeInsets.all(10.0),
//       child: Row(
//         children: [
//           Row(children: [
//             // buildCard(),
//             // const SizedBox(width: 12),
//             // buildCard(),
//             // const SizedBox(width: 12)
//             Card(
//               child: InkWell(
//                 splashColor: Colors.blue.withAlpha(30),
//                 onTap: () {
//                   debugPrint('Card tapped.');
//                 },
//                 child: const SizedBox(
//                   width: 300,
//                   height: 300,
//                   child: Text('A card that can be tapped'),
//                 ),
//               ),
//             ),
//           ])
//         ],
//       ));
// }
//
// Widget buildCard() => Container(
//       width: 200,
//       height: 200,
//       color: Colors.red,
//     );

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
