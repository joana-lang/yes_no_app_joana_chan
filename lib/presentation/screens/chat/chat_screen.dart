import 'package:flutter/material.dart';
import 'package:yes_no_app_joana_chan/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_joana_chan/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_joana_chan/presentation/widgets/shared/message_field.box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/736x/cb/1d/a9/cb1da9093b2df216ce2b5fb7e6843c93.jpg'),
          ),
        ), //creando nuevp widget
        title: const Text('Mi amor'),
        centerTitle: true, //texto centrado
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const HerMessageBubble()
                    : const MyMessageBubble();
              },
            )),
            //caja de texto
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
