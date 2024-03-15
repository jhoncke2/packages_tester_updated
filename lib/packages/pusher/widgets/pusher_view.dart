import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';


class PusherView extends StatefulWidget {
  const PusherView({Key? key}) : super(key: key);

  @override
  State<PusherView> createState() => _PusherViewState();
}

class _PusherViewState extends State<PusherView> {

  late bool initialized;
  late PusherChannel channel;
  late bool stateValue;
  late http.Client client;
  
  @override
  void initState(){
    super.initState();
    client = http.Client();
    initialized = false;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    WidgetsBinding.instance.addPostFrameCallback((_){
      if(!initialized){
        _initialize();
      }
    });
    return SizedBox(
      width: screenWidth,
      child: (initialized)?
        Column(
          children: [
            MaterialButton(
              onPressed: ()async{
                final newState = stateValue? 1 : 0;
                await client.get(
                  Uri.https('gapfergon.com', 'api/cambiar-estado/$newState')
                );
              },
              color: Colors.blueAccent,
              child: const Text(
                'Cambiar estado',
                style: TextStyle(
                  color: Colors.white
                ),
              )
            ),
            Text(
              stateValue?
                'Seguro':
                'Falso'
            )
          ]
        ) : const Center(
          child: CircularProgressIndicator()
        )
    );
  }

  Future<void> _initialize()async{
    stateValue = false;
    const apiKey = 'e50804b26f82ab222673';
    PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
    try {
      await pusher.init(
        apiKey: apiKey,
        cluster: 'us2',
        onConnectionStateChange: null,
        onError: null,
        onSubscriptionSucceeded: (channelName, data){
          print('subscription succeed');
          print(channelName);
          print(data);
        },
        onEvent: (event){
          if(event.eventName == 'CambiarEstado'){
            final newState = jsonDecode(event.data)['content'] as bool;
            setState(() {
              stateValue = newState;
            });
          }else{
            print('*******event');
            print(event.eventName);
            print(event.data);
          }
        },
        onSubscriptionError: null,
        onDecryptionFailure: null,
        onMemberAdded: null,
        onMemberRemoved: null,
        // authEndpoint: "<Your Authendpoint>",
        // onAuthorizer: onAuthorizer
      );
      channel = await pusher.subscribe(channelName: 'cambiar-estado');
      await pusher.connect();
      setState(() {
        initialized = true;
      });
    } catch (e) {
      print("ERROR: $e");
    }
  }
}