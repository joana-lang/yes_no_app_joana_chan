//El modelo define que datos debe tener la aplicacion. Investigar MVC:
//Modelo= datos
// Vista= lo que ve el usuario
//Controlador= logica
// por ejemplo un teatro de marionteas, marionestas, titititero, escenario

//investigar patron de diseño de softawre

class YesNoModel {
  // Atributos de la clase
  final String answer;
  final bool forced; // bool:
  final String image;

  YesNoModel({required this.answer, required this.forced, required this.image});
}
