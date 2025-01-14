import 'package:ccp_dialog/country_picker/flutter_country_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Country Piker Dialog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String countryCode ="+91";
  Country selectedCountry = Country.IN;


  /*
  *   Rx<Country> selectedCountry = Country.IN.obs;
  var countryCode = "+91".obs;
  updateCountry(Country country)
  {
      selectedCountry.value = country;
      countryCode.value = "+" + country.dialingCode.toString();
  }
  * */

  _updateCountry(Country country){
    selectedCountry = country;
    countryCode = "+${country.dialingCode}";
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Select Country',
            ),
            Container(
                height: 45,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                   CountryPicker(
                      selectedCountry: selectedCountry,
                      dense: false,
                      showFlag: true,

                      //displays flag, true by default
                      showDialingCode: true,
                      //displays dialing code, false by default
                      showName: false,
                      withBottomSheet: true,
                      //displays country name, true by default
                      showCurrency: false,
                      //eg. 'British pound'
                      showCurrencyISO: false,
                      onChanged:_updateCountry
                   ),

                ]))
          ],
        ),
      ),
    );
  }
}
