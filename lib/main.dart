import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'keyboard.dart';
import 'model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

PanelController _pc = PanelController();
KeyboardModel keyboard = KeyboardModel();

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var customKeyboard;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        title: 'Flutter Keyboard Demo',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            automaticallyImplyLeading: true,
            title: Text('Flutter Keyboard Demo'),
          ),
          body:
            SlidingUpPanel(
              controller: _pc,
              color: Colors.blue,
              renderPanelSheet: false,
              backdropEnabled: true,
              minHeight: 0,
              maxHeight: 300,
              parallaxEnabled: true,
              isDraggable: true,
              panelSnapping: true,
              panel: customKeyboard,
              body:
                Center(
                  child:
                    Observer(
                      builder: (_) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            buttonRow('Value of Something', keyboard.valA, 'valA'),
                            buttonRow('Value of Something Else', keyboard.valB, 'valB'),
                          ],
                        );
                      }
                    ),
                ),
            ),
        ),
      );
  }

  buttonRow(label, value, key) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child:
          Padding(
            padding: EdgeInsets.only(left: 10),
            child:
            Text(label,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: inputButton(value, key),
        ),
      ]
    );
  }

  inputButton(value, key) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
          onPressed: () async {
            await keyboard.setWorkingValue(value);
            setState(() {
              customKeyboard = CustomKeyboard(
                pc: _pc,
                keyboard: keyboard,
                modelKey: key
              );
            });
            _pc.open();
          },
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
            child:
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: value.toString(),
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white
                      ),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
          ),
        ),
      ]
    );
  }
}
