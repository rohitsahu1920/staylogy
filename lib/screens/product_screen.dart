import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:staylogy/main.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'my_drawer.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum WidgetMarker {All, Leisure, Fitness, Security, Household}

class product extends StatefulWidget {
  @override
  _productState createState() => _productState();
}

class _productState extends State<product> with TickerProviderStateMixin{

  WidgetMarker selectedWidget = WidgetMarker.All;

  int raisedbutton = 0;

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
                    SizedBox(height: 100,),
                    // Container(
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         padding: EdgeInsets.fromLTRB(18, 10, 15, 20),
                    //         child: Image.asset('assets/images/logo.png', width: 100,),
                    //       ),
                    //       Spacer(flex: 2),
                    //       Container(
                    //         child: Padding(
                    //           padding: EdgeInsets.all(15.0),
                    //           child: FlatButton(
                    //             shape: RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.circular(20.0),
                    //                 side: BorderSide(color: Colors.pink)
                    //             ),
                    //             color: Colors.pink,
                    //             child: Text("Enquire Now", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    //             onPressed: (){
                    //               Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
                    //             },
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         height: 55,
                    //         width: 55,
                    //         child: Container(
                    //             padding: EdgeInsets.fromLTRB(15, 10, 5, 25),
                    //             child: InkWell(
                    //                 onTap: () {
                    //                   //Scaffold.of(context).openEndDrawer();
                    //                   if(scaffoldKey.currentState.isDrawerOpen){
                    //                     scaffoldKey.currentState.openEndDrawer();
                    //                   }else{
                    //                     scaffoldKey.currentState.openDrawer();
                    //                   }
                    //                 },
                    //                 child: Icon(Icons.menu, color: Colors.black, size: 35,)
                    //             )
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      color: Colors.white,
                      child: Card(
                        color: Colors.white,
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
                            // Positioned(
                            //   left: 20,
                            //   top: 20,
                            //
                            //   child: Align(
                            //     alignment: Alignment.topLeft,
                            //     child: InkWell(
                            //       onTap: () {
                            //         Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
                            //       },
                            //       child: Icon(
                            //         Icons.arrow_back, color: Colors.black,
                            //       ),
                            //     ),
                            //   ),
                            // ),
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
                    ),
                    Container(
                      color: Colors.white,
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
                                          "Staylogy Auburn",textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
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
                                          width: 150,
                                          child: Text(
                                              "Mahabalipuram Road",textAlign: TextAlign.start, style: TextStyle(color: Colors.black45, fontSize: 15, )
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
                          SizedBox(height: 10,),
                          // Padding(
                          //   padding: const EdgeInsets.fromLTRB(10,0,10,0),
                          //   child: Container(
                          //     width: double.maxFinite,
                          //     height: 1,
                          //     color: Colors.black26,
                          //   ),
                          // ),
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
                          SizedBox(height: 10,),
                          // Padding(
                          //   padding: const EdgeInsets.fromLTRB(10,0,10,0),
                          //   child: Container(
                          //     width: double.maxFinite,
                          //     height: 1,
                          //     color: Colors.black26,
                          //   ),
                          // ),
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
                          SizedBox(height: 10,),
                          // Padding(
                          //   padding: const EdgeInsets.fromLTRB(10,0,10,0),
                          //   child: Container(
                          //     width: double.maxFinite,
                          //     height: 1,
                          //     color: Colors.black26,
                          //   ),
                          // ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10,0,10,0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Text(
                                    "1 Bed - Sharing",textAlign: TextAlign.start, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
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
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.amber,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0,0,0,0),
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(25.0,0,0,0),
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
                                  padding: const EdgeInsets.fromLTRB(25.0,0,0,0),
                                  child: Text(
                                      "suit your taste", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
                                  ),
                                ),

                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              constraints: BoxConstraints.expand(
                                  height: 400
                              ),
                              child: imageSliderFive(context),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
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
                          SizedBox(height: 10,),
                          SizedBox(height: 10,),
                          SizedBox(
                            height: 35,
                            child: ListView(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              // This next line does the trick.
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                RaisedButton(
                                  elevation: 0,
                                  color: Colors.white,
                                  highlightColor: Colors.black12,
                                  onPressed: () {
                                    setState(() {
                                      selectedWidget = WidgetMarker.All;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black26)
                                  ),
                                  child: Text(
                                    "All",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                RaisedButton(
                                  elevation: 0,
                                  color: Colors.white,
                                  highlightColor: Colors.black12,
                                  onPressed: () {
                                    setState(() {
                                      selectedWidget = WidgetMarker.Leisure;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black26)
                                  ),
                                  child: Text(
                                    "Leisure",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                RaisedButton(
                                  elevation: 0,
                                  color: Colors.white,
                                  highlightColor: Colors.black12,
                                  onPressed: () {
                                    setState(() {
                                      selectedWidget = WidgetMarker.Fitness;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black26)
                                  ),
                                  child: Text(
                                    "Fitness",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                RaisedButton(
                                  elevation: 0,
                                  color: Colors.white,
                                  highlightColor: Colors.black12,
                                  onPressed: () {
                                    setState(() {
                                      selectedWidget = WidgetMarker.Security;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black26)
                                  ),
                                  child: Text(
                                    "Security",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20,),
                                RaisedButton(
                                  elevation: 0,
                                  color: Colors.white,
                                  highlightColor: Colors.black12,
                                  onPressed: () {
                                    setState(() {
                                      selectedWidget = WidgetMarker.Household;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.black26)
                                  ),
                                  child: Text(
                                    "Household",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          SizedBox(height: 10,),
                          Container(
                            constraints: BoxConstraints.expand(
                              height: 250,
                              //width: 500
                            ),
                            child: getCustomeContainer(),
                          ),
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
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                    "Life at Staylogy", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
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
                                    "Hey, you! We know it’s exciting to live in a villa, it’s also daunting to share your space with 15 new faces. However, co-living doesn’t mean you need to be joined at the hip and do everything together at all times. At Staylogy, we make nothing mandatory and we believe in giving you your space and pace to do things. However, in case you wish to know what a regular day at Staylogy looks like, here’s a quick sneak peek. ", style: TextStyle(color: Colors.black, fontSize: 13)
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
                                      height: 350,
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
                                                    "Morning Routine", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold)
                                                ),
                                              ),

                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                                child: Text(
                                                    "Rise and shine, friends. There’s no set rule about what time you must wake up. There are no alarm clocks you need to snooze. But you know what they say- you snooze you lose! So if you want to soak in some early morning Vitamin D and take a quick stroll around your new neighbourhood, we suggest you wake up and head out straight for a morning walk/ run around the community. ", style: TextStyle(color: Colors.black, fontSize: 13,)
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
                                                  "We have plenty of cosy and inspiring workspaces at Staylogy. So pick your corner, grab you tea or coffee and get working!", style: TextStyle(color: Colors.black, fontSize: 13,)
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
                                      height: 320,
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
                                                    "Afternoon-Evening Routine", style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold)
                                                ),
                                              ),

                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              child: Padding(
                                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                                child: Text(
                                                    "The best part about staying and working out of Staylogy is that you can always make time for meals. So cook up a storm in the kitchen by yourself or with your co-livers and enjoy a hearty lunch. The kitchen is fully equipped and Google is full on recipes!", style: TextStyle(color: Colors.black, fontSize: 13,)
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
                                      height: 300,
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
                                                    "Spend your day working, reading or napping…basically, this is your home and you decide to spend your time the way you like. If you’re a freelancer or are employed somewhere, we suggest you get ahead of your deadlines and shut your machines just around sunset. This way, you could get your evening beverage and head to the terrace for a quick break!", style: TextStyle(color: Colors.black, fontSize: 13,)
                                                ),
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
                                      height: 320,
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
                                                    "There’s no harm in adding some more skills to your resume. Skillshares and masterminds are a great way to harness the power of our diverse community and take your personal and professional growth to the next level. If you work from home, then take an online class or pick the brains of your co-livers to teach you something new. If you head out to work, then we bet you will enjoy the walk back to your villa!", style: TextStyle(color: Colors.black, fontSize: 13,)
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
                                      height: 300,
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
                                                    "Time to unwind. Head out for dinner or cook yourself a meal, this is usually your time to relax and take it easy. So play some games, read a book or simple settle down for some Netflix & Chill time. Like we always say, you make your own schedules at Staylogy so feel free to indulge in some “me time” and gear up for the next day!", style: TextStyle(color: Colors.black, fontSize: 13,)
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
                      color: Colors.white,
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
                      color: Colors.white,
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
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      color: Colors.amber,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                //padding: const EdgeInsets.all(5),
                                child: Text("Advantages", style: TextStyle(color: Colors.black, fontSize: 20,),),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: const EdgeInsets.all(0),
                                child: Text("Over PG",  style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold ),),
                              ),
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

  Widget getCustomeContainer(){
    switch(selectedWidget){
      case WidgetMarker.All:
        return getAllContainer();
      case WidgetMarker.Leisure:
        return getLeisureContainer();
      case WidgetMarker.Fitness:
        return getFitnessContainer();
      case WidgetMarker.Security:
        return getSecurityContainer();
      case WidgetMarker.Household:
        return getHouseholdContainer();
    }
    return getAllContainer();
  }

  Widget getAllContainer(){
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
                            imgListAll[index],
                            fit: BoxFit.fitHeight,
                            color: Colors.amber,
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
                                textListAll[index], textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13,)
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },

      itemCount: 21,
      viewportFraction: 0.35,
      scale: 0.9,
      // itemWidth: 150,
      // itemHeight: 150,
      //layout: SwiperLayout.DEFAULT,
      pagination: new SwiperPagination(builder: new DotSwiperPaginationBuilder(color: Colors.black26, activeColor: Color(0xffED6D6D))),
      //control: new SwiperControl(),
    );
  }

  Widget getLeisureContainer(){
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
                            imgListLeisure[index],
                            fit: BoxFit.fitHeight,
                            color: Colors.amber,
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
                                textListLeisure[index], textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13,)
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },

      itemCount: 5,
      viewportFraction: 0.35,
      scale: 0.9,
      // itemWidth: 150,
      // itemHeight: 150,
      //layout: SwiperLayout.DEFAULT,
      pagination: new SwiperPagination(builder: new DotSwiperPaginationBuilder(color: Colors.black26, activeColor: Color(0xffED6D6D))),
      //control: new SwiperControl(),
    );
  }

  Widget getFitnessContainer(){
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
                            imgListFitness[index],
                            fit: BoxFit.fitHeight,
                            color: Colors.amber,
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
                                textListFitness[index], textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13,)
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },

      itemCount: 2,
      viewportFraction: 0.35,
      scale: 0.9,
      // itemWidth: 150,
      // itemHeight: 150,
      //layout: SwiperLayout.DEFAULT,
      pagination: new SwiperPagination(builder: new DotSwiperPaginationBuilder(color: Colors.black26, activeColor: Color(0xffED6D6D))),
      //control: new SwiperControl(),
    );
  }

  Widget getSecurityContainer(){
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
                            imgListSecurity[index],
                            fit: BoxFit.fitHeight,
                            color: Colors.amber,
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
                                textListSecurity[index], textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13,)
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },

