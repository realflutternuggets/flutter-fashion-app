import 'package:fashionapp/model/fashion.dart';
import 'package:fashionapp/ui/detail_view.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    //Fetch the fashion list data from the model
    final List<Fashion> _mainFashionList = Fashion.fashionList;

    //Filter the list to contain only favorated items
    final List<Fashion> _fashionList = _mainFashionList
        .where((element) => element.isFavorite == true)
        .toList();

    bool toggleIsFavorite(bool isFavorite) {
      return !isFavorite;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: _fashionList.length == 0
            ? Center(
                child: Text('You have no Favorites'),
              )
            : ListView.builder(
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
                                    _fashionList[index].isFavorite = isFavorite;
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
    );
  }
}
