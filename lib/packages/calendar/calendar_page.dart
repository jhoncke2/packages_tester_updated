import 'package:flutter/material.dart';
import 'package:packages_tester_updated/packages/calendar/widgets/scrollable_calendar_view.dart';
import 'package:packages_tester_updated/packages/calendar/widgets/syncfusion_calendar_view.dart';
import 'package:packages_tester_updated/packages/calendar/widgets/table_calendar_view.dart';

class CalendarPage extends StatefulWidget {
  

  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late int navIndex;
  @override
  void initState() {
    navIndex = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                MaterialButton(
                  onPressed: (){
                    if(navIndex != 0){
                      setState(() {
                        navIndex = 0;
                      });
                    }
                  },
                  color: navIndex == 0?
                    Colors.blueAccent:
                    Colors.transparent,
                  child: Text(
                    'Syncfusion',
                    style: TextStyle(
                      color: navIndex == 0?
                        Colors.white:
                        Colors.black
                    )
                  )
                ),
                MaterialButton(
                  onPressed: (){
                    if(navIndex != 1){
                      setState(() {
                        navIndex = 1;
                      });
                    }
                  },
                  color: navIndex == 1?
                    Colors.blueAccent:
                    Colors.transparent,
                  child: Text(
                    'Table Calendar',
                    style: TextStyle(
                      color: navIndex == 1?
                        Colors.white:
                        Colors.black
                    )
                  )
                ),
                MaterialButton(
                  onPressed: (){
                    if(navIndex != 2){
                      setState(() {
                        navIndex = 2;
                      });
                    }
                  },
                  color: navIndex == 2?
                    Colors.blueAccent:
                    Colors.transparent,
                  child: Text(
                    'Scrollable Calendar',
                    style: TextStyle(
                      color: navIndex == 2?
                        Colors.white:
                        Colors.black
                    )
                  )
                )
              ]
            ),
            Expanded(
              child: IndexedStack(
                index: navIndex,
                children: [
                  SyncfusionCalendarView(),
                  TableCalendarView(),
                  ScrollableCalendarView()
                ]
              )
            )
          ]
        )
      )
    );
  }
}

