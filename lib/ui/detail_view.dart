import 'package:fashionapp/model/fashion.dart';
import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  final int fashionId;

  const DetailView({Key? key, required this.fashionId}) : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    //Get the List of all fashion data from the model
    final List<Fashion> fashionList = Fashion.fashionList;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            fashionList[widget.fashionId].url,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Positioned(child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.15),
            ),
          ),),
          Positioned(
            top: 40,
              left: 20,
              child: IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.arrow_back_ios, color: Colors.white,),),),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(onPressed: null, icon: Icon(Icons.local_fire_department, color: Colors.white,),),),
          Positioned(
            top: 150,
            left: 30,
            child: Column(
              children: [
                Icon(Icons.chat, color: Colors.white,),
                Text('12', style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),)
              ],
            ),
          ),
          Positioned(
            top: 200,
            left: 30,
            child: Column(
              children: [
                Icon(Icons.favorite_border, color: Colors.white,),
                Text('637', style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),)
              ],
            ),
          ),
          Positioned(
            top: 250,
            left: 30,
            child: Column(
              children: [
                Icon(Icons.share, color: Colors.white,),
                Text('190', style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),)
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            right: 30,
            left: 30,

            child: Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fashionList[widget.fashionId].name, style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text(fashionList[widget.fashionId].description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                      height: 1.5,
                      color: Colors.white,
                    ),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
