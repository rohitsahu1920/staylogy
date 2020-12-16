import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:staylogy/screens/Test.dart';
import 'package:staylogy/screens/my_drawer.dart';
import 'package:staylogy/screens/product_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'screens/appBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool checkedValue = true;

  AnimationController _ColorAnimationController;
  AnimationController _TextAnimationController;
  Animation _colorTween, _iconColorTween;
  Animation<Offset> _transTween;

  @override
  void initState() {
    _ColorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Color(0xFF3F4575))
        .animate(_ColorAnimationController);
    _iconColorTween = ColorTween(begin: Colors.grey, end: Colors.white)
        .animate(_ColorAnimationController);


    _TextAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));

    _transTween = Tween(begin: Offset(-10, 40), end: Offset(-10, 0))
        .animate(_TextAnimationController);

    super.initState();
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _ColorAnimationController.animateTo(scrollInfo.metrics.pixels / 10);

      _TextAnimationController.animateTo(
          (scrollInfo.metrics.pixels - 10) / 50);
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: NotificationListener<ScrollNotification>(
        onNotification: _scrollListener,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 130,),
                    Container(
                      padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                      child: Text("Staylogy", textAlign: TextAlign.center ,style: TextStyle(color: Colors.amber, fontSize: 25,),),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                      child: Text("A New-Age Home Renting Solution", textAlign: TextAlign.center ,style: TextStyle(color: Colors.amber, fontSize: 25, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Text("Bringing to India the concept of co-living spaces, Staylogy is where peace meets comfort; luxury meets modernity; where you upgrade your service apartments and hostels with co-living spaces.", textAlign: TextAlign.center , style: TextStyle(color: Colors.white, fontSize:15),),
                    ),
                    SizedBox(height: 20,),
                    Card(
                      margin: EdgeInsets.zero,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset(
                            'assets/images/people.jpg',
                            fit: BoxFit.fitHeight,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 40),
                            child: Card(
                              color: Colors.black.withOpacity(0.7),
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                                    child: Image.asset('assets/images/price-tag.png', height: 35, width: 35, color: Colors.white,),
                                  ),
                                  SizedBox(width: 10,),
                                  Column(
                                    children: [
                                      Container(
                                        width: 250,
                                        child: Text(
                                          "Upto 50% OFF on first month rent",
                                          style: TextStyle(color: Colors.pinkAccent, fontSize: 15),
                                          textAlign: TextAlign.start, // has impact
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Container(
                                        width: 250,
                                        child: Text(
                                          "Valid till 30th Dec",
                                          style: TextStyle(color: Colors.white, fontSize: 13),
                                          textAlign: TextAlign.start, // has impact
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Card(
                              elevation: 5,
                              margin: EdgeInsets.zero,
                              color: Colors.white,
                              child: ExpansionTile(
                                leading: Image.asset('assets/images/coronavirus.png', height: 40, width: 40, color: Colors.black,),
                                title: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text('Stalogy is safe from Covide. Learn More form about our best-in-class measures. #CounterCovide Plan'),
                                ),
                                children: [
                                  ListTile(
                                    leading: Image.asset('assets/images/temp.png', alignment: Alignment.center ,height: 25, width: 25, color: Colors.black,),
                                    title: Text('Sanitization booth at the entrance of all the premises'),
                                  ),
                                  ListTile(
                                    leading: Image.asset('assets/images/hand-washing.png', alignment: Alignment.center ,height: 25, width: 25, color: Colors.black,),
                                    title: Text('Regular temperature check for all guests, visitors, and team members using Infrared thermometers'),
                                  ),
                                  ListTile(
                                    leading: Image.asset('assets/images/antibacterial.png', alignment: Alignment.center ,height: 25, width: 25, color: Colors.black,),
                                    title: Text('Dispensable sanitizer across the premises which are clinical approved'),
                                  ),
                                  ListTile(
                                    leading: Image.asset('assets/images/temp.png', alignment: Alignment.center ,height: 25, width: 25, color: Colors.black,),
                                    title: Text('Dedicated delivery box at the entrance to encourage contact-less delivery for all residents'),
                                  ),
                                  ListTile(
                                    leading: Image.asset('assets/images/hand-washing.png', alignment: Alignment.center ,height: 25, width: 25, color: Colors.black,),
                                    title: Text('Disinfection of all exposed surfaced, floor, furniture, tabletops, counters, elevator button, doorknobs/handles and equipped with industry grades cleaners regularly'),
                                  ),
                                  ListTile(
                                    leading: Image.asset('assets/images/antibacterial.png', alignment: Alignment.center ,height: 25, width: 25, color: Colors.black,),
                                    title: Text('Through Sanitization of rooms twice every week to ensure perfect hygienic condition for our residency'),
                                  ),
                                  ListTile(
                                    leading: Image.asset('assets/images/temp.png', alignment: Alignment.center ,height: 25, width: 25, color: Colors.black,),
                                    title: Text('Regular spot check on staff for maintaining safety standard'),
                                  ),
                                  ListTile(
                                    leading: Image.asset('assets/images/hand-washing.png', alignment: Alignment.center ,height: 25, width: 25, color: Colors.black,),
                                    title: Text('Usage of clinical approved protective masks for staff during thir shifts'),
                                  ),
                                  ListTile(
                                    leading: Image.asset('assets/images/antibacterial.png', alignment: Alignment.center ,height: 25, width: 25, color: Colors.black,),
                                    title: Text('Covid declaration takes from all the residents at Move-in'),
                                  ),
                                  SizedBox(height: 20,)
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(15.0,0,0,0),
                                        child: Text(
                                            "Key USPs", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
                                        ),
                                      ),

                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints.expand(
                                        height: 250,
                                        //width: 500
                                    ),
                                    child: imageSlidertwo(context),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.amber,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20,0,0,0),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(15.0,0,0,0),
                                  child: Text(
                                      "A Unique", style: TextStyle(color: Colors.black, fontSize: 20,)
                                  ),
                                ),

                              ),
                            ),
                            SizedBox(height: 5,),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(15.0,0,0,0),
                                  child: Text(
                                      "Co-Living Experience", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
                                  ),
                                ),

                              ),
                            ),
                            SizedBox(height: 20,),
                            // SizedBox(
                            //   height: 310,
                            //   child: ListView(
                            //     shrinkWrap: true,
                            //     physics: ClampingScrollPhysics(),
                            //     // This next line does the trick.
                            //     scrollDirection: Axis.horizontal,
                            //     children: <Widget>[
                            //       // Card(
                            //       //   child: Container(
                            //       //     width: 170.0,
                            //       //     decoration: BoxDecoration(
                            //       //       image: DecorationImage(
                            //       //         image: AssetImage("assets/banner_600x400.jpg"),
                            //       //         fit: BoxFit.fitWidth,
                            //       //         alignment: Alignment.topCenter,
                            //       //       ),
                            //       //     ),
                            //       //     child: Text("Experience on overallocation of luxury & comfort like never befor in the heart of the city"),
                            //       //   ),
                            //       // ),
                            //       Container(
                            //         width: 340.0,
                            //         child: Card(
                            //           semanticContainer: true,
                            //           clipBehavior: Clip.antiAliasWithSaveLayer,
                            //           child: Image.asset(
                            //             'assets/images/k.jpg',
                            //             fit: BoxFit.fill,
                            //           ),
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(25.0),
                            //           ),
                            //           elevation: 5,
                            //           margin: EdgeInsets.all(10),
                            //         ),
                            //       ),
                            //       Container(
                            //         width: 340.0,
                            //         child: Card(
                            //           semanticContainer: true,
                            //           clipBehavior: Clip.antiAliasWithSaveLayer,
                            //           child: Image.asset(
                            //             'assets/images/bed.jpg',
                            //             fit: BoxFit.fill,
                            //           ),
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(25.0),
                            //           ),
                            //           elevation: 5,
                            //           margin: EdgeInsets.all(10),
                            //         ),
                            //       ),
                            //       Container(
                            //         width: 340.0,
                            //         child: Card(
                            //           semanticContainer: true,
                            //           clipBehavior: Clip.antiAliasWithSaveLayer,
                            //           child: Image.asset(
                            //             'assets/images/k.jpg',
                            //             fit: BoxFit.fill,
                            //           ),
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(25.0),
                            //           ),
                            //           elevation: 5,
                            //           margin: EdgeInsets.all(10),
                            //         ),
                            //       ),
                            //       Container(
                            //         width: 340.0,
                            //         child: Card(
                            //           semanticContainer: true,
                            //           clipBehavior: Clip.antiAliasWithSaveLayer,
                            //           child: Image.asset(
                            //             'assets/images/bed.jpg',
                            //             fit: BoxFit.fill,
                            //           ),
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(25.0),
                            //           ),
                            //           elevation: 5,
                            //           margin: EdgeInsets.all(10),
                            //         ),
                            //       ),
                            //       Container(
                            //         width: 340.0,
                            //         child: Card(
                            //           semanticContainer: true,
                            //           clipBehavior: Clip.antiAliasWithSaveLayer,
                            //           child: Image.asset(
                            //             'assets/images/k.jpg',
                            //             fit: BoxFit.fill,
                            //           ),
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(25.0),
                            //           ),
                            //           elevation: 5,
                            //           margin: EdgeInsets.all(10),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(height: 20,),
                            // Container(
                            //   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            //   child: Align(
                            //     alignment: Alignment.centerLeft,
                            //     child: Container(
                            //       child: Text(
                            //           "Experience an Amalganation of luxury and comfort like never befor in the heart of the city.", style: TextStyle(color: Colors.black, fontSize: 15,)
                            //       ),
                            //
                            //     ),
                            //   ),
                            // ),
                            Container(
                              constraints: BoxConstraints.expand(
                                  height: 270
                              ),
                              child: imageSliderFive(context),
                            ),
                            SizedBox(height: 10,),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: FlatButton(
                                  color: Colors.pink,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.red)
                                  ),
                                  onPressed: (){},
                                  child: Text('View Property', style: TextStyle(color:  Colors.white, fontWeight: FontWeight.bold),),
                                ),

                              ),
                            ),
                            SizedBox(height: 30,),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Container(
                        color: Colors.white38,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Text(
                                    "Featured", style: TextStyle(color: Colors.black, fontSize: 25,)
                                ),

                              ),
                            ),
                            SizedBox(height: 5,),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Text(
                                    "Properties", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)
                                ),

                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              constraints: BoxConstraints.expand(
                                  height: 380
                              ),
                              child: imageSlider(context),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/bubble_b.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          color: Colors.white38,
                          padding: EdgeInsets.fromLTRB(20,0,20,0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                        "What makes this a perfect", style: TextStyle(color: Colors.black, fontSize: 20,)
                                    ),
                                  ),

                                ),
                              ),
                              SizedBox(height: 5,),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                        "home away from home", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
                                    ),
                                  ),

                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                constraints: BoxConstraints.expand(
                                    height: 500
                                ),
                                child: imageSliderthree(context),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                    "Top-Notch Amenities &", style: TextStyle(color: Colors.black, fontSize: 20,)
                                ),
                              ),

                            ),
                          ),
                          SizedBox(height: 5,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                    "Services At Your Disposal", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
                                ),
                              ),

                            ),
                          ),

                          Container(
                            constraints: BoxConstraints.expand(
                              height: 250,
                              //width: 500
                            ),
                            child: imageSliderSix(context),
                          ),

                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Container(
                          //         width: 340.0,
                          //         child: Column(
                          //           children: [
                          //             Card(
                          //               semanticContainer: true,
                          //               clipBehavior: Clip.antiAliasWithSaveLayer,
                          //               child: Padding(
                          //                 padding: EdgeInsets.all(20),
                          //                 child: Image.asset(
                          //                   'assets/images/protection.png',
                          //                   fit: BoxFit.fitHeight,
                          //                 ),
                          //               ),
                          //               shape: RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(50.0),
                          //               ),
                          //               elevation: 5,
                          //               margin: EdgeInsets.all(10),
                          //             ),
                          //             SizedBox(height: 10,),
                          //             Align(
                          //               alignment: Alignment.centerLeft,
                          //               child: Container(
                          //                 child: Padding(
                          //                   padding: const EdgeInsets.fromLTRB(12,0,0,0),
                          //                   child: Text(
                          //                       "Lorem lpsum docor sit", textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 13,)
                          //                   ),
                          //                 ),
                          //
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Container(
                          //         width: 340.0,
                          //         child: Column(
                          //           children: [
                          //             Card(
                          //               semanticContainer: true,
                          //               clipBehavior: Clip.antiAliasWithSaveLayer,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(20.0),
                          //                 child: Image.asset(
                          //                   "assets/images/armchair.png",
                          //                   fit: BoxFit.fitHeight,
                          //                 ),
                          //               ),
                          //               shape: RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(50.0),
                          //               ),
                          //               elevation: 5,
                          //               margin: EdgeInsets.all(10),
                          //             ),
                          //             SizedBox(height: 10,),
                          //             Align(
                          //               alignment: Alignment.centerLeft,
                          //               child: Container(
                          //                 child: Padding(
                          //                   padding: const EdgeInsets.fromLTRB(12,0,0,0),
                          //                   child: Text(
                          //                       "Lorem lpsum docor sit",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13,)
                          //                   ),
                          //                 ),
                          //
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Container(
                          //         width: 340.0,
                          //         child: Column(
                          //           children: [
                          //             Card(
                          //               semanticContainer: true,
                          //               clipBehavior: Clip.antiAliasWithSaveLayer,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(20.0),
                          //                 child: Image.asset(
                          //                   "assets/images/home-delivery.png",
                          //                   fit: BoxFit.fitHeight,
                          //                 ),
                          //               ),
                          //               shape: RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(50.0),
                          //               ),
                          //               elevation: 5,
                          //               margin: EdgeInsets.all(10),
                          //             ),
                          //             SizedBox(height: 10,),
                          //             Align(
                          //               alignment: Alignment.centerLeft,
                          //               child: Container(
                          //                 child: Padding(
                          //                   padding: const EdgeInsets.fromLTRB(12,0,0,0),
                          //                   child: Text(
                          //                       "Lorem lpsum docor sit",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13,)
                          //                   ),
                          //                 ),
                          //
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // ),
                          // SizedBox(height: 20,),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Container(
                          //         width: 340.0,
                          //         child: Column(
                          //           children: [
                          //             Card(
                          //               semanticContainer: true,
                          //               clipBehavior: Clip.antiAliasWithSaveLayer,
                          //               child: Padding(
                          //                 padding: EdgeInsets.all(20),
                          //                 child: Image.asset(
                          //                   'assets/images/protection.png',
                          //                   fit: BoxFit.fitHeight,
                          //                 ),
                          //               ),
                          //               shape: RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(50.0),
                          //               ),
                          //               elevation: 5,
                          //               margin: EdgeInsets.all(10),
                          //             ),
                          //             SizedBox(height: 10,),
                          //             Align(
                          //               alignment: Alignment.centerLeft,
                          //               child: Container(
                          //                 child: Padding(
                          //                   padding: const EdgeInsets.fromLTRB(12,0,0,0),
                          //                   child: Text(
                          //                       "Lorem lpsum docor sit", textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 13,)
                          //                   ),
                          //                 ),
                          //
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Container(
                          //         width: 340.0,
                          //         child: Column(
                          //           children: [
                          //             Card(
                          //               semanticContainer: true,
                          //               clipBehavior: Clip.antiAliasWithSaveLayer,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(20.0),
                          //                 child: Image.asset(
                          //                   "assets/images/armchair.png",
                          //                   fit: BoxFit.fitHeight,
                          //                 ),
                          //               ),
                          //               shape: RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(50.0),
                          //               ),
                          //               elevation: 5,
                          //               margin: EdgeInsets.all(10),
                          //             ),
                          //             SizedBox(height: 10,),
                          //             Align(
                          //               alignment: Alignment.centerLeft,
                          //               child: Container(
                          //                 child: Padding(
                          //                   padding: const EdgeInsets.fromLTRB(12,0,0,0),
                          //                   child: Text(
                          //                       "Lorem lpsum docor sit",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13,)
                          //                   ),
                          //                 ),
                          //
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Container(
                          //         width: 340.0,
                          //         child: Column(
                          //           children: [
                          //             Card(
                          //               semanticContainer: true,
                          //               clipBehavior: Clip.antiAliasWithSaveLayer,
                          //               child: Padding(
                          //                 padding: const EdgeInsets.all(20.0),
                          //                 child: Image.asset(
                          //                   "assets/images/home-delivery.png",
                          //                   fit: BoxFit.fitHeight,
                          //                 ),
                          //               ),
                          //               shape: RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.circular(50.0),
                          //               ),
                          //               elevation: 5,
                          //               margin: EdgeInsets.all(10),
                          //             ),
                          //             SizedBox(height: 10,),
                          //             Align(
                          //               alignment: Alignment.centerLeft,
                          //               child: Container(
                          //                 child: Padding(
                          //                   padding: const EdgeInsets.fromLTRB(12,0,0,0),
                          //                   child: Text(
                          //                       "Lorem lpsum docor sit",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13,)
                          //                   ),
                          //                 ),
                          //
                          //               ),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     )
                          //   ],
                          // ),
                          SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: FlatButton(
                                color: Colors.pink,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)
                                ),
                                onPressed: (){},
                                child: Text('View Property', style: TextStyle(color:  Colors.white, fontWeight: FontWeight.bold),),
                              ),

                            ),
                          ),
                          SizedBox(height: 20,),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              child: Text(
                                  "36 people just schedule a visit", style: TextStyle(color: Colors.amber, fontSize: 20,)
                              ),

                            ),
                          ),
                          SizedBox(height: 5,),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              child: Text(
                                  "What are you waiting for?", style: TextStyle(color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold)
                              ),

                            ),
                          ),
                          SizedBox(height: 30,),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                    "First of it's kind", style: TextStyle(color: Colors.black, fontSize: 20,)
                                ),
                              ),

                            ),
                          ),
                          SizedBox(height: 5,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                    "Co-Living Experience", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
                                ),
                              ),

                            ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            constraints: BoxConstraints.expand(
                                height: 320
                            ),
                            child: imageSliderfour(context),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                      "Enquire Now", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
                                  ),
                                ),

                              ),
                            ),
                            SizedBox(height: 10,),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                      "Just share your details & we shall get back to you shortly", style: TextStyle(color: Colors.black, fontSize: 15,)
                                  ),
                                ),

                              ),
                            ),
                            SizedBox(height: 20,),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                    color: Colors.white38,
                                    width: 1,
                                  )
                              ),
                              color: Colors.white38,
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  TextFormField(
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value){
                                      if(value.isEmpty){
                                        return "Please enter your password";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 0),
                                      hintText: "First Name",
                                      //hintStyle: TextStyle(color: Colors.black),

                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                    color: Colors.white38,
                                    width: 1,
                                  )
                              ),
                              color: Colors.white38,
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  TextFormField(
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value){
                                      if(value.isEmpty){
                                        return "Please enter your password";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 0),
                                      hintText: "Mobile Number",
                                      //hintStyle: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                    color: Colors.white38,
                                    width: 1,
                                  )
                              ),
                              color: Colors.white38,
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  TextFormField(
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.black),
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value){
                                      if(value.isEmpty){
                                        return "Please enter your password";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(top: 10,bottom: 10,left: 15,right: 0),
                                      hintText: "Email Id",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Center(
                                child: Container(
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Checkbox(
                                        value: checkedValue,
                                        onChanged: (newValue) {
                                          setState(() {
                                            checkedValue = newValue;
                                          });
                                        },
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          "I agree with the T&C",
                                          textAlign: TextAlign.start, // has impact
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Center(
                                child: Container(
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: BorderSide(color: Colors.red)
                                        ),
                                        color: Colors.pink,
                                        child: Text("Submit", style: TextStyle(color: Colors.white),),
                                        onPressed: (){
                                        },
                                      ),
                                      Spacer(flex: 2),
                                      Container(
                                        height: 70,
                                        width: 70,
                                        child: Card(
                                          semanticContainer: true,
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Image.asset(
                                              'assets/images/love.png',
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50.0),
                                          ),
                                          elevation: 5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   color: Colors.white,
                    //   child: Container(
                    //     padding: EdgeInsets.fromLTRB(20,0,20,0),
                    //     child: Column(
                    //       children: [
                    //         Row(
                    //           children: [
                    //             Expanded(
                    //               child: Card(
                    //                 elevation: 5,
                    //                 shape: RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(30.0),
                    //                     side: BorderSide(
                    //                       color: Colors.white,
                    //                       width: 1,
                    //                     )
                    //                 ),
                    //                 color: Colors.white,
                    //                 clipBehavior: Clip.antiAlias,
                    //                 child: InkWell(
                    //                   onTap: (){
                    //                     launch('mailto:info@sparemtpl.com');
                    //                   },
                    //                   child: ListTile(
                    //                     leading: Row(
                    //                       mainAxisSize: MainAxisSize.min,
                    //                       children: [
                    //                         Padding(
                    //                           padding: EdgeInsets.fromLTRB(10,10,0,10),
                    //                           child: Image.asset('assets/images/booking.png'),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                     title: const Text("Book Now", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             Expanded(
                    //               child: Card(
                    //                 elevation: 5,
                    //                 shape: RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(30.0),
                    //                     side: BorderSide(
                    //                       color: Colors.white,
                    //                       width: 1,
                    //                     )
                    //                 ),
                    //                 color: Colors.white,
                    //                 clipBehavior: Clip.antiAlias,
                    //                 child: InkWell(
                    //                   onTap: (){
                    //                     launch('mailto:info@sparemtpl.com');
                    //                   },
                    //                   child: ListTile(
                    //                     leading: Row(
                    //                       mainAxisSize: MainAxisSize.min,
                    //                       children: [
                    //                         Padding(
                    //                           padding: EdgeInsets.fromLTRB(10,10,0,10),
                    //                           child: Image.asset('assets/images/calendar.png'),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                     title: const Text("Schedule Visit", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         SizedBox(height: 30,)
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                                  crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                                  children: [
                                    Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(8,0,8,0),
                                            child: Text(
                                                "Home", style: TextStyle(color: Colors.white, fontSize: 13,)
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(8,0,8,0),
                                            child: Text(
                                                "|", style: TextStyle(color: Colors.white, fontSize: 13,)
                                            ),
                                          ),

                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(8,0,8,0),
                                            child: Text(
                                                "Terms & Conditions", style: TextStyle(color: Colors.white, fontSize: 13,)
                                            ),
                                          ),

                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(8,0,8,0),
                                            child: Text(
                                                "|", style: TextStyle(color: Colors.white, fontSize: 13,)
                                            ),
                                          ),

                                        ),
                                      ),
                                    ),
                                    Container(

                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(8,0,8,0),
                                            child: Text(
                                                "Privacy Policy", style: TextStyle(color: Colors.white, fontSize: 13,)
                                            ),
                                          ),

                                        ),
                                      ),
                                    )

                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Text(
                              "© Copyright Stalogy 2020. All Rights Reserved", style: TextStyle(color: Colors.black38, fontSize: 13,)
                          ),

                        ),
                      ),
                    ),
                    SizedBox(height: 80,)
                  ],
                ),
              ),
              Container(
                height:100,
                child: AnimatedBuilder(
                  animation: _ColorAnimationController,
                  builder: (context, child) => AppBar(
                    backgroundColor: _colorTween.value,
                    elevation: 0,
                    titleSpacing: 0.0,
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(20,20,0,10),
                      child: Image.asset('assets/images/logo.png', width: 100, height: 50,),
                    ),
                    iconTheme: IconThemeData(
                      color: _iconColorTween.value,
                    ),
                    actions: [
                      Padding(padding: EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => product()));
                          },
                          child: Text('Enquire Now',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),),
                      IconButton(
                          icon: Icon(Icons.menu, color: Colors.white,), onPressed:() {
                        scaffoldKey.currentState.openEndDrawer();
                      }
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20,10,10,10),
                  child: SizedBox(
                    height: 65,
                    width: 170,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          )
                      ),
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: (){
                          launch('mailto:info@sparemtpl.com');
                        },
                        child: ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(10,10,0,10),
                                child: Image.asset('assets/images/booking.png'),
                              ),
                            ],
                          ),
                          title: const Text("Book Now", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,20,10),
                  child: SizedBox(
                    height: 65,
                    width: 170,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          )
                      ),
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: (){
                          launch('mailto:info@sparemtpl.com');
                        },
                        child: ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(10,10,0,10),
                                child: Image.asset('assets/images/calendar.png'),
                              ),
                            ],
                          ),
                          title: const Text("Schedule Visit", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawer: SafeArea(
        child: MyDrawer(),
      ),
    );
  }
}

