import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:moviesapp/controllers/movies_controller.dart';

Future<void> innit() async {
  Get.put(MoviesController(client: Client()), permanent: true);
}
