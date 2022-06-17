import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '系統図テスト',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '系統図テスト'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      // body: ListView(
      //   padding: const EdgeInsets.all(10),
      //   scrollDirection: Axis.horizontal,
      //   children: [
      //     Container(
      //       color: Colors.red,
      //       height: 100,
      //       width: 100,
      //       padding: const EdgeInsets.all(10),
      //     ),
      //     Container(
      //       color: Colors.amber,
      //       height: 100,
      //       width: 100,
      //       padding: const EdgeInsets.all(10),
      //     ),
      //   ],
      // ),

      body: InteractiveViewer(
        boundaryMargin: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            /// 1番目のボタン
            ElevatedButton(
              onPressed: () {},
              child: const Text('first'),
            ),

            /// 線
            SizedBox(
              width: screenSize.width,
              height: 50,
              child: CustomPaint(
                painter: _LinePainter(),
                // painter: _TestPainter(),
              ),
            ),

            /// 2番目と3番目
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                /// 2番目のボタン
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('second'),
                ),

                /// 3番目のボタン
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('third'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// paintの定義
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2;

    /// Lineを描く
    canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 3, size.height), paint);
    canvas.drawLine(Offset(size.width / 2, 0),
        Offset(size.width * 2 / 3, size.height), paint);
  }

  /// Repaintはfalse
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _TestPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /// paintの定義
    final paint = Paint();

    /// Firstの箱
    paint.color = Colors.green;
    canvas.drawRect(const Rect.fromLTWH(0, 0, 40, 100), paint);

    /// FirstとSecondの間の線
    paint.strokeWidth = 3;
    paint.color = Colors.grey;
    canvas.drawLine(const Offset(40, 50), const Offset(150, 50), paint);

    /// Secondの箱
    paint.color = Colors.green;
    canvas.drawRect(const Rect.fromLTWH(150, 0, 40, 100), paint);

    /// FirstとThirdの間の線
    paint.color = Colors.grey;
    canvas.drawLine(const Offset(40, 50), const Offset(150, 170), paint);

    /// Thirdの箱
    paint.color = Colors.green;
    canvas.drawRect(const Rect.fromLTWH(150, 120, 40, 100), paint);
  }

  /// Repaintはfalse
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
