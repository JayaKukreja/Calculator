import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: 'Calculator'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String equation = "0";
  String result = "";
  String expression = "";
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.h),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          equation,
                          softWrap: true,
                          style:
                              TextStyle(color: Colors.white, fontSize: 30.sp),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        result,
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white, fontSize: 40.sp),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        calcButton("AC", Colors.grey[500] ?? Colors.grey,
                            Colors.black),
                        ElevatedButton(
                          onPressed: (() {
                            buttonPressed("X");
                          }),
                          style: ElevatedButton.styleFrom(
                              alignment: Alignment.centerRight,
                              shape: const StadiumBorder(),
                              fixedSize: Size(180.w, 55.h),
                              padding: EdgeInsets.only(right: 30.w),
                              // padding: EdgeInsets.all(20),
                              backgroundColor: Colors.grey[700]),
                          child: Text(
                            "X",
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        calcButton("/", Colors.amber[700] ?? Colors.amber,
                            Colors.white),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        calcButton(
                            "7", Colors.grey[700] ?? Colors.grey, Colors.white),
                        calcButton(
                            "8", Colors.grey[700] ?? Colors.grey, Colors.white),
                        calcButton(
                            "9", Colors.grey[700] ?? Colors.grey, Colors.white),
                        calcButton("x", Colors.amber[700] ?? Colors.amber,
                            Colors.white),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        calcButton(
                            "4", Colors.grey[700] ?? Colors.grey, Colors.white),
                        calcButton(
                            "5", Colors.grey[700] ?? Colors.grey, Colors.white),
                        calcButton(
                            "6", Colors.grey[700] ?? Colors.grey, Colors.white),
                        calcButton("-", Colors.amber[700] ?? Colors.amber,
                            Colors.white),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        calcButton(
                            "1", Colors.grey[700] ?? Colors.grey, Colors.white),
                        calcButton(
                            "2", Colors.grey[700] ?? Colors.grey, Colors.white),
                        calcButton(
                            "3", Colors.grey[700] ?? Colors.grey, Colors.white),
                        calcButton("+", Colors.amber[700] ?? Colors.amber,
                            Colors.white),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: (() {
                            buttonPressed("0");
                          }),
                          style: ElevatedButton.styleFrom(
                              alignment: Alignment.centerLeft,
                              shape: const StadiumBorder(),
                              fixedSize: Size(180.w, 55.h),
                              padding: EdgeInsets.only(left: 30.w),
                              // padding: EdgeInsets.all(20),
                              backgroundColor: Colors.grey[700]),
                          child: Text(
                            "0",
                            style: TextStyle(
                              fontSize: 22.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        calcButton(
                            ".", Colors.grey[700] ?? Colors.grey, Colors.white),
                        calcButton("=", Colors.amber[700] ?? Colors.amber,
                            Colors.white),
                      ],
                    ),
                    SizedBox(height: 10.h)
                  ],
                ),
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget calcButton(String txt, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: (() {
        buttonPressed(txt);
      }),
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          fixedSize: Size(50.w, 50.h),
          // padding: EdgeInsets.all(20),
          backgroundColor: btnColor),
      child: Text(
        txt,
        style: TextStyle(fontSize: 22.sp, color: txtColor),
      ),
    );
  }

  buttonPressed(String btnTxt) {
    setState(() {
      if (btnTxt == "AC") {
        equation = "0";
        result = "0";
      } else if (btnTxt == "X") {
        equation = equation.substring(0, equation.length - 1);

        if (equation == "") {
          equation = "0";
        }
      } else if (btnTxt == "=") {
        expression = equation;
        expression = expression.replaceAll("x", "*");
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = btnTxt;
        } else {
          equation += btnTxt;
        }
      }
    });
  }
}
