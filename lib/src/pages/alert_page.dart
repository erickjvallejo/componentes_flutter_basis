import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Show Alert'),
            color: Colors.blue,
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: () => _showAlert(context)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('My Title'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('This is the alert content, pretty simple!'),
                FlutterLogo(size: 100.0)
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop()),
              FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}
