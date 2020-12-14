import 'package:flutter/material.dart';

import '../main.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  final title = 'Floating App Bar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(

        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              leading: IconButton(
                  icon: Icon(Icons.home),
                  tooltip: 'Click to Home Screen',
                  onPressed: () {
                    //  handle the press
                  }),
              // Provide a standard title
              title: Text(title),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  tooltip: 'Open shopping cart',
                  onPressed: () {
                    // handle the press
                  },
                ),
              ],
              brightness: Brightness.light,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(
                color: Colors.yellowAccent,
              ),
              textTheme: TextTheme(
                title:
                TextStyle(fontFamily: 'RobotoMono', color: Colors.deepOrange,
                    fontSize: 26.0),
              ),
              forceElevated: true,
              shadowColor: Colors.indigo,
              floating: false,
              pinned: true,

              // Make the initial height of the SliverAppBar larger than normal
              expandedHeight: 55,
            ),
          ];
        },
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: ListView(
              children: [
                // Row(
                //   children: [
                //     Container(
                //         padding: EdgeInsets.fromLTRB(18, 10, 15, 20),
                //         child: Image.asset('assets/images/logo.png', width: 100,),
                //     ),
                //     Spacer(flex: 2),
                //     Container(
                //       child: Padding(padding: EdgeInsets.all(15.0),
                //         child: InkWell(
                //           onTap: () {
                //             Navigator.of(context).push(MaterialPageRoute(builder: (context) => product()));
                //           },
                //           child: Text('Enquire Now',
                //             textAlign: TextAlign.right,
                //             style: TextStyle(
                //               color: Colors.white,
                //               fontWeight: FontWeight.bold,
                //               fontSize: 20,
                //               decoration: TextDecoration.underline,
                //             ),
                //           ),
                //         ),),
                //     ),
                //     SizedBox(
                //       height: 55,
                //       width: 55,
                //       child: Container(
                //           padding: EdgeInsets.fromLTRB(15, 10, 25, 25),
                //           child: InkWell(
                //             onTap: () {
                //               //Scaffold.of(context).openEndDrawer();
                //               if(scaffoldKey.currentState.isDrawerOpen){
                //                 scaffoldKey.currentState.openEndDrawer();
                //               }else{
                //                 scaffoldKey.currentState.openDrawer();
                //               }
                //             },
                //               child: Icon(Icons.menu, color: Colors.white, size: 35,)
                //           )
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                  child: Text("Lorem lpsum", textAlign: TextAlign.center ,style: TextStyle(color: Colors.amber, fontSize: 25,),),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
                  child: Text("Dolor Sit Amete", textAlign: TextAlign.center ,style: TextStyle(color: Colors.amber, fontSize: 25, fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Text("sed do eiusmod tempor incididunt ut labor et dolore incididunt ut labor et dolore", textAlign: TextAlign.center , style: TextStyle(color: Colors.white, fontSize:15),),
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
                  child: Column(
                    children: [
                      Card(
                        elevation: 5,
                        margin: EdgeInsets.zero,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 20, 10, 20),
                              child: Image.asset('assets/images/coronavirus.png', height: 35, width: 35, color: Colors.black,),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    width: 260,
                                    child: Text(
                                      "Staylogy is safe from covid.",
                                      style: TextStyle(color: Colors.black, fontSize: 13),
                                      textAlign: TextAlign.start, // has impact
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Container(
                                    width: 260,
                                    child: Text(
                                      "Learn more about our best-in-class measures",
                                      style: TextStyle(color: Colors.black, fontSize: 13),
                                      textAlign: TextAlign.start, // has impact
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(30, 20, 10, 20),
                              child: Icon(Icons.navigate_next),
                            ),
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
                                  height: 200
                              ),
                              child: imageSlidertwo(context),
                            )
                          ],
                        ),
                      ),
                    ],
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
                              padding: const EdgeInsets.fromLTRB(15.0,0,0,0),
                              child: Text(
                                  "Co-Living Experience", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
                              ),
                            ),

                          ),
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                          height: 310,
                          child: ListView(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              // Card(
                              //   child: Container(
                              //     width: 170.0,
                              //     decoration: BoxDecoration(
                              //       image: DecorationImage(
                              //         image: AssetImage("assets/banner_600x400.jpg"),
                              //         fit: BoxFit.fitWidth,
                              //         alignment: Alignment.topCenter,
                              //       ),
                              //     ),
                              //     child: Text("Experience on overallocation of luxury & comfort like never befor in the heart of the city"),
                              //   ),
                              // ),
                              Container(
                                width: 340.0,
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.asset(
                                    'assets/images/k.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.all(10),
                                ),
                              ),
                              Container(
                                width: 340.0,
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.asset(
                                    'assets/images/bed.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.all(10),
                                ),
                              ),
                              Container(
                                width: 340.0,
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.asset(
                                    'assets/images/k.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.all(10),
                                ),
                              ),
                              Container(
                                width: 340.0,
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.asset(
                                    'assets/images/bed.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.all(10),
                                ),
                              ),
                              Container(
                                width: 340.0,
                                child: Card(
                                  semanticContainer: true,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.asset(
                                    'assets/images/k.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  elevation: 5,
                                  margin: EdgeInsets.all(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                  "Experience an Amalganation of luxury and comfort like never befor in the heart of the city.", style: TextStyle(color: Colors.black, fontSize: 15,)
                              ),

                            ),
                          ),
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
                              height: 300
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
                                height: 300
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
                                "More than 40 Amenities", style: TextStyle(color: Colors.black, fontSize: 20,)
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
                                "at your service", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
                            ),
                          ),

                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: 340.0,
                              child: Column(
                                children: [
                                  Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Image.asset(
                                        'assets/images/protection.png',
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
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                        child: Text(
                                            "Lorem lpsum docor sit", textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 13,)
                                        ),
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 340.0,
                              child: Column(
                                children: [
                                  Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Image.asset(
                                        "assets/images/armchair.png",
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
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                        child: Text(
                                            "Lorem lpsum docor sit",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13,)
                                        ),
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 340.0,
                              child: Column(
                                children: [
                                  Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Image.asset(
                                        "assets/images/home-delivery.png",
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
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                        child: Text(
                                            "Lorem lpsum docor sit",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13,)
                                        ),
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: 340.0,
                              child: Column(
                                children: [
                                  Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Image.asset(
                                        'assets/images/protection.png',
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
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                        child: Text(
                                            "Lorem lpsum docor sit", textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 13,)
                                        ),
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 340.0,
                              child: Column(
                                children: [
                                  Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Image.asset(
                                        "assets/images/armchair.png",
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
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                        child: Text(
                                            "Lorem lpsum docor sit",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13,)
                                        ),
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 340.0,
                              child: Column(
                                children: [
                                  Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Image.asset(
                                        "assets/images/home-delivery.png",
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
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                        child: Text(
                                            "Lorem lpsum docor sit",textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13,)
                                        ),
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
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
                SizedBox(height: 20,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
