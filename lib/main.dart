import 'package:flutter/material.dart';
import 'package:hotel_app/app_drawer.dart';
import 'package:hotel_app/data/room_data.dart';
import 'package:hotel_app/data/user_provider.dart';

import 'package:hotel_app/widgets/checkout/checkout_main.dart';
import 'package:hotel_app/widgets/checkout/checkout_provider.dart';

import 'package:hotel_app/widgets/details/details_main_page.dart';
import 'package:hotel_app/widgets/first_page.dart';
import 'package:hotel_app/widgets/home/home_main.dart';
import 'package:hotel_app/widgets/profile/profile_main.dart';
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
          '/': (context) => const FirstPage(),
          '/home': (context) => MyApp(),
          '/profile': (context) => Profile(),
          '/sign-up': (context) => const SignUpMainPage(),
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
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        endDrawer: AppDrawer());
  }
}
