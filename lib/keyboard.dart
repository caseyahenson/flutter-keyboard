import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomKeyboard extends StatefulWidget {

  final keyboard;
  final pc;
  final modelKey;

  CustomKeyboard({Key key,
    @required
    this.keyboard,
    @required
    this.pc,
    @required
    this.modelKey,
  }) : super(key: key);

  _CustomKeyboardState createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {

  bool showDecimal = true; //pass logic to toggle this

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child:
          Scaffold(
            body:
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border(
                    top: BorderSide(
                        width: 2.0,
                        color: Colors.black12
                    ),
                  ),
                ),
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child:
                ListView(
                  children: <Widget>[
                    Row (
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Observer(
                          builder: (_) {
                            return Container(
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0,
                                      color: Colors.black12
                                  ),
                                ),
                              ),
                              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 10.0),
                              child:
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                child:
                                Text(
                                  widget.keyboard.workingValue.toString() ?? '',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }
                        ),
                        affirmationButton(context)
                      ]
                    ),
                    Row (
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          numericInputButton(1),
                          numericInputButton(2),
                          numericInputButton(3),
                        ]
                    ),
                    Row (
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          numericInputButton(4),
                          numericInputButton(5),
                          numericInputButton(6),
                        ]
                    ),
                    Row (
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        numericInputButton(7),
                        numericInputButton(8),
                        numericInputButton(9),
                      ],
                    ),
                    Visibility(
                      child:
                        Row (
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            numericInputButton('.'),
                            numericInputButton(0),
                            backButton()
                          ]
                        ),
                        visible: showDecimal
                    ),
                    Visibility(
                      child:
                        Row (
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            blankSpace(),
                            numericInputButton(0),
                            backButton()
                          ]
                        ),
                        visible: !showDecimal
                    ),
                  ],
                ),
              ),
          ),
        ),
    );
  }

  _appendToInput(value) async {
    bool hasErrors = false;
    /*
    reset zero to blank
     */
    if (widget.keyboard.workingValue == '0') {
      widget.keyboard.setWorkingValue('');
    }
    /*
    prevent decimal from being appended to empty string
     */
    if (value == '.' && widget.keyboard.workingValue == '') {
      hasErrors = true;
      /*
      TODO: tell user that the input cannot begin with a decimal
       */
    }
    /*
    prevent second decimal from begin appended to string
     */
    if (value == '.' && widget.keyboard.workingValue.contains('.')) {
      hasErrors = true;
      /*
      TODO: tell user that there cannot be a second decimal used in this input
       */
    }
    /*
    if no errors, append input to current value
     */
    if (!hasErrors) {
      var newVal = widget.keyboard.workingValue == '' ? value.toString() : widget.keyboard.workingValue + value.toString();
      await widget.keyboard.setWorkingValue(newVal);
    }
  }
  _removeFromInput() async {
    var val = widget.keyboard.workingValue.substring(0, widget.keyboard.workingValue.length-1);
    if (val.length == 0) {
      val = '0';
    }
    await widget.keyboard.setWorkingValue(val);
  }

  numericInputButton(value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            _appendToInput(value);
          },
          color: Colors.blue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value.toString(),
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white
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

  blankSpace() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            //no action
          },
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(''),
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
          ),
        ),
      ]
    );
  }

  backButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            _removeFromInput();
          },
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.backspace),
          ),
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
          ),
        ),
      ]
    );
  }

  affirmationButton(context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
      child:
        RaisedButton(
          onPressed: () async {
            var compareTo = widget.modelKey == 'valA' ? widget.keyboard.valA : widget.keyboard.valB;
            if (widget.keyboard.workingValue.toString() == compareTo) {
              /*
              TODO: Let user know that no changes are made.
               */
            } else {
              /*
              TODO: Do something with the updated data.
               */
              if (widget.modelKey == 'valA') {
                await widget.keyboard.setValA(widget.keyboard.workingValue);
              } else if (widget.modelKey == 'valB') {
                await widget.keyboard.setValB(widget.keyboard.workingValue);
              }
            }
            widget.pc.close();
          },
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'save',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
          ),
        ),
      );
  }
}