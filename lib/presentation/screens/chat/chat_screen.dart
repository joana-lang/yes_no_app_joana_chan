import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_joana_chan/domain/entities/message.dart';
import 'package:yes_no_app_joana_chan/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_joana_chan/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_joana_chan/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_joana_chan/presentation/widgets/shared/message_field.box.dart';
//import 'package:yes_no_app_joana_chan/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(
                'lib/images/bts.GIF'), // Asegúrate que la ruta sea correcta
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                  'lib/images/jk.GIF'), // Asegúrate de que la ruta sea correcta
              radius: 20, // Tamaño del avatar
            ),
            const SizedBox(width: 10), // Espacio entre la imagen y el nombre
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Alineación a la izquierda
              children: [
                const Text(
                  'JK',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                    height: 4), // Espacio entre el nombre y el subtítulo
                const Text(
                  'en línea',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Acción de configuración
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        centerTitle: true,
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener el ChatProvider
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollcontroller,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  // Determinar si es mensaje de "ella" o "yo"
                  return (message.fromWho == FromWho.her)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            // Campo de entrada de mensaje
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
