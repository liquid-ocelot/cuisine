import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key, required this.name, required this.picPath, required this.recipe}) : super(key: key);

  final String name;
  final String picPath;
  final String recipe;

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black87,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
      ),
      body:Column(
        children: [
          Container(
            height: 200,
            decoration:  BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.picPath),
                    fit: BoxFit.fitWidth)),
            child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                        Text(
                           widget.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),

                  ],
                )),
            width: MediaQuery.of(context).size.width,
          ),

          Expanded(
            child:
          ListView(
            children: [
              Container(
                padding: EdgeInsets.all(32),
                child: Text(widget.recipe,style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12),
              )
              ,
          ),
            ],
          ),

          ),

        ],
      )
    );
  }
}
