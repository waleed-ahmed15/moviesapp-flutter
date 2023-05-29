import 'package:get/get.dart';
import 'package:moviesapp/controllers/movies_controller.dart';

Future<void> innit() async {
  Get.put(MoviesController(), permanent: true);
}
