//identidad atomica_ es lo mas pequeño
enum FromWho {
  me,
  him,
}

class Message {
  final String text;
  final FromWho fromWho;

  Message(
      {required this.text, required this.fromWho}); // de donde viene la imagen
}
