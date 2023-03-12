import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ma_friperie/controllers/app.controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late AppMainController appMainController;

  @override
  void initState() {
    appMainController = Get.find();

    super.initState();
  }

  void _incrementCounter() {
    appMainController.incrementCounter();
  }

  void _save() {
    appMainController.saveCounter();
  }

  void _decrementCounter() {
    appMainController.decrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("widget.title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times : ',
            ),
            Obx(() => Text(
                  '${appMainController.counter.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          const Spacer(),
          FloatingActionButton(
            backgroundColor: Colors.amber,
            heroTag: "minus",
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Text(' -1 '),
          ),
          const Spacer(),
          FloatingActionButton(
            backgroundColor: Colors.amber,
            heroTag: "save",
            onPressed: _save,
            tooltip: 'Save',
            child: const Icon(Icons.save),
          ),
          const Spacer(),
          FloatingActionButton(
            heroTag: "add",
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Text(' +1 '),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
