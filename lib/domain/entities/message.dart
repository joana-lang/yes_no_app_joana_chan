//identidad atomica_ es lo mas pequeño
enum FromWho {
  me,
  him,
  hers,
}

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message(
      {required this.text,
      required this.fromWho,
      this.imageUrl}); // de donde viene la imagen
}
