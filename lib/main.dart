import 'package:flutter/material.dart';
import 'package:hotel_app/data/room_data.dart';
import 'package:hotel_app/data/user_provider.dart';
import 'package:hotel_app/widgets/checkout/checkcout.dart';
import 'package:hotel_app/widgets/checkout/checkout_main.dart';
import 'package:hotel_app/widgets/checkout/checkout_provider.dart';

import 'package:hotel_app/widgets/details/details_main_page.dart';
import 'package:hotel_app/widgets/home/home_main.dart';
import 'package:hotel_app/widgets/signup/signin.dart';
import 'package:hotel_app/widgets/signup/signup_main.dart';
import 'package:provider/provider.dart';

import 'widgets/rooms/rooms.dart';
import 'widgets/rooms/rooms_main_page.dart';
import 'widgets/selected/selected.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider()),
        ChangeNotifierProvider.value(value: RoomProvider()),
        ChangeNotifierProvider.value(value: CheckOutProvider())
      ],
      child: MaterialApp(
        //home: MyApp(),
        //home: SignUpMainPage(),
        //home: DetailsMainPage(),
        initialRoute: '/',
        routes: {
          '/': (context) => MyApp(),
          '/signup': (context) => const SignUpMainPage(),
          '/log-in': (context) => const SignIn(),
          '/details': (context) => const DetailsMainPage(),
          '/selected': (context) => const Selected(),
          '/rooms': (context) => Rooms(),
          '/selected-rooms': (context) => const RoomsPage(),
          //'/checkout': (context) => CheckOut(),
          '/checkout': (context) => const CheckOutMain()
        },
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //const MyApp({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.red.shade200,
        title: Text("Kanchenjunga"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              scaffoldKey.currentState!.openEndDrawer();
            },
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        //physics: const NeverScrollableScrollPhysics(),
        child: HomeMainPage(),
      ),
      endDrawer: Container(
        width: 180,
        child: Drawer(
          backgroundColor: Colors.red.shade100,
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Text(
                  'MENU',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              HomeMuenuButton(
                textVAlue: 'Home',
                menuIcon: Icon(Icons.home),
                route: '/',
              ),
              HomeMuenuButton(
                textVAlue: 'Rooms',
                menuIcon: Icon(Icons.bed_outlined),
                route: '/rooms',
              ),
              HomeMuenuButton(
                textVAlue: 'Services',
                menuIcon: Icon(Icons.miscellaneous_services),
              ),
              HomeMuenuButton(
                textVAlue: 'Checkout',
                menuIcon: Icon(Icons.check_box_outlined),
              ),
              HomeMuenuButton(
                textVAlue: 'Comments',
                menuIcon: Icon(Icons.comment_outlined),
              ),
              HomeMuenuButton(
                textVAlue: 'Exit App',
                menuIcon: Icon(Icons.exit_to_app),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeMuenuButton extends StatelessWidget {
  final String textVAlue;
  final Icon menuIcon;
  final String? route;
  HomeMuenuButton(
      {Key? key, required this.textVAlue, required this.menuIcon, this.route});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 15.0,
          ),
          alignment: Alignment.centerLeft,
          primary: Colors.purple.shade300),
      onPressed: route != null
          ? () {
              Navigator.of(context).pushNamed(route!);
            }
          : () {},
      icon: menuIcon,
      label: Text(
        textVAlue.toString(),
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}
