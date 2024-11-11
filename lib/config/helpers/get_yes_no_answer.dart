import 'package:dio/dio.dart';
import 'package:yes_no_app_joana_chan/domain/entities/message.dart';
import 'package:yes_no_app_joana_chan/infraestructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  //se xre instancia de la clase dio
  //para manejar las peticiones HTTP
  final _dio = Dio();

  //obtener la respuesta
  Future<Message> getAnswer() async {
    //alamacena la peticion get en una variable
    // ignore: unused_local_variable
    final response = await _dio.get("https://yesno.wtf/api");

    // almacenar la data de una respuesta en una variable
    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    //devolver la instancia de "message" creada en el modelo
    return yesNoModel.toMessageEntity();
  }
}