final List imageListfour = [
  "assets/images/wone_2_200x200.jpg",
  "assets/images/wthree_2_200x200.jpg",
  "assets/images/wtwo_2_200x200.jpg",
  "assets/images/wone_2_200x200.jpg",
];

final List imageListthree = [
  "assets/images/k_600x400.jpg",
  "assets/images/f_600x400.jpg",
  "assets/images/k.jpg",
  "assets/images/bed.jpg"
];

final List imageListtwo = [
  "assets/images/protection.png",
  "assets/images/armchair.png",
  "assets/images/home-delivery.png",
  "assets/images/protection.png",
  "assets/images/armchair.png",
  "assets/images/home-delivery.png"
];

final List imgList = [
  "assets/images/k.jpg",
  "assets/images/bed.jpg",
  "assets/images/k.jpg",
  "assets/images/bed.jpg",
];

final List imgListFive = [
  "assets/images/k.jpg",
  "assets/images/bed.jpg",
  "assets/images/k_600x400.jpg"
];

final List textListFive = [
  "Make new friends & meet like-minded people",
  "Be a part of fun, enriching events and get-togethers",
  "Live, eat, play together but also get your privacy"
];

final List imgListSix = [
  "assets/images/house-cleaning.png",
  "assets/images/bike-parking.png",
  "assets/images/casino-cctv.png",
  "assets/images/cinema-screen.png",
  "assets/images/dining-table.png",
  "assets/images/handle.png",
  "assets/images/security-guard.png",
  "assets/images/tools.png",
  "assets/images/waiting-room.png"
];