      itemCount: 2,
      viewportFraction: 0.35,
      scale: 0.9,
      // itemWidth: 150,
      // itemHeight: 150,
      //layout: SwiperLayout.DEFAULT,
      pagination: new SwiperPagination(builder: new DotSwiperPaginationBuilder(color: Colors.black26, activeColor: Color(0xffED6D6D))),
      //control: new SwiperControl(),
    );
  }

  Widget getHouseholdContainer(){
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
                            imgListHousehold[index],
                            fit: BoxFit.fitHeight,
                            color: Colors.amber,
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
                                textListHousehold[index], textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 13,)
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
}

final List imgListAll = [
  "assets/images/handle.png",
  "assets/images/joystick.png",
  "assets/images/air-conditioner.png",
  "assets/images/bed.png",
  "assets/images/to-go-cup.png",
  "assets/images/poker-cards.png",
  "assets/images/casino-cctv.png",
  "assets/images/cinema-screen.png",
  "assets/images/gas-stove.png",
  "assets/images/cupboard.png",
  "assets/images/dining-table.png",
  "assets/images/fridge.png",
  "assets/images/badminton.png",
  "assets/images/geyser.png",
  "assets/images/wifi.png",
  "assets/images/dining-table.png",
  "assets/images/landscape.png",
  "assets/images/parking.png",
  "assets/images/wireless-charging.png",
  "assets/images/tools.png",
  "assets/images/man.png",
  "assets/images/exercise.png",
];

