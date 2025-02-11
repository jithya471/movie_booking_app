import 'package:get/get.dart';
import 'package:movie_booking_app/app/routes/app_routes.dart';
import 'package:movie_booking_app/app/views/home/bindings/home_bindings.dart';
import 'package:movie_booking_app/app/views/home/ui/home_view.dart';
import 'package:movie_booking_app/app/views/movie_detail/ui/movie_detail_view.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.homeView,
        page: () => const HomeView(),
        binding: HomeBindings()),
    GetPage(
      name: AppRoutes.movieDetailView,
      page: () => const MovieDetail(),
    ),
  ];
}
