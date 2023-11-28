import 'package:bloc_test/bloc/color_bloc/color_bloc.dart';
import 'package:bloc_test/bloc/color_bloc/color_state.dart';
import 'package:bloc_test/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_test/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_test/bloc/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // BlocSelector<CounterBloc, CounterState, bool>(
            //     selector: (state) => state.counter >= 3 ? true : false,
            //     builder: (context, state) {
            //       return Center(
            //         child: Container(
            //           color: state ? Colors.green : Colors.red,
            //           width: 200,
            //           height: 200,
            //         ),
            //       );
            //     }),
            // BlocConsumer<CounterBloc, CounterState>(builder: (context, state) {
            //   return Text(state.counter.toString());
            // }, listener: (context, state) {
            //   if (state.counter >= 5) {
            //     final snackBar = SnackBar(
            //       /// need to set following properties for best effect of awesome_snackbar_content
            //       elevation: 0,
            //       behavior: SnackBarBehavior.floating,
            //       backgroundColor: Colors.transparent,
            //       content: AwesomeSnackbarContent(
            //         title: 'Working!',
            //         message: 'This is an example of Bloc Listener!',

            //         /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            //         contentType: ContentType.success,
            //       ),
            //     );
            //     ScaffoldMessenger.of(context)
            //       ..hideCurrentSnackBar()
            //       ..showSnackBar(snackBar);
            //   }
            // }),
            // BlocListener<CounterBloc, CounterState>(
            //   listenWhen: (previous, current) => true,
            //   listener: (context, state) {
            //     // if (state.counter >= 5) {
            //     //   final snackBar = SnackBar(
            //     //     /// need to set following properties for best effect of awesome_snackbar_content
            //     //     elevation: 0,
            //     //     behavior: SnackBarBehavior.floating,
            //     //     backgroundColor: Colors.transparent,
            //     //     content: AwesomeSnackbarContent(
            //     //       title: 'Working!',
            //     //       message: 'This is an example of Bloc Listener!',

            //     //       /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            //     //       contentType: ContentType.success,
            //     //     ),
            //     //   );
            //     //   ScaffoldMessenger.of(context)
            //     //     ..hideCurrentSnackBar()
            //     //     ..showSnackBar(snackBar);
            //     // }
            //   },
            //   child: Text('Bloc listener'),
            // ),

            BlocBuilder<ColorBloc, ColorState>(
                // buildWhen: (previous, current) {
                // print(previous.color);
                // print(current.color);
                // return current.counter >= 5;
                // },
                builder: (context, state) {
              return Container(
                color: state.color,
                width: 200,
                height: 200,
              );
            }),
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text(state.counter.toString());
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterIncrementEvent());
                    context.read<ColorBloc>().add(CounterIncrementEvent());
                  },
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecrementEvent());
                    context.read<ColorBloc>().add(CounterDecrementEvent());
                  },
                  child: const Icon(Icons.remove),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
