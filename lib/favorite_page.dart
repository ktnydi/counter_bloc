import 'package:counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterBloc>(
      builder: (_, bloc, __) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Favorite'),
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  StreamBuilder<int>(
                    stream: bloc.counterController.stream,
                    initialData: 0,
                    builder: (context, snapshot) {
                      if (snapshot.error != null) {
                        return Center(
                          child: Text('エラーが発生しました。'),
                        );
                      }

                      return Text(
                        '${snapshot.data}',
                        style: Theme.of(context).textTheme.headline4,
                      );
                    },
                  ),
                  Text('current counter value.'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    child: Text('増加'),
                    onPressed: () {
                      bloc.counterActionController.sink.add(null);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