final List textListAll = [
  "Access Control",
  "Gaming-Arcade",
  "Air Conditioner",
  "Bed",
  "Cafeteria",
  "Card Room",
  "CCTV",
  "Cinema Room",
  "Cooking Stove",
  "Cupboard",
  "Dinner Table",
  "Fridge",
  "Gaming Nook",
  "Geyser",
  "High Speed Net",
  "Lawn",
  "Open garden",
  "Parking Space",
  "Power BackUp",
  "Repair",
  "Walking Area",
  "Yoga",
];

final List imgListHousehold = [
  "assets/images/air-conditioner.png",
  "assets/images/bed.png",
  "assets/images/gas-stove.png",
  "assets/images/cupboard.png",
  "assets/images/dining-table.png",
  "assets/images/fridge.png",
  "assets/images/geyser.png",
  "assets/images/wifi.png",
  "assets/images/wireless-charging.png",
  "assets/images/tools.png",
];

final List textListHousehold = [
  "Air Conditioner",
  "Bed",
  "Cooking Stove",
  "Cupboard",
  "Dinner Table",
  "Fridge",
  "Geyser",
  "High Speed Net",
  "Power Backup",
  "Repair",
];

final List imgListLeisure = [
  "assets/images/joystick.png",
  "assets/images/to-go-cup.png",
  "assets/images/poker-cards.png",
  "assets/images/cinema-screen.png",
  "assets/images/dining-table.png",
  "assets/images/landscape.png",
];

