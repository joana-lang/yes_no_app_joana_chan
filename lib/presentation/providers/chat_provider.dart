import 'package:flutter/material.dart';
import 'package:yes_no_app_joana_chan/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Holaaaa', fromWho: FromWho.me),
    Message(text: 'lloras por que reprobaste topicos?', fromWho: FromWho.me)
  ];
  //variabale que controla la posicion del scroll
  final ScrollController chatScrollcontroller = ScrollController();

  //enviar un mensaje
  Future<void> sendMessage(String) async {
    // el mensaje va a ser "me" por que yo lo encio
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //agrega un elemento a la alista 'messageList'
    messageList.add(newMessage);
    //notifica si algo de provider cambio para que se guarde en el estado
    notifyListeners();
    //mueve el scroll
    moveScrollBttom();
  }

  //mover el scroll al ultimo mensaje
  Future<void> moveScrollBttom() async {
    //un pequeño atraso en la animacion para garantizar siempre
    //se vera aun cuando se envien mensajes cortos y rapidos
    await Future.delayed(const Duration(seconds: 1));
    chatScrollcontroller.animateTo(
        //offset: posicion de la animacion
        //maxScrollExtent determina a lo maximo que el scroll puede dar
        chatScrollcontroller.position.maxScrollExtent,
        //duracion de la animacion
        duration: const Duration(milliseconds: 300),
        //'rebote' al final de la animacion
        curve: Curves.easeOut);
  }
}
