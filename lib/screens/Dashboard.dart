import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'HomeScreen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'images/menus.jpg',
                            height: 24.0,
                            width: 24.0,
                          )),
                    ),
                    Text('Dashboard',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(Icons.search),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(child: Icon(Icons.person)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text('Featured Articles',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  height: 230,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 210,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              children: [
//                                Icon(
//                                  Icons.person,
//                                  size: 100,
//                                ),

                                Spacer(),
                                Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            'Just text lorem and us with noise is good '),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text('READ NOW'),
                                          SizedBox(
                                            width: 5.0,
                                          ),
                                          CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 15.0,
                                              child: Center(
                                                  child: Icon(Icons.star))),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.0,
                                      ),
                                    ],
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 80.0,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.white,
                                          // ignore: list_element_type_not_assignable
                                          Colors.blueAccent,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/girl.jpg'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(15)),
                        );
                      }),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text('Featured Articles',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  height: 160,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 6 / 9,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          //alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 15.0,
                                      child: Center(child: Icon(Icons.star))),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white,
                                  // ignore: list_element_type_not_assignable
                                  Colors.blueAccent,
                                ],
                              ),
                              image: DecorationImage(
                                  image: AssetImage('images/yoga.png'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(15)),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
