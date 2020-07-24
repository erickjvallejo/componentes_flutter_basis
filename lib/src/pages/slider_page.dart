import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 200.0;
  bool _lockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckbox(),
            _crearSwitch(),
            Expanded(child: _createImage())
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: '',
      // divisions: 100 ,
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged: (_lockCheck)
          ? null
          : (valor) {
              setState(() {
                _sliderValue = valor;
              });
            },
    );
  }

  Widget _createImage() {
    return FadeInImage(
      placeholder: AssetImage('assets/jar-loading.gif'),
      image: NetworkImage(
          'https://dam.smashmexico.com.mx/wp-content/uploads/2017/08/03202708/dc-top-5-los-mejores-momentos-de-batman-escritos-por-scott-snyder-cover.jpg'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckbox() {
    return CheckboxListTile(
        title: Text('Lock Slider'),
        value: _lockCheck,
        onChanged: (value) {
          setState(() {
            _lockCheck = value;
          });
        });
  }

  _crearSwitch() {
    return SwitchListTile(
        title: Text('Lock Slider'),
        value: _lockCheck,
        onChanged: (value) {
          setState(() {
            _lockCheck = value;
          });
        });
  }
}
