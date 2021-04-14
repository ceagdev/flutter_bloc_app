import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/constants/enums.dart';
import 'package:flutter_bloc_app/logic/cubit/internet_cubit.dart';
import '../../logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text('Wifi');
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return Text('Mobile');
                }else if (state is InternetDisconnected){
                  return Text('Disconnected');
                }
                return CircularProgressIndicator();
              },
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  Scaffold.of(context).showBottomSheet((context) {
                    return Text('Incremented');
                  });
                } else if (state.wasIncremented == false) {
                  Scaffold.of(context).showBottomSheet((context) {
                    return Text('Decremented');
                  });
                }
              },
              builder: (context, state) {
                return Text(
                  '${state.counterValue}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            SizedBox(
              height: 24,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     FloatingActionButton(
            //       onPressed: () {
            //         BlocProvider.of<CounterCubit>(context).increment();
            //       },
            //       tooltip: 'Increment',
            //       child: Icon(Icons.add),
            //     ),
            //     FloatingActionButton(
            //       onPressed: () {
            //         BlocProvider.of<CounterCubit>(context).decrement();
            //       },
            //       tooltip: 'Decrement',
            //       child: Icon(Icons.remove),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 24.0,
            // ),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: Text(
                'Go to 2nd Screen',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            MaterialButton(
              color: Colors.greenAccent,
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: Text(
                'Go to 3rd Screen',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
