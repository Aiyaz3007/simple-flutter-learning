import 'package:flutter/material.dart';
import 'package:weather_app_bloc/presentation/widgets/weather_home_page_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> listViewDatas = [];
  Color binColor = Color.fromRGBO(3, 59, 105, 1);
  Color binBackground = Color.fromRGBO(63, 138, 198, 1);

  void addPlace({required String place}) {
    setState(() {
      listViewDatas.add({'place': place});
    });
  }

  void deletePlace({required List<int> indexes}) {
    setState(() {
      indexes.sort((a, b) => b.compareTo(a));
      for (var index in indexes) {
        if (index >= 0 && index < listViewDatas.length) {
          listViewDatas.removeAt(index);
        }
      }
      selectedIndex.clear();
      isSelected = false;
    });
  }

  bool isSelected = false;
  List<int> selectedIndex = [];

  void _showAddPlaceDialog() {
    TextEditingController placeController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Place"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: placeController,
                decoration: InputDecoration(labelText: "Place"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                String place = placeController.text;
                if (place.isNotEmpty) {
                  addPlace(place: place);
                  Navigator.of(context).pop();
                }
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Weather",
          style: TextStyle(fontFamily: "Tangerine", fontSize: 48),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: IconButton(
                onPressed: _showAddPlaceDialog,
                icon: Icon(
                  Icons.add_circle_outline_sharp,
                  color: Colors.black,
                  size: 35,
                )),
          )
        ],
      ),
      body: Stack(
        children: [
          Image.network(
            "https://images.pexels.com/photos/1571730/pexels-photo-1571730.jpeg",
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: ListView.builder(
              itemCount: listViewDatas.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/weather_page',
                          arguments: listViewDatas[index]['place']);
                    },
                    onLongPress: () {
                      setState(() {
                        isSelected = true;
                        if (!selectedIndex.contains(index)) {
                          selectedIndex.add(index);
                        }
                      });
                    },
                    child: WeatherHomePageListView(
                      place: listViewDatas[index]['place'],
                      isSelected: selectedIndex.contains(index),
                    ),
                  ),
                );
              },
            ),
          ),
          isSelected
              ? Positioned(
                  bottom: 30,
                  left: 180,
                  child: GestureDetector(
                    onTap: () {
                      deletePlace(indexes: selectedIndex);
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: binBackground,
                      child: Icon(
                        Icons.delete,
                        size: 40,
                        color: binColor,
                      ),
                    ),
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
