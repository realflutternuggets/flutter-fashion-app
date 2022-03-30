import 'package:fashionapp/model/fashion.dart';
import 'package:fashionapp/ui/detail_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Fetch the fashion list data from the model
    final List<Fashion> _fashionList = Fashion.fashionList;

    bool toggleIsFavorite(bool isFavorite) {
      return !isFavorite;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fashion Week',
            style: TextStyle(
              color: Color(0xffAA78E9),
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text('2022 Fashion Show'),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Explore',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                ),
              ),
              Image.asset(
                'assets/filter.png',
                height: 30,
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommended',
                style: TextStyle(
                    color: Color(0xffAA78E9), fontWeight: FontWeight.bold),
              ),
              Text('New Models'),
              Text('2022 Shows'),
            ],
          ),
          SizedBox(
            height: 32,
          ),
          Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _fashionList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailView(
                                fashionId: index,
                              )));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 12.0),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(_fashionList[index].url),
                          ),
                          Positioned(
                            bottom: 40,
                            left: 10,
                            child: Text(
                              _fashionList[index].name,
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 10,
                            child: Text(
                              _fashionList[index].location,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            right: 10,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    bool isFavorite = toggleIsFavorite(
                                        _fashionList[index].isFavorite);
                                    _fashionList[index].isFavorite =
                                        isFavorite;
                                  });
                                },
                                icon: _fashionList[index].isFavorite == true
                                    ? Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                      )),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
