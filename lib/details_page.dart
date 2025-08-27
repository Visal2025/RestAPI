
import 'package:flutter/material.dart';
import 'package:restapi_recipeapp/recipe_model.dart';

class Detailspage extends StatelessWidget {
  final Recipe recipe;
  Detailspage({required this.recipe});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(backgroundColor: Colors.pink,),
      body: Padding(padding: const EdgeInsets.all(15),
      child: Center(child: Column(
        children: [
          SizedBox(height: 15,),
          Container(height: 300,width: 300,decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(recipe.image))),),
          Text("Name:${recipe.name}"),
          Text("cuisine:${recipe.cuisine}"),
          Text("ingredients:${recipe.ingredients}"),
          Text("instructions:${recipe.instructions}"),
        ],
      ),),),
    );
  }
}