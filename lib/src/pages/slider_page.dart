import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 200.0;
  bool _bloquearCheck = false;

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
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
            ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamanio de la imagen',
      // divisions: 100 ,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck) ? null : (valor) {
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

 Widget _crearImagen() {
   return Image(
     width: _valorSlider,
     fit: BoxFit.contain,
     image: NetworkImage(
       'https://dam.smashmexico.com.mx/wp-content/uploads/2017/08/03202708/dc-top-5-los-mejores-momentos-de-batman-escritos-por-scott-snyder-cover.jpg') ,
       );
 }

  Widget _crearCheckbox() {
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (valor){
    //     setState(() {
    //     _bloquearCheck = valor;          
    //     });
    //   });
    return CheckboxListTile(
      title: Text('Bloquear slider'),
    value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
        _bloquearCheck = valor;          
        });
      });
  }

  _crearSwitch() {

 return SwitchListTile(
      title: Text('Bloquear slider'),
    value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
        _bloquearCheck = valor;          
        });
      });

  }
}
