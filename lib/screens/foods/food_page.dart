import 'package:flutter/material.dart';

class FoodsScreen extends StatefulWidget {
  FoodsScreen({Key key}) : super(key: key);

  @override
  _FoodsScreenState createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EspecializaTi Res"),
        centerTitle: true,
      ),
      body: _buildFoods(),
    );
  }

  Widget _buildFoods() {
    return Text('foods...');
  }
}
