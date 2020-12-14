import 'package:flutter/material.dart';
import 'package:staylogy/main.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'my_drawer.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class product extends StatefulWidget {
  @override
  _productState createState() => _productState();
}

class _productState extends State<product> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isPlayerReady = false;
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: SafeArea(
        child: MyDrawer(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: ListView(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(18, 10, 15, 20),
                      child: Image.asset('assets/images/logo.png', width: 100,),
                    ),
                    Spacer(flex: 2),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(color: Colors.pink)
                          ),
                          color: Colors.pink,
                          child: Text("Enquire Now", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      width: 55,
                      child: Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 5, 25),
                          child: InkWell(
                              onTap: () {
                                //Scaffold.of(context).openEndDrawer();
                                if(scaffoldKey.currentState.isDrawerOpen){
                                  scaffoldKey.currentState.openEndDrawer();
                                }else{
                                  scaffoldKey.currentState.openDrawer();
                                }
                              },
                              child: Icon(Icons.menu, color: Colors.black, size: 35,)
                          )
                      ),
                    ),
                  ],
                ),
              ),
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
                    Positioned(
                      left: 20,
                      top: 20,

                      child: Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
                          },
                          child: Icon(
                              Icons.arrow_back, color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
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
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
                              child: Container(
                                width: 200,
                                child: Text(
                                    "Property Name",textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
                                ),

                              ),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              width: 200,
                              child: Row(
                                children: [
                                  Container(
                                    width: 25,
                                    child: Image.asset('assets/images/pin.png', alignment: Alignment.centerLeft ,color: Colors.amber, height: 15 , width: 15,),
                                  ),

                                  Container(
                                    width: 100,
                                    child: Text(
                                        "Location",textAlign: TextAlign.start, style: TextStyle(color: Colors.black45, fontSize: 15, )
                                    ),

                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Spacer(flex: 2),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,0,25),
                          child: Container(
                            width: 100,
                            child: Row(
                              children: [
                                Container(
                                  width: 70,
                                  child: Text(
                                      "Brochure",textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 15, )
                                  ),

                                ),
                                Container(
                                  width: 25,
                                  child: Image.asset('assets/images/download.png', alignment: Alignment.centerLeft ,color: Colors.amber, height: 15 , width: 15,),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Container(
                        width: double.maxFinite,
                        height: 1,
                        color: Colors.black26,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                              "25 co-living villas",textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
                          ),

                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                              "1 Bed - Sharing",textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 15,)
                          ),

                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            text: 'Start from ',
                            style: TextStyle(color: Colors.black26, fontSize: 13),
                            children: <TextSpan>[
                              TextSpan(text: ' ₹45,000', style: TextStyle( color: Colors.pink ,fontWeight: FontWeight.bold, fontSize: 15)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: FAProgressBar(
                        currentValue: 60,
                        maxValue: 100,
                        size: 2,
                        backgroundColor: Colors.black26,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                              "Occupancy filling fast",textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 15,)
                          ),

                        ),
                      ),
                    ),

                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Container(
                        width: double.maxFinite,
                        height: 1,
                        color: Colors.black26,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                              "3 Bed - Sharing",textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
                          ),

                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            text: 'Start from ',
                            style: TextStyle(color: Colors.black26, fontSize: 13),
                            children: <TextSpan>[
                              TextSpan(text: ' ₹35,000', style: TextStyle( color: Colors.pink ,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: FAProgressBar(
                        currentValue: 80,
                        maxValue: 100,
                        size: 2,
                        backgroundColor: Colors.black26,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                              "Occupancy filling fast",textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 15,)
                          ),

                        ),
                      ),
                    ),

                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Container(
                        width: double.maxFinite,
                        height: 1,
                        color: Colors.black26,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                              "4 Bed - Sharing",textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
                          ),

                        ),
                      ),
                    ),

                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            text: 'Start from ',
                            style: TextStyle(color: Colors.black26, fontSize: 13),
                            children: <TextSpan>[
                              TextSpan(text: ' ₹60,000', style: TextStyle( color: Colors.pink ,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: FAProgressBar(
                        currentValue: 50,
                        maxValue: 100,
                        size: 2,
                        backgroundColor: Colors.black26,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                              "Occupancy filling fast",textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 15,)
                          ),

                        ),
                      ),
                    ),

                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Container(
                        width: double.maxFinite,
                        height: 1,
                        color: Colors.black26,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                              "1 Bed - Sharing",textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 15,)
                          ),

                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            text: 'Start from ',
                            style: TextStyle(color: Colors.black26, fontSize: 13),
                            children: <TextSpan>[
                              TextSpan(text: ' ₹40,000', style: TextStyle( color: Colors.pink ,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: FAProgressBar(
                        currentValue: 50,
                        maxValue: 100,
                        size: 2,
                        backgroundColor: Colors.black26,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                              "Occupancy filling fast",textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 15,)
                          ),

                        ),
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
                                "A varity of rooms to", style: TextStyle(color: Colors.black, fontSize: 20,)
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
                                "suit your taste", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
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
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10,0,10,0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          "1 Bed - Sharing", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
                                      ),
                                      Spacer(),
                                      Text(
                                          "₹45,000", style: TextStyle(color: Colors.black, fontSize: 15,)
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                    child: Container(
                                      width: double.maxFinite,
                                      height: 1,
                                      color: Colors.black26,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text(
                                          "Inclusive of:", style: TextStyle(color: Colors.black, fontSize: 15,)
                                      ),
                                      SizedBox(width: 10,),
                                      Icon(Icons.wifi,),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(5,0,5,0),
                                        child: Image.asset('assets/images/fork.png', height: 20, width: 20,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(5,0,5,0),
                                        child: Image.asset('assets/images/tv.png', height: 20, width: 20,),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "Onlu 5 Rooms Left", style: TextStyle(color: Colors.black, fontSize: 15)
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Row(
                            children: [
                              FlatButton(
                                color: Colors.pink,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)
                                ),
                                onPressed: (){},
                                child: Text('View Property', style: TextStyle(color:  Colors.white, fontWeight: FontWeight.bold),),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                                child: Text(
                                    "Take a Tour >", style: TextStyle(color: Colors.pink, fontSize: 17, fontWeight: FontWeight.bold)
                                ),
                              ),
                            ],
                          ),

                        ),
                      ),
                      SizedBox(height: 30,),

                    ],
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
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 50,
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
                            width: 120.0,
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Align(
                                alignment: Alignment.center,
                                  child: Text('Leisure')),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                            ),
                          ),
                          Container(
                            width: 120.0,
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Fitness')),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                            ),
                          ),
                          Container(
                            width: 120.0,
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Security')),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                            ),
                          ),
                          Container(
                            width: 120.0,
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Wifi')),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              elevation: 5,
                              margin: EdgeInsets.all(10),
                            ),
                          ),
                          Container(
                            width: 120.0,
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text('Good')),
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
                    SizedBox(height: 10,),
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
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                              "Lif at Staylogy", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
                          ),
                        ),

                      ),
                    ),
                    SizedBox(height: 10,),
                    YoutubePlayer(
                      onReady: () {
                        _controller.play();
                      },

                      thumbnail: Image.asset('assets/images/people.jpg'),
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.indigo,
                      progressColors: ProgressBarColors(
                        playedColor: Colors.indigo,
                        handleColor: Colors.indigo,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                              "Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach.", style: TextStyle(color: Colors.black, fontSize: 13)
                          ),
                        ),

                      ),
                    ),
                  ],
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
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Container(
                        //     child: Padding(
                        //       padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        //       child: Text(
                        //           "What makes this a perfect", style: TextStyle(color: Colors.black, fontSize: 20,)
                        //       ),
                        //     ),
                        //
                        //   ),
                        // ),
                        SizedBox(height: 10,),
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Container(
                        //     child: Padding(
                        //       padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        //       child: Text(
                        //           "home away from home", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
                        //       ),
                        //     ),
                        //
                        //   ),
                        // ),
                        SizedBox(height: 10,),
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 260,
                                width: 300,
                                child: Column(
                                  children: [
                                    Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.asset(
                                        'assets/images/k.jpg',
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      elevation: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                          child: Text(
                                              "Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach.", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold)
                                          ),
                                        ),

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 260,
                                width: 300,
                                child: Column(
                                  children: [
                                    Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.asset(
                                        'assets/images/bed.jpg',
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      elevation: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: Text(
                                            "Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach.", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold)
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 260,
                                width: 300,
                                child: Column(
                                  children: [
                                    Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: Image.asset(
                                        'assets/images/k.jpg',
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      elevation: 5,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                          child: Text(
                                              "Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach.", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold)
                                          ),
                                        ),

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.white,
                        child: Text("Location Benefits", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 400,
                      child: Card(
                        elevation: 0,
                        color: Colors.indigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(200.0),
                        ),
                        child: Image.asset("assets/images/map.jpg", fit: BoxFit.cover,),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  //padding: const EdgeInsets.all(5),
                                  color: Colors.white,
                                  child: Text("2 KM", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  color: Colors.white,
                                  child: Text("From Airport", textAlign: TextAlign.center , style: TextStyle(color: Colors.black, fontSize: 15, ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  //padding: const EdgeInsets.all(5),
                                  color: Colors.white,
                                  child: Text("1 KM", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  color: Colors.white,
                                  child: Text("From Supermarket", textAlign: TextAlign.center , style: TextStyle(color: Colors.black, fontSize: 15, ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  //padding: const EdgeInsets.all(5),
                                  color: Colors.white,
                                  child: Text("2 KM", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  color: Colors.white,
                                  child: Text("From IT Park", textAlign: TextAlign.center ,style: TextStyle(color: Colors.black, fontSize: 15, ),),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  //padding: const EdgeInsets.all(5),
                                  color: Colors.white,
                                  child: Text("2 KM", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  color: Colors.white,
                                  child: Text("From Airport", textAlign: TextAlign.center , style: TextStyle(color: Colors.black, fontSize: 15, ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  //padding: const EdgeInsets.all(5),
                                  color: Colors.white,
                                  child: Text("1 KM", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  color: Colors.white,
                                  child: Text("From Supermarket", textAlign: TextAlign.center , style: TextStyle(color: Colors.black, fontSize: 15, ),),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  //padding: const EdgeInsets.all(5),
                                  color: Colors.white,
                                  child: Text("2 KM", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  color: Colors.white,
                                  child: Text("From IT Park", textAlign: TextAlign.center , style: TextStyle(color: Colors.black, fontSize: 15, ),),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                color: Colors.amber,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        //padding: const EdgeInsets.all(5),
                        child: Text("Advantages", style: TextStyle(color: Colors.black, fontSize: 20,),),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        child: Text("Over PG",  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold ),),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          child: Card(
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
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                //padding: const EdgeInsets.all(5),
                                child: Text("Advantages", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold ),),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: 220,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach.", style: TextStyle(color: Colors.black, fontSize: 15,),),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          child: Card(
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
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                //padding: const EdgeInsets.all(5),
                                child: Text("Advantages", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold ),),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: 220,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach.", style: TextStyle(color: Colors.black, fontSize: 15,),),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          child: Card(
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
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                //padding: const EdgeInsets.all(5),
                                child: Text("Advantages", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold ),),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: 220,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach.", style: TextStyle(color: Colors.black, fontSize: 15,),),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          child: Card(
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
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                //padding: const EdgeInsets.all(5),
                                child: Text("Advantages", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold ),),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: 220,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach.", style: TextStyle(color: Colors.black, fontSize: 15,),),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        //padding: const EdgeInsets.all(5),
                        child: Text("Save More", style: TextStyle(color: Colors.black, fontSize: 20,),),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        child: Text("With Staylogy", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold ),),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          Table(
                            border: TableBorder.all(width: 0.5),
                            children: [
                              TableRow(
                                  decoration: BoxDecoration(color: Colors.grey[200]),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text('Room Type', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text('Price', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                  ),
                                ]
                              ),
                            ],
                          ),

                          Table(
                            border: TableBorder.all(width: 0),
                            columnWidths: {
                              0: FractionColumnWidth(0.5),
                              1: FractionColumnWidth(0.25),
                              2: FractionColumnWidth(0.25)
                            },
                            children: [
                              TableRow(
                                  decoration: BoxDecoration(color: Colors.grey[200]),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(' ', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('PG', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('Co-Living', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                  ]
                              ),
                            ],
                          ),
                          Table(
                            //border: TableBorder.all(width: 0),
                            columnWidths: {
                              0: FractionColumnWidth(0.5),
                              1: FractionColumnWidth(0.25),
                              2: FractionColumnWidth(0.25)
                            },
                            children: [
                              TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(30,15,15,15),
                                      child: Text('Single', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('₹15000', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('₹14000', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(30,15,15,15),
                                      child: Text('Delux 2-Sharing', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('₹15000', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('₹14000', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(30,15,15,15),
                                      child: Text('2-Sharing', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('₹15000', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('₹14000', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(30,15,15,15),
                                      child: Text('Deluxe 3-Sharing', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('₹15000', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('₹14000', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(30,15,15,15),
                                      child: Text('3-Sharing', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('₹15000', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('₹14000', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                  ]
                              ),
                              TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(30,15,15,15),
                                      child: Text('4-Sharing', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('₹15000', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text('₹14000', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold), ),
                                    ),
                                  ]
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                        child: Text("How to Check-In?", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold ),),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          child: Card(
                            color: Colors.amber,
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Align(
                              alignment: Alignment.center,
                                child: Text('1',)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                //padding: const EdgeInsets.all(5),
                                child: Text("Advantages", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold ),),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: 250,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach.", style: TextStyle(color: Colors.black, fontSize: 15,),),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          child: Card(
                            color: Colors.amber,
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('2',)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                //padding: const EdgeInsets.all(5),
                                child: Text("Advantages", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold ),),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: 250,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach.", style: TextStyle(color: Colors.black, fontSize: 15,),),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          child: Card(
                            color: Colors.amber,
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('3',)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                //padding: const EdgeInsets.all(5),
                                child: Text("Advantages", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold ),),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: 250,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach.", style: TextStyle(color: Colors.black, fontSize: 15,),),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          child: Card(
                            color: Colors.amber,
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Align(
                                alignment: Alignment.center,
                                child: Text('4',)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                //padding: const EdgeInsets.all(5),
                                child: Text("Advantages", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold ),),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              width: 250,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach.", style: TextStyle(color: Colors.black, fontSize: 15,),),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20,)
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
                                "Latest Events", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
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
                              child: Column(
                                children: [
                                  Card(
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
                                  SizedBox(height: 10,),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                            "Event Name", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
                                        ),

                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
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
                                ],
                              ),
                            ),
                            Container(
                              width: 340.0,
                              child: Column(
                                children: [
                                  Card(
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
                                  SizedBox(height: 10,),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                            "Event Name", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
                                        ),

                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
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
                                ],
                              ),
                            ),
                            Container(
                              width: 340.0,
                              child: Column(
                                children: [
                                  Card(
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
                                  SizedBox(height: 10,),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                            "Event Name", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
                                        ),

                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
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
                                ],
                              ),
                            ),
                            Container(
                              width: 340.0,
                              child: Column(
                                children: [
                                  Card(
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
                                  SizedBox(height: 10,),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                            "Event Name", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
                                        ),

                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
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
                                ],
                              ),
                            ),
                            Container(
                              width: 340.0,
                              child: Column(
                                children: [
                                  Card(
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
                                  SizedBox(height: 10,),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                            "Event Name", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
                                        ),

                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),

                    ],
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
                  padding: EdgeInsets.all(20),
                  child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                  "Answer for", style: TextStyle(color: Colors.black, fontSize: 20,)
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
                                  "all your queries", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
                              ),
                            ),

                          ),
                        ),
                        SizedBox(height: 20,),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Container(
                            color: Colors.black12,
                            child: ExpansionTile(
                              title: new Text("1. Sample?", style: TextStyle(color: Colors.black, fontSize: 15),),
                              children: <Widget>[
                                ListTile(
                                  title: const Text("Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach", style: TextStyle(color: Colors.black, fontSize: 15),),
                                  onTap: (){
                                    //Navigator.of(context).pop();
                                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => automationProduct()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Container(
                            color: Colors.black12,
                            child: ExpansionTile(
                              title: new Text("2. Sample?", style: TextStyle(color: Colors.black, fontSize: 15),),
                              children: <Widget>[
                                ListTile(
                                  title: const Text("Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach", style: TextStyle(color: Colors.black, fontSize: 15),),
                                  onTap: (){
                                    //Navigator.of(context).pop();
                                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => automationProduct()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Container(
                            color: Colors.black12,
                            child: ExpansionTile(
                              title: new Text("3. Sample?", style: TextStyle(color: Colors.black, fontSize: 15),),
                              children: <Widget>[
                                ListTile(
                                  title: const Text("Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach", style: TextStyle(color: Colors.black, fontSize: 15),),
                                  onTap: (){
                                    //Navigator.of(context).pop();
                                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => automationProduct()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Container(
                            color: Colors.black12,
                            child: ExpansionTile(
                              title: new Text("4. Sample?", style: TextStyle(color: Colors.black, fontSize: 15),),
                              children: <Widget>[
                                ListTile(
                                  title: const Text("Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach", style: TextStyle(color: Colors.black, fontSize: 15),),
                                  onTap: (){
                                    //Navigator.of(context).pop();
                                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => automationProduct()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                  ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                              "SEO Content", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
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
                              "Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach. Resort & Spa Shekvetili, Autograph Collection. Beachfront. Property is on or right next to the beach", style: TextStyle(color: Colors.black, fontSize: 13, )
                          ),
                        ),

                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20,0,20,0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
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
                          Expanded(
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
                        ],
                      ),
                      SizedBox(height: 30,)
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.indigo,
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
                color: Colors.indigo,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Text(
                            "© Copyright Stalogy 2020. All Rights Reserved", style: TextStyle(color: Colors.white60, fontSize: 13,)
                        ),

                      ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
