import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator/providers/ThemeProvider.dart';
import 'package:tip_calculator/widgets/bill_amount_field.dart';
import 'package:tip_calculator/widgets/person_counter.dart';
import 'package:tip_calculator/widgets/tip_row.dart';
import 'package:tip_calculator/widgets/tip_slider.dart';
import 'package:tip_calculator/widgets/toggle_theme_button.dart';
import 'package:tip_calculator/widgets/total_per_person.dart';

void main() => runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
    child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      // Application name
      title: 'WeTip',
      debugShowCheckedModeBanner: false,
      // Application theme data, you can set the colors for the application as
      // you want
      theme: themeProvider.currentTheme,
      // A widget which will be started on application startup
      home: const WeTip(),
    );
  }
}

class WeTip extends StatefulWidget {
  const WeTip({super.key});

  @override
  State<WeTip> createState() => _WeTipState();
}

class _WeTipState extends State<WeTip> {
  int _personCount = 1;
  double _tipPercentage = 0;
  double _billTotal = 0;

  double totalPerPerson() {
    return ((totalTip() + _billTotal) / _personCount);
  }

  double totalTip() {
    return (_billTotal * _tipPercentage);
  }

  void increment() {
    setState(() {
      _personCount++;
    });
  }

  void decrement() {
    setState(() {
      if (_personCount > 1) _personCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    double total = totalPerPerson();
    double totalT = totalTip();
    return Scaffold(
      appBar: AppBar(
        title: const Text("WeTip"),
        actions: [ToggleThemeButton()],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerPerson(total: total),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.deepPurple, width: 2)),
              child: Column(children: [
                BillAmountField(
                  billAmount: _billTotal.toString(),
                  onChanged: (value) {
                    setState(() {
                      _billTotal = double.parse(value);
                    });
                    //print("Amount : $value");
                  },
                ),
                PersonCounter(
                  personCount: _personCount,
                  onDecrement: decrement,
                  onIncrement: increment,
                ),
                TipRow(totalT: totalT),
                Text('${(_tipPercentage * 100).round()}%'),
                TipSlider(
                  tipPercentage: _tipPercentage,
                  onChanged: (double value) {
                    setState(() {
                      _tipPercentage = value;
                    });
                  },
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
