import 'package:flutter/material.dart';
import 'package:packages_tester_updated/globals/app_dimens.dart';
import 'package:packages_tester_updated/modules/widgets_grid/zone.dart';
class WidgetsGridPage extends StatefulWidget {
  static const _rows = 15;
  static const _columns = 15;

  const WidgetsGridPage({Key? key}) : super(key: key);

  @override
  State<WidgetsGridPage> createState() => _WidgetsGridPageState();
}

class _WidgetsGridPageState extends State<WidgetsGridPage> {
  late List<Zone> selectedZones;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    selectedZones = const [
      Zone(
        init: Offset(0,0),
        end: Offset(1,2)
      )
    ];
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: AppDimens.widthPercentage(1, context),
          height: AppDimens.widthPercentage(1, context),
          child: Stack(
            children: [
              Image.asset(
                'assets/widgets_grid/design_1.PNG',
                width: AppDimens.widthPercentage(1, context),
                height: AppDimens.heightPercentage(0.4, context)
              ),
              SizedBox(
                width: AppDimens.widthPercentage(1, context),
                height: AppDimens.widthPercentage(1, context),
                child: Column(
                  children: List<Widget>.generate(
                    WidgetsGridPage._rows,
                    (row) => SizedBox(
                      height: AppDimens.heightPercentage(0.4, context) / WidgetsGridPage._rows,
                      child: Row(
                        children: List<Widget>.generate(
                          WidgetsGridPage._columns,
                          (col){
                            final sides = _getSineInZone(col, row, selectedZones);
                            return Flexible(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: sides.contains(ZoneSide.right)?
                                        Colors.blueAccent:
                                        Colors.redAccent
                                    ),
                                    bottom: BorderSide(
                                      color: sides.contains(ZoneSide.bottom)?
                                        Colors.blueAccent:
                                        Colors.redAccent
                                    )
                                  )
                                )
                              )
                            );
                          }
                        )
                      ),
                    )
                  )
                )
              )
            ]
          ),
        )
      )
    );
  }

  List<ZoneSide> _getSineInZone(int x, int y, List<Zone> zones){
    final sides = <ZoneSide>[];
    for(final zone in zones){
      final zoneInit = zone.init;
      final zoneEnd = zone.end;
      if(x >= zoneInit.dx && y >= zoneInit.dy && x <= zoneEnd.dx && y <= zoneEnd.dy){
        if(x == zoneInit.dx && y >= zoneInit.dy && y <= zoneEnd.dy){
          sides.add(ZoneSide.left);
        }
        if(x == zoneEnd.dx && y >= zoneInit.dy && y <= zoneEnd.dy){
          sides.add(ZoneSide.right);
        }
        if(y == zoneInit.dy && x >= zoneInit.dx && x <= zoneEnd.dx){
          sides.add(ZoneSide.top);
        }
        if(y == zoneEnd.dy && x >= zoneInit.dx && x <= zoneEnd.dx){
          sides.add(ZoneSide.bottom);
        }
        break;
      }
    }
    return sides;
  }
}