import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';

class sample3 extends StatefulWidget {
  @override
  _sample3State createState() => _sample3State();
}

class _sample3State extends State<sample3> {
  @override
  Widget build(BuildContext context) {

    final fromDate = DateTime(2020, 01, 22);
    final toDate = DateTime.now();

    final date1 = DateTime.now().subtract(Duration(days: 2));
    final date2 = DateTime.now().subtract(Duration(days: 3));

    List<DataPoint> hahaha = [];
    List<DataPoint> hehehe = [];

    for (var k = 0; k < 80; k++){

      hahaha.add(DataPoint<DateTime>(value: k + 0.0, xAxis: fromDate.add(Duration(days: k))));
      hehehe.add(DataPoint<DateTime>(value: k + 4.0, xAxis: fromDate.add(Duration(days: k))));
    }



    return Material(
      child: Center(
        child: Container(
          color: Colors.blueGrey,
          height: MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width / 1.5,
          child: BezierChart(
            fromDate: fromDate,
            bezierChartScale: BezierChartScale.WEEKLY,
            toDate: toDate,
            selectedDate: toDate,
            series: [
              BezierLine(
                label: "Casos",
                onMissingValue: (dateTime){
                  if(dateTime.day.isEven){
                    return 10.0;
                  }
                  return 5.0;
                },
                data: hahaha,
              ),
            ],
            config: BezierChartConfig(
              verticalIndicatorStrokeWidth: 3.0,
              verticalIndicatorColor: Colors.black26,
              pinchZoom: false,
              showVerticalIndicator: true,
              verticalIndicatorFixedPosition: false,
              backgroundColor: Colors.green,
              footerHeight: 30.0,
              snap: false,
              displayYAxis: true,
              stepsYAxis: 200,
              xAxisTextStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              yAxisTextStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              bubbleIndicatorColor: Colors.black, // cor da caixa de texto
              bubbleIndicatorLabelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
              bubbleIndicatorTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.green),
              bubbleIndicatorValueStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.green),
            ),
          ),
        ),
      ),
    );
  }
}
