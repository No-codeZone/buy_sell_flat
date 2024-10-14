import 'package:flutter/material.dart';

class WhatsappMsg extends StatefulWidget {
  const WhatsappMsg({super.key});

  @override
  State<WhatsappMsg> createState() => _WhatsappMsgState();
}

class _WhatsappMsgState extends State<WhatsappMsg> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Whatsapp messenger screen is here !'),
      ),
    );
  }
}
