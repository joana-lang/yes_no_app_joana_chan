//El modelo define que datos debe tener la aplicacion. Investigar MVC:
//MVC: patron de diseño de sowftware
//Modelo= datos
// Vista= lo que ve el usuario
//Controlador= logica
// por ejemplo un teatro de marionteas, marionestas, titititero, escenario

//investigar patron de diseño de softawre: solución reutilizable y generalizada a..
//.. un problema común que se presenta en el desarrollo de software.

// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'package:yes_no_app_joana_chan/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Message toMessageEntity() => Message(
      //condicional para darle nuevo valor a los mensajes
      text: answer == 'yes' // '==' comparacion
          ? 'Sí'
          : answer == 'no'
              ? 'No'
              : 'Quizas',
      fromWho: FromWho.hers,
      //seria el gif
      imageUrl: image);
}
