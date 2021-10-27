import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'recipe_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CarouselController _controller = CarouselController();
  List _recipes_dessert = [];

  @override
  void initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/dessert.json');
    final data = await json.decode(response);
    setState(() {
      _recipes_dessert = data["recipes"];
      print(_recipes_dessert);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black87,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0),
        ),
        body: Column(
          children: [
            CarouselSlider(
              items: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 200,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/dessert2.jpeg"),
                              fit: BoxFit.fitWidth)),
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                  onPressed: () => _controller.previousPage(),
                                  icon: const Icon(
                                    Icons.arrow_left,
                                    color: Colors.white,
                                  )),
                              const Text(
                                'Dessert',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              IconButton(
                                  onPressed: () => _controller.nextPage(),
                                  icon: const Icon(Icons.arrow_right,
                                      color: Colors.white)),
                            ],
                          ),
                        ],
                      )),
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      child: Expanded(
                          child: MediaQuery.removePadding(context: context, removeTop: true ,
                              child:ListView(
                                children: [
                                  GridView.builder(
                                    gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                        MediaQuery.of(context).size.width ~/
                                            200),
                                    itemBuilder: (context, index) {
                                      return RecipeCard(
                                          id: _recipes_dessert[index]["id"],
                                          title: _recipes_dessert[index]["name"],
                                          picPath: _recipes_dessert[index]["picture"],
                                          recipe: _recipes_dessert[index]["recipe"],
                                      );
                                    },
                                    itemCount: _recipes_dessert.length,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: const ScrollPhysics(),
                                    primary: false,
                                  )
                                ],
                              )
                          )


    ),
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 200,
                      color: Colors.blue,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                  onPressed: () => _controller.previousPage(),
                                  icon: const Icon(
                                    Icons.arrow_left,
                                    color: Colors.white,
                                  )),
                              const Text('Entry C'),
                              IconButton(
                                  onPressed: () => _controller.nextPage(),
                                  icon: const Icon(Icons.arrow_right,
                                      color: Colors.white)),
                            ],
                          ),
                        ],
                      )),
                      width: MediaQuery.of(context).size.width,
                    ),
                    GridView.count(
                      crossAxisCount: 10,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text("He'd have you all unravel at the"),
                          color: Colors.teal[100],
                        )
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 200,
                      color: Colors.green,
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                  onPressed: () => _controller.previousPage(),
                                  icon: const Icon(
                                    Icons.arrow_left,
                                    color: Colors.white,
                                  )),
                              const Text('Entry C'),
                              IconButton(
                                  onPressed: () => _controller.nextPage(),
                                  icon: const Icon(Icons.arrow_right,
                                      color: Colors.white)),
                            ],
                          ),
                        ],
                      )),
                      width: MediaQuery.of(context).size.width,
                    ),
                    GridView.count(
                      crossAxisCount: 10,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text("He'd have you all unravel at the"),
                          color: Colors.teal[100],
                        )
                      ],
                    )
                  ],
                ),
              ],
              options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  height: MediaQuery.of(context).size.height,
                  viewportFraction: 1),
              carouselController: _controller,
            ),
          ],
        ));
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard(
      {Key? key, required this.id, required this.title, required this.picPath, required this.recipe})
      : super(key: key);

  final String title;
  final String picPath;
  final num id;
  final String recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context){
              return RecipePage(name: title, picPath: picPath, recipe: recipe,);
            })
          );
        },
        child:Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(picPath, fit: BoxFit.fill),
            Column(
              verticalDirection: VerticalDirection.up,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  color: const Color.fromRGBO(0, 0, 0, 0.4),
                  height: 50,
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ) ,



      elevation: 5,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }


}
