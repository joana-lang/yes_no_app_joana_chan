import 'package:flutter/material.dart';
import 'package:yes_no_app_joana_chan/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_joana_chan/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Holaaaa', fromWho: FromWho.me),
    Message(text: '¿Lloras porque reprobaste tópicos?', fromWho: FromWho.me)
  ];

  // Variable que controla la posición del scroll
  final ScrollController chatScrollcontroller = ScrollController();

  //instancia de la clase GetYesNoAnswer
  final getYesNoAnswer = GetYesNoAnswer();

  // Enviar un mensaje
  Future<void> sendMessage(String text) async {
    // Comprobar si el texto está vacío
    if (text.trim().isEmpty) {
      //trim elimina espacios en blanco
      // Si está vacío, no hacer nada y retornar
      return;
    }

    // El mensaje va a ser "me" porque yo lo inicio
    final newMessage = Message(text: text, fromWho: FromWho.me);

    // Agrega un elemento a la lista 'messageList'
    messageList.add(newMessage);
    if (text.endsWith('?')) {
      herReply();
    }

    // Imprimir la cantidad de mensajes en la lista
    print('Cantidad de mensajes: ${messageList.length}');

    // Notifica si algo de provider cambió para que se guarde en el estado
    notifyListeners();

    // Mueve el scroll al último mensaje
    moveScrollBttom();
  }

  // Mover el scroll al último mensaje
  Future<void> moveScrollBttom() async {
    if (chatScrollcontroller.hasClients) {
      // Un pequeño atraso en la animación para garantizar siempre
      // se verá aun cuando se envíen mensajes cortos y rápidos
      await Future.delayed(const Duration(seconds: 1));
      chatScrollcontroller.animateTo(
        // Offset: posición de la animación
        // maxScrollExtent determina a lo máximo que el scroll puede dar
        chatScrollcontroller.position.maxScrollExtent,
        // Duración de la animación
        duration: const Duration(milliseconds: 300),
        //'rebote' al final de la animación
        curve: Curves.easeOut,
      );
    }
  }

  Future<void> herReply() async {
    //obtener el pensaje de la peticion

    final herMessage = await getYesNoAnswer.getAnswer();
    // Añadir el mensaje de mi crush a la lista
    messageList.add(herMessage);
    //Notifica si algo del provider cambio para el estado
    notifyListeners();
    //mueve el scroll hasta el ultimo mensaje recibido
    moveScrollBttom();
  }
}
