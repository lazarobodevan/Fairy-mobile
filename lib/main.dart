import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/environment.dart';
import 'package:mobile/screens/add_location/add_location_screen.dart';
import 'package:mobile/screens/location_description/location_description_screen.dart';
import 'package:mobile/screens/login_screen.dart';
import 'package:mobile/screens/nav_pages/main_nav_page.dart';
import 'package:mobile/screens/order_details_screen/order_details_screen.dart';
import 'package:mobile/screens/product_details_screen/product_details_screen.dart';
import 'package:mobile/screens/qr_code_reader/qr_code_reader.dart';
import 'package:mobile/screens/running_status_screen.dart';
import 'package:mobile/screens/signup/signup_screen.dart';
import 'package:mobile/services/producer_service.dart';
import 'package:mobile/services/product_service.dart';
import 'package:mobile/shared/blocs/geolocation/geolocation_bloc.dart';
import 'package:mobile/shared/repositories/geolocation/geolocation_repository.dart';

import 'screens/nav_pages/home/home_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: Environment.fileName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(
          create: (context) => ProducerService(),
        ),
        RepositoryProvider(
          create: (context) => GeolocationRepository(),
        ),
        RepositoryProvider(
          create: (context) => ProductService(),
        ),
        BlocProvider(
          create: (context) =>
              GeolocationBloc(geolocationRepository: GeolocationRepository()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const LoginScreen(),
          "/signup": (context) => const SignupScreen(),
          "/home": (context) => NavigationPage(),
          "/addLocation": (context) => const AddLocationScreen(),
          "/locationDescription": (context) =>
              const LocationDescriptionScreen(),
          "/runningStatus": (context) => const RunningStatusScreen(),
          "/orderDetails": (context) => const OrderDetailsScreen(),
          "/scanQRCode": (context) => QRCodeReaderScreen()
        },
        onGenerateRoute: (settings) {
          if(settings.name == "/productDetails"){
            return MaterialPageRoute(builder: (context) => ProductDetailsScreen(productId: settings.arguments as String));
          }
        },
      ),
    );
  }
}
