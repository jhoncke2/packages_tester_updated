// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:packages_tester_updated/packages/vcf/widgets/flutter_contacts_view.dart';
import 'package:packages_tester_updated/packages/vcf/widgets/simple_vcard_parser_view.dart';
import 'package:packages_tester_updated/packages/vcf/widgets/v_cards_nav_button.dart';
import 'package:packages_tester_updated/packages/vcf/widgets/vcard_formatter_view.dart';
import 'package:packages_tester_updated/packages/vcf/widgets/vcf_view.dart';

class VCFPage extends StatefulWidget {

  const VCFPage({Key? key}) : super(key: key);

  @override
  State<VCFPage> createState() => _VCFPageState();
}

class _VCFPageState extends State<VCFPage> {
  late ScrollController _navController;
  late int viewIndex;

  @override
  void initState() {
    viewIndex = 0;
    _navController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: screenWidth,
              child: Scrollbar(
                controller: _navController,
                thickness: 4,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _navController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      VCardsNavButton(
                        onPressed: (){
                          setState(() {
                            viewIndex = 0;
                          });
                        },
                        isSelected: viewIndex == 0,
                        text: 'Vcf'
                      ),
                      VCardsNavButton(
                        onPressed: (){
                          setState(() {
                            viewIndex = 1;
                          });
                        },
                        isSelected: viewIndex == 1,
                        text: 'Simple Vcard Parser'
                      ),
                      VCardsNavButton(
                        onPressed: (){
                          setState(() {
                            viewIndex = 2;
                          });
                        },
                        isSelected: viewIndex == 2,
                        text: 'Flutter Contacts'
                      ),
                      VCardsNavButton(
                        onPressed: (){
                          setState(() {
                            viewIndex = 3;
                          });
                        },
                        isSelected: viewIndex == 3,
                        text: 'VCard Formatter'
                      )
                    ]
                  ),
                ),
              )
            ),
            (
              viewIndex == 0?
                VcfView():
                viewIndex == 1?
                  SimpleVCardParserView():
                  viewIndex == 2?
                    FlutterContactsView():
                    viewIndex == 3?
                      VCardFormatterView():
                      Container()
            )
          ]
        )
      )
    );
  }
}