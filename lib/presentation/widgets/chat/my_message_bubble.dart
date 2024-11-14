import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for DateFormat
import 'package:yes_no_app_joana_chan/domain/entities/message.dart';

class MyMessageBubble extends StatefulWidget {
  final Message message;

  const MyMessageBubble({super.key, required this.message});

  @override
  State<MyMessageBubble> createState() => _MyMessageBubbleState();
}

class _MyMessageBubbleState extends State<MyMessageBubble> {
  bool isRead = false;

  @override
  void initState() {
    super.initState();
    // Cambia `isRead` a `true` después de 2 segundos para simular la lectura
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isRead = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Formato de hora del mensaje, usando el timestamp del mensaje
    final String formattedTime = DateFormat('hh:mm a')
        .format(widget.message.timesTamp ?? DateTime.now());

    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.end, // Alinea los mensajes a la derecha
      children: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.end, // Alinea la burbuja a la derecha
          children: [
            Container(
              decoration: BoxDecoration(
                color: colors.primary, // Fondo del mensaje
                borderRadius: BorderRadius.circular(20), // Bordes redondeados
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize
                    .min, // Evita que el Row ocupe más espacio del necesario
                children: [
                  // Texto del mensaje, ajustado con `overflow` para evitar desbordamiento
                  Flexible(
                    child: Text(
                      widget.message.text,
                      style: const TextStyle(color: Colors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Espacio entre el mensaje y la hora + iconos de check
                  const SizedBox(width: 5),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Hora del mensaje
                        Text(
                          formattedTime,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 10, // Hora más pequeña
                          ),
                        ),
                        const SizedBox(width: 5),
                        // Iconos de "check" (doble check)
                        Icon(
                          Icons.check,
                          size: 12,
                          color: isRead ? Colors.blue : Colors.grey,
                        ),
                        Icon(
                          Icons.check,
                          size: 12,
                          color: isRead ? Colors.blue : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 5), // Separación entre los mensajes
      ],
    );
  }
}
