import 'package:flutter/material.dart';
import 'package:habit_tracker/constants/habit_tracker_gradients.dart';

class MainTabPage extends StatelessWidget {
  const MainTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: styledLightGradient,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.emoji_emotions_sharp,
                      size: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            'Good Day',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'Andy Eckhardt',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              children: const <Widget>[
                                Icon(Icons.bed_rounded),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Text('Sleep'),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              children: const <Widget>[
                                Icon(Icons.directions_walk_rounded),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Text('Walking'),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: const <Widget>[
                              Icon(Icons.directions_bike_outlined),
                              Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Text('Cycling'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
