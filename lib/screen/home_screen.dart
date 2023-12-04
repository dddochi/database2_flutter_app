import 'package:database2_flutter_app/controller/home_controller.dart';
import 'package:database2_flutter_app/model/movie_info_model.dart';
import 'package:database2_flutter_app/screen/genre_top5_screen.dart';
import 'package:database2_flutter_app/screen/movie_info_screen.dart';
import 'package:database2_flutter_app/screen/recommendation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 27.0, fontWeight: FontWeight.w700);
    MovieInfoModel movie;
    List<MovieInfoModel> genreTop5List;
    List<MovieInfoModel> recommendationList;
    HomeController controller = Get.put(HomeController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 174, 217, 237),
        appBar: AppBar(
          title: const Text(
            'Movie For Me',
            style: TextStyle(
              fontSize: 27.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 20.0),
                    child: Text(
                      'Movie Information',
                      style: titleTextStyle,
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Movie',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller.movieNameTextController,
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              movie = await controller.getMovieInfo();
                              Get.to(
                                () => MovieInfoScreen(
                                  argument: controller.movieNameTextController.value.text,
                                ),
                                arguments: movie,
                              );
                            },
                            child: const Text('Send'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60.0,
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 20.0),
                    child: Text(
                      'Genre Based\nMovie Recommendation',
                      style: titleTextStyle,
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Genre',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller.genreNameTextController,
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              genreTop5List = await controller.getGenreTop5();
                              print('-------------onPressed------------');
                              print(genreTop5List);
                              Get.to(
                                () => GenreTop5Screen(
                                  argument: controller.genreNameTextController.value.text,
                                ),
                                arguments: genreTop5List,
                              );
                            },
                            child: const Text('Send'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60.0,
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 20.0),
                    child: Text(
                      'User Based \nMovie Recommendation',
                      style: titleTextStyle,
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'User Id',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: controller.userIdTextController,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              //recommendationList = await controller.getUserBasedRecommendation();
                              Get.to(
                                () => RecommendationScreen(
                                  userId: controller.userIdTextController.value.text,
                                ),
                              );
                            },
                            child: const Text('Send'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
