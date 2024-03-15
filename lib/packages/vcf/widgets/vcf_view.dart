// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vcf/vcf.dart';
class VcfView extends StatefulWidget {
  const VcfView({Key? key}) : super(key: key);

  @override
  State<VcfView> createState() => _VcfViewState();
}

class _VcfViewState extends State<VcfView> {
  late Vcf vcf;
  late bool vcfIsStarted;

  @override
  void initState() {
    vcfIsStarted = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vcf = Vcf.decode('assets/v_cards/card.vcf');
    _managePostFrameCallBack(context);
    return Center(
      child: Column(
        children: [
          const Text('Vcf <<No funciona>>'),
          const SizedBox(
            height: 10
          ),
          (
            vcfIsStarted? Column(
              children: [
                Text(vcf.vCards.first.name?.givenNames.first ?? ''),
                SizedBox(
                  height: 10
                ),
                Text(vcf.vCards.first.email.first.value),
                SizedBox(
                  height: 10
                ),
                Text(vcf.vCards.first.address.first.street ?? ''),
                SizedBox(
                  height: 10
                ),
                Text(vcf.vCards.first.title.first.value)
              ]
            ): Container()
          )
        ],
      ),
    );
  }

  void _managePostFrameCallBack(BuildContext context){
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      if(!vcfIsStarted){
        final text = await DefaultAssetBundle.of(context).loadString('assets/v_cards/card.vcard');
        //No funciona
        //setState(() {
        //  vcf = Vcf.decode(text);
        //  vcfIsStarted = true;
        //});
      }
    });
  }
}