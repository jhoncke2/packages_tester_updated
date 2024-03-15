import 'package:flutter/material.dart';
import 'package:simple_vcard_parser/simple_vcard_parser.dart';
class SimpleVCardParserView extends StatefulWidget {
  const SimpleVCardParserView({Key? key}) : super(key: key);

  @override
  State<SimpleVCardParserView> createState() => _SimpleVCardParserViewState();
}

class _SimpleVCardParserViewState extends State<SimpleVCardParserView> {
  late bool vcfIsStarted;

  @override
  void initState() {
    vcfIsStarted = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _managePostFrameCallBack(context);
    return Center(
      child: (
        vcfIsStarted?
          Text(
            'started'
          ): Container()
      ),
    );
  }

  void _managePostFrameCallBack(BuildContext context){
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      if(!vcfIsStarted){
        final text = await DefaultAssetBundle.of(context).loadString('assets/v_cards/card.vcard');
        final vcf = VCard(text);
        print('name: ${vcf.name}');
        print('gender: ${vcf.gender}');
        print('nickname: ${vcf.nickname}');
        print('position: ${vcf.position}');
        print('organisation: ${vcf.organisation}');
        print('title: ${vcf.title}');
        print('birthday: ${vcf.birthday}');
        print('categories: ${vcf.categories}');
        print('typedAddress: ${vcf.typedAddress}');
        print('typedEmail: ${vcf.typedEmail}');
        print('typedTelephone: ${vcf.typedTelephone}');
        print('typedURL: ${vcf.typedURL}');
        print('formattedName: ${vcf.formattedName}');
        print('lines: ${vcf.lines}');
        vcfIsStarted = true;
        //No funciona
        //setState(() {
        //  vcf = Vcf.decode(text);
        //  vcfIsStarted = true;
        //});
      }
    });
}}