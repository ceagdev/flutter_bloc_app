import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/presentation/screens/second_screen.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (newContext) => BlocProvider.value( // newContext for be able to refere the Cubit in the context.
                          value: BlocProvider.of<CounterCubit>(context),
                          child: SecondScreen(
                            title: 'Second Screen',
                            color: Colors.redAccent,
                          ),
                        )));
              },
              child: Text(
                'Go to 2nd Screen',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
