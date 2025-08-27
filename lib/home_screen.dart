import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restapi_recipeapp/details_page.dart';
import 'package:restapi_recipeapp/recipe_model.dart';

class RecipeApi extends StatefulWidget {
  const RecipeApi({super.key});

  @override
  State<RecipeApi> createState() => _recipeApiState();
}

class _recipeApiState extends State<RecipeApi> {
  bool _isLoading=true;
  RecipeModelApi? dataFromApi;

  _getData() async{
    try{
      String url="https://dummyjson.com/recipes";
      http.Response res=await http.get(Uri.parse(url));
      if(res.statusCode==200){
        dataFromApi=RecipeModelApi.fromJson(json.decode(res.body));
        _isLoading=false;
        setState(() {
          
        });
      }
    }catch(e){
      print(e.toString());
    }
  }

  void initState(){
    super.initState();
    _getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recipe Api"),backgroundColor: Colors.pink,),
      body:_isLoading? const Center(child: CircularProgressIndicator())
      :dataFromApi==null?Center(child: Text("Failed to Load Data"),)
      
      
      
       :GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),itemCount: dataFromApi!.recipes.length,
      itemBuilder:(context,index){
        final recipe=dataFromApi!.recipes[index];
        return Container(
          height: 250,
          
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border:Border.all(color: Colors.black,width: 2),
          color: const Color.fromARGB(255, 235, 192, 206),
          boxShadow: [BoxShadow(
            color: Colors.white,
            blurRadius: 0,
            spreadRadius: 1,
          )]),
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Detailspage(recipe: recipe)));
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(recipe.image),)),
                ),
              ),
              Text(recipe.name),
              SizedBox(height: 5,),
              Text(recipe.cuisine),
            ],
          ),
        );
      }),
    );
  }
}