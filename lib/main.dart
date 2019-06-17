import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // Causes a crash in Profile mode, maybe the graphics aren't initialized yet?
  //SystemChannels.skia.invokeMethod("Skia.setResourceCacheMaxBytes", 104857600);
  runApp(MyApp());
}

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
  @override
  void initState()
  {
    super.initState();
    // Also causes a crash in Profile mode...
    //SystemChannels.skia.invokeMethod("Skia.setResourceCacheMaxBytes", 104857600);
  }
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey,
        body: Stack(
          children: [
            Positioned.fill(
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: _isChecked ? 4 : 0.25,
                  heightFactor: _isChecked ? 4 : 0.25,
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
                      // Finally works, but not ideal...
                      // Comment this in to limit memory usage.
                      //SystemChannels.skia.invokeMethod("Skia.setResourceCacheMaxBytes", 104857600);
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
