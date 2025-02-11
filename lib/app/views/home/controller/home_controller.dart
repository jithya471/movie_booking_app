import 'package:get/get.dart';
import 'package:movie_booking_app/app/views/home/model/movie_model.dart';

class HomeController extends GetxController {
  final RxList<MovieModel> movies = <MovieModel>[].obs;
  final RxList<String> timings =
      ['Morning', 'Afternoon', 'Evening', 'Night'].obs;
  final List<MovieModel> dummyMovies = [
    MovieModel(
      title: 'Interstellar',
      posterUrl: [
        "https://marketplace.canva.com/EAFTl0ixW_k/1/0/1131w/canva-black-white-minimal-alone-movie-poster-YZ-0GJ13Nc8.jpg",
        "https://images-cdn.ubuy.co.in/6352289f38bb253c44612d53-interstellar-movie-poster-24-x-36-inches.jpg",
        "https://mir-s3-cdn-cf.behance.net/project_modules/max_3840/d3130c112617081.60181f67660c8.jpg"
      ],
      synopsis:
          'An unemployed and introverted Steven is passionate about practising ventriloquy. When his best friend Fangora finds a platform to showcase her talent, Steven, too, uses his puppet to exhibit his art.',
      rating: 3,
      duration: '2h 30min',
    ),
    MovieModel(
      title: 'Alone',
      posterUrl: [
        "https://marketplace.canva.com/EAFTl0ixW_k/1/0/1131w/canva-black-white-minimal-alone-movie-poster-YZ-0GJ13Nc8.jpg",
        "https://images-cdn.ubuy.co.in/6352289f38bb253c44612d53-interstellar-movie-poster-24-x-36-inches.jpg",
      ],
      synopsis:
          'Unhappy with his overall life, Steven Schoichet (Adrien Brody) decides to pursue his dream to be a professional ventriloquist. His family is neither supportive nor particularly critical. ',
      rating: 4,
      duration: '2h 45min',
    ),
    MovieModel(
      title: 'Joker',
      posterUrl: [
        "https://m.media-amazon.com/images/I/71Jxq2p5YWL._AC_UF1000,1000_QL80_.jpg",
      ],
      synopsis:
          'When their mother dies, Danny and Jack must fend for themselves. Danny escapes with sex, drugs and music and Jack turns a mannequin into a surrogate parent. Finally, they must come to terms with each other.',
      rating: 4.5,
      duration: '3h 45min',
    )
  ].obs;
  RxString selectedTime = 'Morning'.obs;
}
