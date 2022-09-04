import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      // home: ChangeNotifierProvider<CounterProvider>(
      //     create: (BuildContext context) => CounterProvider(),
      //     child: const MyHomePage(title: 'Flutter Demo Home Page')),
      // ValueNotifier is used wen we are just updating a piece of value and listeners
      home: ChangeNotifierProvider<ValueNotifier<int>>(
          create: (BuildContext context) => ValueNotifier<int>(0),
          child: const MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    // final counter = Provider.of<CounterProvider>(context, listen: false);
    final counter = Provider.of<ValueNotifier<int>>(context, listen: false);
    // setting listen to false means avoiding unnecearry rebuild of the whole widget while using consumer
    // on a particular widget for its onlty to be rebuild
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          // Consumer<CounterProvider>(
          //     builder: (BuildContext context, counter, Widget? child) => Text(
          //       '${counter.value}',
          //       style: Theme.of(context).textTheme.headline4,
          //     ),
          //   ),
           Consumer<ValueNotifier<int>>(
              builder: (BuildContext context, counter, Widget? child) => Text(
                '${counter.value}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => counter.increment(),
          onPressed: () => counter.value++,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