final List textListSix = [
  "House keeping",
  "Two Wheeler Parking",
  "CCTV",
  "Cinema Room",
  "Lawn",
  "Access-Control",
  "Security",
  "Repair",
  "Lounge"
];

imageSlider(context){
  return new Swiper(
    autoplay: false,
    duration: 2000,
    itemBuilder: (BuildContext context, int index){
      return Row(
        children: [
          Expanded(
            child: Container(
              width: 340.0,
              child: Column(
                children: [
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      imgList[index],
                      fit: BoxFit.fitHeight,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,0,0,0),
                        child: Text(
                            "Properties", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 3,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,0,0,0),
                        child: Text(
                          "Location", style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,0,0,0),
                        child: Text(
                            "3 BHK Apartment", style: TextStyle(color: Colors.black45, fontSize: 15, fontWeight: FontWeight.bold)
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,0,0,0),
                        child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adip", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12,0,0,0),
                        child: Text(
                            "₹ 45,000", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
                        ),
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ),
          // Expanded(
          //   child: Container(
          //     width: 340.0,
          //     child: Column(
          //       children: [
          //         Card(
          //           semanticContainer: true,
          //           clipBehavior: Clip.antiAliasWithSaveLayer,
          //           child: Image.asset(
          //             imgList[index + 1],
          //             fit: BoxFit.fitHeight,
          //           ),
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(25.0),
          //           ),
          //           elevation: 5,
          //           margin: EdgeInsets.all(10),
          //         ),
          //         SizedBox(height: 10,),
          //         Align(
          //           alignment: Alignment.centerLeft,
          //           child: Container(
          //             child: Padding(
          //               padding: const EdgeInsets.fromLTRB(12,0,0,0),
          //               child: Text(
          //                   "Properties", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
          //               ),
          //             ),
          //
          //           ),
          //         ),
          //         SizedBox(height: 3,),
          //         Align(
          //           alignment: Alignment.centerLeft,
          //           child: Container(
          //             child: Padding(
          //               padding: const EdgeInsets.fromLTRB(12,0,0,0),
          //               child: Text(
          //                   "Location", style: TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          //               ),
          //             ),
          //
          //           ),
          //         ),
          //         SizedBox(height: 10,),
          //         Align(
          //           alignment: Alignment.centerLeft,
          //           child: Container(
          //             child: Padding(
          //               padding: const EdgeInsets.fromLTRB(12,0,0,0),
          //               child: Text(
          //                   "3 BHK Apartment", style: TextStyle(color: Colors.black45, fontSize: 13, fontWeight: FontWeight.bold)
          //               ),
          //             ),
          //
          //           ),
          //         ),
          //         SizedBox(height: 10,),
          //         Align(
          //           alignment: Alignment.centerLeft,
          //           child: Container(
          //             child: Padding(
          //               padding: const EdgeInsets.fromLTRB(12,0,0,0),
          //               child: Text(
          //                   "Lorem ipsum dolor sit amet, consectetur adip", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold)
          //               ),
          //             ),
          //
          //           ),
          //         ),
          //         SizedBox(height: 10,),
          //         Align(
          //           alignment: Alignment.centerLeft,
          //           child: Container(
          //             child: Padding(
          //               padding: const EdgeInsets.fromLTRB(12,0,0,0),
          //               child: Text(
          //                   "₹ 45,000", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
          //               ),
          //             ),
          //
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      );
    },
    itemCount: 2,
    viewportFraction: 1.0,
    scale: 0.5,
    //pagination: new SwiperPagination(),
    control: new SwiperControl(color: Colors.black38, padding: EdgeInsets.fromLTRB(0, 0, 0, 150),),
  );
  
}

imageSlidertwo(context){
  return new Swiper(
    autoplay: false,
    duration: 2000,
    itemBuilder: (BuildContext context, int index){
      return GestureDetector(
        onTap: (){

        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 200,
                width: 150,
                child: Column(
                  children: [
                    Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Image.asset(
                          imageListtwo[index],
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(13,0,0,0),
                          child: Text(
                              "Complete Safety Measures", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13,)
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   child: Container(
            //     width: 250.0,
            //     child: Column(
            //       children: [
            //         Card(
            //           semanticContainer: true,
            //           clipBehavior: Clip.antiAliasWithSaveLayer,
            //           child: Padding(
            //             padding: const EdgeInsets.all(20.0),
            //             child: Image.asset(
            //               imageListtwo[index + 1],
            //               fit: BoxFit.fitHeight,
            //             ),
            //           ),
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(50.0),
            //           ),
            //           elevation: 5,
            //           margin: EdgeInsets.all(10),
            //         ),
            //         SizedBox(height: 10,),
            //         Align(
            //           alignment: Alignment.centerLeft,
            //           child: Container(
            //             child: Padding(
            //               padding: const EdgeInsets.fromLTRB(15,0,0,0),
            //               child: Text(
            //                   "Customised Living experience",textAlign: TextAlign.center ,style: TextStyle(color: Colors.black, fontSize: 13,)
            //               ),
            //             ),
            //
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),



            // Expanded(
            //   child: Container(
            //     width: 340.0,
            //     child: Column(
            //       children: [
            //         Card(
            //           semanticContainer: true,
            //           clipBehavior: Clip.antiAliasWithSaveLayer,
            //           child: Padding(
            //             padding: const EdgeInsets.all(20.0),
            //             child: Image.asset(
            //               imageListtwo[index + 2],
            //               fit: BoxFit.fitHeight,
            //             ),
            //           ),
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(50.0),
            //           ),
            //           elevation: 5,
            //           margin: EdgeInsets.all(10),
            //         ),
            //         SizedBox(height: 10,),
            //         Align(
            //           alignment: Alignment.centerLeft,
            //           child: Container(
            //             child: Padding(
            //               padding: const EdgeInsets.fromLTRB(15,0,0,0),
            //               child: Text(
            //                   "Door step services", textAlign: TextAlign.center ,style: TextStyle(color: Colors.black, fontSize: 13,)
            //               ),
            //             ),
            //
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      );
    },

    itemCount: 6,
    viewportFraction: 0.35,
    scale: 0.9,
    // itemWidth: 150,
    // itemHeight: 150,
    //layout: SwiperLayout.DEFAULT,
    pagination: new SwiperPagination(builder: new DotSwiperPaginationBuilder(color: Colors.black26, activeColor: Color(0xffED6D6D))),
    //control: new SwiperControl(),
  );
}

imageSliderthree(context){
  return new Swiper(
    autoplay: false,
    duration: 2000,
    itemBuilder: (BuildContext context, int index){
      return Container(
        width: 340.0,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 220,
                width: 270,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    imageListthree[index],
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 220,
                width: 270,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    imageListthree[index],
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5,
                ),
              ),
            ),
          ],
        ),
      );
    },
    itemCount: 4,
    viewportFraction: 1.0,
    scale: 0.5,
    pagination: new SwiperPagination(builder: new DotSwiperPaginationBuilder(color: Colors.black26, activeColor: Color(0xffED6D6D))),
    //control: new SwiperControl(),
  );

}

imageSliderfour(context){
  return new Swiper(
    autoplay: false,
    duration: 2000,
    itemBuilder: (BuildContext context, int index){
      return Container(
        width: 350.0,
        child: Column(
          children: [
            Row(
              children: [
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    imageListfour[index],
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  elevation: 5,
                ),
                SizedBox(width: 10,),
                Column(
                  children: [
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 130,
                        child: Text(
                          "Shraddha Singh",
                          textAlign: TextAlign.start, // ha
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),// s impact
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 130,
                        child: Text(
                          "Designation",
                          textAlign: TextAlign.start, // has impact
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0,15,0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                      "Friendly and professional customer service specialist with extensive experience resolving escalated customer complaints and issues.", style: TextStyle(color: Colors.black, fontSize: 15,)
                  ),

                ),
              ),
            ),
          ],
        ),
      );
    },
    itemCount: 4,
    viewportFraction: 1.0,
    scale: 0.5,
    pagination: new SwiperPagination(),
    //control: new SwiperControl(),
  );

}

imageSliderFive(context){
  return new Swiper(
    autoplay: false,
    duration: 2000,
    itemBuilder: (BuildContext context, int index){
      return Row(
        children: [
          Expanded(
            child: Container(
              width: 340.0,
              child: Column(
                children: [
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(
                      imgListFive[index],
                      fit: BoxFit.fitHeight,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15,0,15,0),
                        child: Text(
                            textListFive[index], textAlign: TextAlign.center , style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold)
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 3,),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Container(
                  //     child: Padding(
                  //       padding: const EdgeInsets.fromLTRB(12,0,0,0),
                  //       child: Text(
                  //         "Location", style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  //       ),
                  //     ),
                  //
                  //   ),
                  // ),
                  // SizedBox(height: 10,),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Container(
                  //     child: Padding(
                  //       padding: const EdgeInsets.fromLTRB(12,0,0,0),
                  //       child: Text(
                  //           "3 BHK Apartment", style: TextStyle(color: Colors.black45, fontSize: 15, fontWeight: FontWeight.bold)
                  //       ),
                  //     ),
                  //
                  //   ),
                  // ),
                  // SizedBox(height: 10,),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Container(
                  //     child: Padding(
                  //       padding: const EdgeInsets.fromLTRB(12,0,0,0),
                  //       child: Text(
                  //           "Lorem ipsum dolor sit amet, consectetur adip", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
                  //       ),
                  //     ),
                  //
                  //   ),
                  // ),
                  // SizedBox(height: 10,),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Container(
                  //     child: Padding(
                  //       padding: const EdgeInsets.fromLTRB(12,0,0,0),
                  //       child: Text(
                  //           "₹ 45,000", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
                  //       ),
                  //     ),
                  //
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          // Expanded(
          //   child: Container(
          //     width: 340.0,
          //     child: Column(
          //       children: [
          //         Card(
          //           semanticContainer: true,
          //           clipBehavior: Clip.antiAliasWithSaveLayer,
          //           child: Image.asset(
          //             imgList[index + 1],
          //             fit: BoxFit.fitHeight,
          //           ),
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(25.0),
          //           ),
          //           elevation: 5,
          //           margin: EdgeInsets.all(10),
          //         ),
          //         SizedBox(height: 10,),
          //         Align(
          //           alignment: Alignment.centerLeft,
          //           child: Container(
          //             child: Padding(
          //               padding: const EdgeInsets.fromLTRB(12,0,0,0),
          //               child: Text(
          //                   "Properties", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
          //               ),
          //             ),
          //
          //           ),
          //         ),
          //         SizedBox(height: 3,),
          //         Align(
          //           alignment: Alignment.centerLeft,
          //           child: Container(
          //             child: Padding(
          //               padding: const EdgeInsets.fromLTRB(12,0,0,0),
          //               child: Text(
          //                   "Location", style: TextStyle(color: Colors.black54, fontSize: 13, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
          //               ),
          //             ),
          //
          //           ),
          //         ),
          //         SizedBox(height: 10,),
          //         Align(
          //           alignment: Alignment.centerLeft,
          //           child: Container(
          //             child: Padding(
          //               padding: const EdgeInsets.fromLTRB(12,0,0,0),
          //               child: Text(
          //                   "3 BHK Apartment", style: TextStyle(color: Colors.black45, fontSize: 13, fontWeight: FontWeight.bold)
          //               ),
          //             ),
          //
          //           ),
          //         ),
          //         SizedBox(height: 10,),
          //         Align(
          //           alignment: Alignment.centerLeft,
          //           child: Container(
          //             child: Padding(
          //               padding: const EdgeInsets.fromLTRB(12,0,0,0),
          //               child: Text(
          //                   "Lorem ipsum dolor sit amet, consectetur adip", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold)
          //               ),
          //             ),
          //
          //           ),
          //         ),
          //         SizedBox(height: 10,),
          //         Align(
          //           alignment: Alignment.centerLeft,
          //           child: Container(
          //             child: Padding(
          //               padding: const EdgeInsets.fromLTRB(12,0,0,0),
          //               child: Text(
          //                   "₹ 45,000", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
          //               ),
          //             ),
          //
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      );
    },
    itemCount: 3,
    viewportFraction: 0.8,
    scale: 0.9,
    //pagination: new SwiperPagination(),
    //control: new SwiperControl(color: Colors.black38, padding: EdgeInsets.fromLTRB(0, 0, 0, 150),),
  );
}

imageSliderSix(context){
  return new Swiper(
    autoplay: false,
    duration: 2000,
    itemBuilder: (BuildContext context, int index){
      return GestureDetector(
        onTap: (){

        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 200,
                width: 150,
                child: Column(
                  children: [
                    Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Image.asset(
                          imgListSix[index],
                          fit: BoxFit.fitHeight, color: Colors.amber,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(13,0,0,0),
                          child: Text(
                              textListSix[index], textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13,)
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   child: Container(
            //     width: 250.0,
            //     child: Column(
            //       children: [
            //         Card(
            //           semanticContainer: true,
            //           clipBehavior: Clip.antiAliasWithSaveLayer,
            //           child: Padding(
            //             padding: const EdgeInsets.all(20.0),
            //             child: Image.asset(
            //               imageListtwo[index + 1],
            //               fit: BoxFit.fitHeight,
            //             ),
            //           ),
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(50.0),
            //           ),
            //           elevation: 5,
            //           margin: EdgeInsets.all(10),
            //         ),
            //         SizedBox(height: 10,),
            //         Align(
            //           alignment: Alignment.centerLeft,
            //           child: Container(
            //             child: Padding(
            //               padding: const EdgeInsets.fromLTRB(15,0,0,0),
            //               child: Text(
            //                   "Customised Living experience",textAlign: TextAlign.center ,style: TextStyle(color: Colors.black, fontSize: 13,)
            //               ),
            //             ),
            //
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),



            // Expanded(
            //   child: Container(
            //     width: 340.0,
            //     child: Column(
            //       children: [
            //         Card(
            //           semanticContainer: true,
            //           clipBehavior: Clip.antiAliasWithSaveLayer,
            //           child: Padding(
            //             padding: const EdgeInsets.all(20.0),
            //             child: Image.asset(
            //               imageListtwo[index + 2],
            //               fit: BoxFit.fitHeight,
            //             ),
            //           ),
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(50.0),
            //           ),
            //           elevation: 5,
            //           margin: EdgeInsets.all(10),
            //         ),
            //         SizedBox(height: 10,),
            //         Align(
            //           alignment: Alignment.centerLeft,
            //           child: Container(
            //             child: Padding(
            //               padding: const EdgeInsets.fromLTRB(15,0,0,0),
            //               child: Text(
            //                   "Door step services", textAlign: TextAlign.center ,style: TextStyle(color: Colors.black, fontSize: 13,)
            //               ),
            //             ),
            //
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      );
    },

    itemCount: 9,
    viewportFraction: 0.35,
    scale: 0.9,
    // itemWidth: 150,
    // itemHeight: 150,
    //layout: SwiperLayout.DEFAULT,
    pagination: new SwiperPagination(builder: new DotSwiperPaginationBuilder(color: Colors.black26, activeColor: Color(0xffED6D6D))),
    //control: new SwiperControl(),
  );
}



class navigation_Next extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white38,
      child: Icon(Icons.navigate_next, color: Colors.white,),
    );
  }
}
