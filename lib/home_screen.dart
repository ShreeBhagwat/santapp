import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:santapp/children_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  SafeArea(
        child: ListView.builder(
          itemCount: childrenData.length,
          itemBuilder: (BuildContext context, int index){

            return GestureDetector(
              child: Card(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: Container(
                          color: Colors.red,
                          child: CachedNetworkImage(imageUrl: childrenData[index]['avatar'].toString(),
                          height: 80,
                          width: 80,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        Text('${childrenData[index]['first_name']}  ${childrenData[index]['last_name']}',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),

                        ),
                        Text('${childrenData[index]['gender']}',
                        style: TextStyle(fontSize: 14, color: Colors.black, fontStyle: FontStyle.italic),
                        ),
                        Text('${childrenData[index]['age']} years',
                        style: TextStyle(fontSize: 14, color: Colors.black, fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(

                        childrenData[index]['behaviour'] == 1 ? 'images/devil.png' :
                        childrenData[index]['behaviour'] == 2 ? 'images/naughty.png':
                        childrenData[index]['behaviour'] == 3 ? 'images/cool.png':
                        childrenData[index]['behaviour'] == 4 ? 'images/angle.png' :
                            'images/angle.png',
                        height: 50,
                        width: 50,
                      ),
                    )
                  ],
                ),
              ),
              onTap: (){
                var lat = double.parse(childrenData[index]['latitude'].toString());
                var long = double.parse(childrenData[index]['longitude'].toString());

                MapsLauncher.launchCoordinates(lat, long,
                '${childrenData[index]['first_name']} ${childrenData[index]['last_name']}'.toString(),
                );

              },
            );
          },
        ),
      )
    );
  }
}