final List textListLeisure = [
  "Gaming-Arcade",
  "Cafeteria",
  "Card Room",
  "Cinema Room",
  "Lawn",
  "Open garden",
];

final List imgListFitness = [
  "assets/images/badminton.png",
  "assets/images/man.png",
  "assets/images/exercise.png",
];

final List textListFitness = [
  "Gaming Nook",
  "Walking Area",
  "Yoga",
];

final List imgListSecurity = [
  "assets/images/handle.png",
  "assets/images/casino-cctv.png",
  "assets/images/parking.png",
];

final List textListSecurity = [
  "Access Control",
  "CCTV",
  "Parking Space"
];


final List imgListFiveUnder = [
  "assets/images/k.jpg",
  "assets/images/bed.jpg",
  "assets/images/k_600x400.jpg",
];

final List imgListFive = [
  "assets/images/k.jpg",
  "assets/images/bed.jpg",
  "assets/images/k_600x400.jpg",
  "assets/images/k.jpg",
  "assets/images/bed.jpg",
  "assets/images/k_600x400.jpg",
  "assets/images/bed.jpg",
];

final List textListFiveLeft = [
  "Single",
  "Deluxe 2-sharing",
  "2-sharing",
  "Deluxe 3-sharing",
  "3-sharing",
  "4-sharing",
  "6-sharing"
];

final List textListFiveRight = [
  "₹ 14,000",
  "₹ 12,000",
  "₹ 9,500",
  "₹ 9,000",
  "₹ 8,000",
  "₹ 8,000",
  "₹ 7,000"
];

final List textListFiveRoomLeft = [
  "Only 5 Rooms Left",
  "Only 2 Rooms Left",
  "Only 4 Rooms Left",
  "Only 3 Rooms Left",
  "Only 3 Rooms Left",
  "Only 2 Rooms Left",
  "Only 4 Rooms Left",
];

List imgListFiveInclusiveOf = [
  room1,
  room1,
  room3,
  room3,
  room3,
  room3,
  room3,
];

List room1 = [
  "assets/images/wifi.png",
  "assets/images/fork.png",
];

List room2 = [
  "assets/images/wifi.png",
  "assets/images/fork.png",
];

List room3 = [
  "assets/images/wifi.png",
  "assets/images/fork.png",
  "assets/images/tv.png"
];

List room4 = [
  "assets/images/wifi.png",
  "assets/images/fork.png",
  "assets/images/tv.png"
];

imageSliderFive(context){
  return new Swiper(
    autoplay: false,
    duration: 2000,
    itemBuilder: (BuildContext context, int index){
      return Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Container(
                    constraints: BoxConstraints.expand(
                      height: 226,
                    ),
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: Colors.amber,
                      child: imageSliderFiveUnder(context),
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                                textListFiveLeft[index], style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)
                            ),
                            Spacer(),
                            Text(
                                textListFiveRight[index], style: TextStyle(color: Colors.black, fontSize: 15,)
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
                          child: Text(textListFiveRoomLeft[index], textAlign: TextAlign.left,),
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
                                  child: Text('Book Now', style: TextStyle(color:  Colors.white, fontWeight: FontWeight.bold),),
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
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
    },
    itemCount: 7,
    viewportFraction: 0.85,
    scale: 0.9,
    //pagination: new SwiperPagination(),
    //control: new SwiperControl(color: Colors.black38, padding: EdgeInsets.fromLTRB(0, 0, 0, 150),),
  );
}

imageSliderFiveUnder(context){
  return new Swiper(
    loop: false,
    //curve: Curve(),
    //physics: ,
    autoplayDisableOnInteraction: true,
    autoplay: false,
    duration: 100,
    itemBuilder: (BuildContext context, int index){
      return Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Card(
                      color: Colors.amber,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.asset(
                        imgListFive[index],
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
    itemCount: 3,
    viewportFraction: 01,
    scale: 0.9,
    //pagination: new SwiperPagination(),
    control: new SwiperControl(color: Colors.black, padding: EdgeInsets.fromLTRB(5, 0, 0, 0), disableColor: Colors.white),
  );
}
