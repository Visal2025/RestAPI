import 'package:flutter/material.dart';
import 'package:restapi_recipeapp/home_screen.dart';
import 'package:restapi_recipeapp/recipe_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecipeApi(),
      debugShowCheckedModeBanner: false,
    );
  }
}