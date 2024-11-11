import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_joana_chan/domain/entities/message.dart';
import 'package:yes_no_app_joana_chan/presentation/providers/chat_provider.dart';
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
    //pedirle al widget que este pendiente de todos los cambios
    // ignore: unused_local_variable
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                // instancia del mensaje que sabra de quien es el mensaje
                final message = chatProvider.messageList[index];
                return (message.fromWho == FromWho.him) //ver lo del him o hers
                    ? HerMessageBubble(
                        message: message,
                      )
                    : MyMessageBubble(
                        message: message,
                      );
              },
            )),
            //caja de texto
            MessageFieldBox(
                //una vez que tenga el valor cambiado envialo
                onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
