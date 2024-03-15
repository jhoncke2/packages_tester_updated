import 'package:flutter/material.dart';
import 'package:vcard_formatter/vcard_formatter.dart';

class VCardFormatterView extends StatefulWidget {
  const VCardFormatterView({Key? key}) : super(key: key);

  @override
  State<VCardFormatterView> createState() => _VCardFormatterViewState();
}

class _VCardFormatterViewState extends State<VCardFormatterView> {
  late bool _dataIsLoaded;
  late VCard _formatter;
  @override
  void initState() {
    _dataIsLoaded = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _managePostFrameCallBack(context);
    return Center(
      child: (
        _dataIsLoaded?
          Column(
            children: [
              Text(
                _formatter.title ?? 'No Title'
              )
            ],
          ): Container()
      ),
    );
  }

  void _managePostFrameCallBack(BuildContext context){
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      if(!_dataIsLoaded){
        final text = await DefaultAssetBundle.of(context).loadString('assets/v_cards/card.vcard');
        setState(() {
          _formatter = VCard(text);
          print(_formatter.title);
          print(_formatter.name?.firstName);
          _dataIsLoaded = true;
        });
      }
    });
  }
}