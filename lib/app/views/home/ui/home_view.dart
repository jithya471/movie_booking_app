import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/app/global/constants.dart';
import 'package:movie_booking_app/app/routes/app_routes.dart';
import 'package:movie_booking_app/app/utils/colors.dart';
import 'package:movie_booking_app/app/utils/styles.dart';
import 'package:movie_booking_app/app/views/home/controller/home_controller.dart';
import 'package:movie_booking_app/app/views/home/model/movie_model.dart';
import 'package:movie_booking_app/app/views/home/ui/widgets/ratings.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          'Cinema App',
          style: style(18, FontWeight.w700, AppColors.white),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: verticalpadding, horizontal: horizontalpadding),
          child: Column(
            children: [
              TextFormField(
                cursorColor: AppColors.secondaryColor,
                style: style(14, FontWeight.w500, AppColors.black),
                decoration: InputDecoration(
                    filled: true,
                    contentPadding: EdgeInsets.all(verticalpadding / 2),
                    fillColor: AppColors.bg,
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.secondaryColor,
                    ),
                    hintText: 'Search your movie',
                    hintStyle: style(14, FontWeight.w400, AppColors.gray),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                AppColors.secondaryColor.withValues(alpha: .5)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                AppColors.secondaryColor.withValues(alpha: .5)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.5,
                            color:
                                AppColors.secondaryColor.withValues(alpha: .5)),
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(
                height: Get.height * .03,
              ),
              SizedBox(
                child: Obx(
                  () => ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.dummyMovies.length,
                      itemBuilder: (context, index) {
                        final movie = controller.dummyMovies[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: verticalpadding / 2),
                          child: movieCard(movie),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget movieCard(MovieModel movie) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: .5),
          color: AppColors.bg,
          boxShadow: [
            BoxShadow(
                color: AppColors.primaryColor.withValues(alpha: .1),
                offset: Offset(1, 4),
                blurRadius: 4,
                spreadRadius: 6)
          ],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height * .2,
            child: CarouselSlider.builder(
              itemCount: movie.posterUrl.length,
              itemBuilder: (context, index, realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    movie.posterUrl[index],
                    fit: BoxFit.cover,
                    height: Get.height * .2,
                    width: Get.width,
                  ),
                );
              },
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                enlargeCenterPage: false,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: verticalpadding / 2,
                horizontal: horizontalpadding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  movie.title,
                  style: style(16, FontWeight.w500, AppColors.black),
                ),
                SizedBox(
                  child: CustomRatingBar(
                    itemSize: Get.height * .03,
                    initialRating: movie.rating.toDouble(),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: horizontalpadding / 2),
            child: Row(
              children: [
                SizedBox(
                  width: Get.width * .8,
                  child: Text(
                    maxLines: 2,
                    textAlign: TextAlign.justify,
                    movie.synopsis,
                    style: style(12, FontWeight.w400, AppColors.black,
                        overflow: TextOverflow.ellipsis),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: horizontalpadding / 2,
                top: verticalpadding / 2,
                right: horizontalpadding / 2),
            child: SizedBox(
              width: Get.width * .66,
              height: Get.height * .03,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.timings.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.primaryColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Center(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.0),
                            child: Text(
                              controller.timings[index],
                              style: style(
                                  10, FontWeight.w400, AppColors.primaryColor),
                            ),
                          )),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: horizontalpadding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Duration: ${movie.duration}',
                  style: style(13, FontWeight.w600, AppColors.gray),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.movieDetailView, arguments: movie);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: Text(
                          'Book',
                          style: style(14, FontWeight.w600, AppColors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: verticalpadding,
          )
        ],
      ),
    );
  }
}
