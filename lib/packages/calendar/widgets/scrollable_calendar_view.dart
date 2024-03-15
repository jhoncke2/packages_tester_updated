// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:packages_tester_updated/packages/calendar/bloc/calendar_bloc.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class ScrollableCalendarView extends StatelessWidget {
  final List<DateTime> specialDates = <DateTime>[];

  static defineDates(List<DateTime> dates){
    for(int y = 2000; y < 2004; y++){
      for(int m = 1; m <= 12; m++){
        for(int d = (m%2)+1; d <= 28; d ++){
          if(d%8 < 6 && d != m%10){
            dates.add(DateTime(y, m, d));
          }
        }
      }
    }
  }

  late DateTime initSelectedDay;
  final calendarBloc = CalendarBloc();
  ScrollableCalendarView({Key? key}) : super(key: key){
    defineDates(specialDates);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final controller = CleanCalendarController(
      minDate: specialDates.first,
      maxDate: specialDates.last,
      onDayTapped: (day){
        print('tapped: $day');
      }
    );
    controller.addListener((){
      final rangeMinDate = controller.rangeMinDate;
      if(rangeMinDate != null){
        final rangeMaxDate = controller.rangeMaxDate;
        if(rangeMaxDate == null){
          initSelectedDay = rangeMinDate;
        }else{
          controller.clearSelectedDates();
          if(initSelectedDay.isAtSameMomentAs(rangeMinDate)){
            initSelectedDay = rangeMaxDate;
          }else{
            initSelectedDay = rangeMinDate;
          }
          controller.rangeMinDate = initSelectedDay;
        }
      }
    });
    return BlocProvider<CalendarBloc>(
      create: (_) => calendarBloc,
      child: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Información de los reportes'
              )
            )
          ),
          SizedBox(
            height: screenHeight * 0.5,
            child: BlocBuilder<CalendarBloc, CalendarState>(
              builder: (context, state) {
                return ScrollableCleanCalendar(
                  dayBackgroundColor: Colors.green,
                  locale: 'es',
                  dayBuilder: (_, dayValues){
                    final isSpecial = _getPosition(dayValues.day, specialDates) >= 0;
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: (dayValues.isSelected)?
                          Colors.blueAccent:
                            (isSpecial)?
                              Colors.purple.withOpacity(0.4):
                              Colors.transparent
                      ),
                      child: Center(
                        child: Text(
                          dayValues.text,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: (dayValues.isLastDayOfWeek)?
                              FontWeight.bold:
                              FontWeight.normal
                          )
                        )
                      )
                    );
                  },
                  calendarController: controller,
                  layout: Layout.BEAUTY,
                );
              }
            )
          )
        ]
      )
    );
  }

  int _getPosition(DateTime x, List<DateTime> elements){
    return _searchDate(elements, x, 0, elements.length-1);
  }

  int _searchDate(List<DateTime> elements, DateTime x, int left, int right){
    int m = left + ((right - left)/2).ceil();
    final mComparison = _isSameDay(elements[m], x);
    if(mComparison == 0){
      return m;
    }else if(left >= right){
      return -1;
    }else if(mComparison > 0){
      return _searchDate(elements, x, left, m-1);
    }else{
      return _searchDate(elements, x, m, right);
    }
  }

  int _isSameDay(DateTime day1, DateTime day2) =>
      13 * 32 * (day1.year - day2.year)
      + 32 * (day1.month - day2.month)
      + day1.day - day2.day;
}