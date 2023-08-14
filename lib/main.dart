import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'my_counter.dart';

void main() {
  runApp(ChangeNotifierProvider<Counter>(
    child: const MyApp(),
    create: (_) => Counter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'provider',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProviderCounterExample(),
    );
  }
}

//provider counter.dart
class Counter with ChangeNotifier {
  int _count = 0;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class ProviderCounterExample extends StatelessWidget {
  const ProviderCounterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("You have pushed the button this many times: "),
            Text(
              '${Provider.of<Counter>(context)._count}',
              style: Theme.of(context).textTheme.headlineLarge,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<Counter>(context, listen: false).increment(),
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
        ),
      ),
    );
  }
}
/**
 * Below are classes for inherited widget🔥😆
 */
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         useMaterial3: true,
//       ),
//       home: const MyCounterInheritedWidget(
//           child: MyHomePage(
//         title: 'Flutter Demo Home Page',
//       )),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     Key? key,
//     required this.title,
//   }) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Title',
//         ),
//       ),
//       body: const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Counter value',
//             ),
//             MyTextWidget(),
//             MyButton(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyTextWidget extends StatelessWidget {
//   const MyTextWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print('Text widget builds');
//     return Text(
//       MyCounterInheritedWidget.of(context).counterValue.toString(),
//     );
//   }
// }

// class MyButton extends StatelessWidget {
//   const MyButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print('Button widget builds');
//     return ElevatedButton(
//       onPressed: () {
//         MyCounterInheritedWidget.of(context).incrementCounter();
//       },
//       child: const Text('Add'),
//     );
//   }
// }
