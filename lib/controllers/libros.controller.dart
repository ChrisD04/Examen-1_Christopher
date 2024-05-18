import 'package:christopherduarte_examen1/models/libro.dart';
import 'package:christopherduarte_examen1/providers/libros.provider.dart';
import 'package:christopherduarte_examen1/services/libros.services.dart';
import 'package:provider/provider.dart';

import '../widgets/alerterror.widget.dart';

class LibroController {
  final LibroProvider libroProvider;
  LibroController({required this.libroProvider});

  Future<bool> traerLibroController(context) async {
    print("Entróooo");
    final librosprovider =
        Provider.of<LibroProvider>(context, listen: false);
    librosprovider.loading = true;
    final respuesta = await traerLibrosService();

    if (respuesta is Libros) {
      librosprovider.listLibro = respuesta.data;
      librosprovider.loading = false;
      return true;
    } else {
      alertError(context, mensaje: 'No hay libros para mostrar');
    }
    return false;
  }
}
