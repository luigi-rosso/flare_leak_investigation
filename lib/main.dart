import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SampleWidget(),
    );
  }
}

class SampleWidget extends StatefulWidget {
  @override
  _SampleWidgetState createState() => _SampleWidgetState();
}

class _SampleWidgetState extends State<SampleWidget> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: _isChecked ? 10 : 0.25,
                  heightFactor: _isChecked ? 10 : 0.25,
                  child: FlareActor(
                    "assets/animation.flr",
                    animation: "Loader",
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Checkbox(
                  value: _isChecked,
                  onChanged: (bool value) {
                    setState(() {
                      _isChecked = value;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      );
}
