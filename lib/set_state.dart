import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SetStateMng(),
    );
  }
}

class SetStateMng extends StatefulWidget {
  const SetStateMng({super.key});

  @override
  State<SetStateMng> createState() => _SetStateMngState();
}

class _SetStateMngState extends State<SetStateMng> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Lifting state up"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                var value = await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PageTwo(
                    counter: _counter,
                    callback: (value) {
                      setState(() {
                        _counter = value;
                      });
                    },
                  ),
                ));
                if (value != null) {
                  setState(() {
                    _counter = value;
                  });
                }
              },
              child: const Icon(
                Icons.beenhere,
              ),
            ),
            Text(
              _counter.toString(),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () async {
                var value = await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PageOne(
                    counter: _counter,
                    callback: (value) {
                      setState(() {
                        _counter = value;
                      });
                    },
                  ),
                ));
                if (value != null) {
                  setState(() {
                    _counter = value;
                  });
                }
              },
              child: const Icon(
                Icons.beenhere,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//For the Optional Callenge - setState - Just cloned and changed the class names
// ignore: must_be_immutable
class PageTwo extends StatefulWidget {
  final Function(int) callback;
  //Let's use a callback to call a function declared in the parent class
  int counter;
  PageTwo({
    super.key,
    required this.counter,
    required this.callback,
  });

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  void _incrementCounter() {
    setState(() {
      widget.counter++;
    });
    widget.callback(widget.counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              /**
               * Navigator.of(context).pop(widget.counter);
               * Whatever you put inside the pop function, is returned to the parent class or function
               */
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  _incrementCounter();
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                )),
            Text(
              widget.counter.toString(),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PageOne extends StatefulWidget {
  final Function(int) callback;
  //Let's use a callback to call a function declared in the parent class
  int counter;
  PageOne({
    super.key,
    required this.counter,
    required this.callback,
  });

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  void _incrementCounter() {
    setState(() {
      widget.counter++;
    });
    widget.callback(widget.counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              /**
               * Navigator.of(context).pop(widget.counter);
               * Whatever you put inside the pop function, is returned to the parent class or function
               */
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  _incrementCounter();
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                )),
            Text(
              widget.counter.toString(),
            )
          ],
        ),
      ),
    );
  }
}
