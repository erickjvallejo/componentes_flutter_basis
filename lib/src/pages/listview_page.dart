import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _numberList = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add10();
    _scrollController.addListener(() {
      // print('pixels: ${_scrollController.position.pixels}');
      // print('maxScrollExtent: ${_scrollController.position.maxScrollExtent}');

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lists'),
        ),
        body: Stack(
          children: <Widget>[
            _createList(),
            _createLoading(),
          ],
        ));
  }

  Widget _createList() {
    return RefreshIndicator(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numberList.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _numberList[index];

          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  'https://picsum.photos/500/300.jpg?image=$imagen'));
        },
      ),
      onRefresh: _getPage1,
    );
  }

  Future<Null> _getPage1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _numberList.clear();
      _lastItem++;
      _add10();
    });

    return Future.delayed(duration);
  }

  void _add10() {
    for (var i = 1; i <= 10; i++) {
      _lastItem++;
      _numberList.add(_lastItem);
    }

    setState(() {});
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    return new Timer(duration, _httpResponse);
  }

  void _httpResponse() {
    _isLoading = false;

    // Mueve la lista del final cuando esta cargada
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);

    _add10();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
