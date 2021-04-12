import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_app/presentation/screens/third_screen.dart';

import 'presentation/screens/home_screen.dart';
import 'logic/cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => BlocProvider.value(
                value: _counterCubit,
                child: HomeScreen(
                  title: 'Home Screen',
                  color: Colors.blueAccent,
                ),
              ),
          '/second': (context) => BlocProvider.value(
                value: _counterCubit,
                child: SecondScreen(
                  title: 'Second Screen',
                  color: Colors.redAccent,
                ),
              ),
          '/third': (context) => BlocProvider.value(
                value: _counterCubit,
                child: ThirdScreen(
                  title: 'Thrid Screen',
                  color: Colors.greenAccent,
                ),
              ),
        },
      ),
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}
