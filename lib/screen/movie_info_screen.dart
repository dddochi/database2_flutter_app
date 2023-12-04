import 'package:database2_flutter_app/model/movie_info_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MovieInfoScreen extends StatelessWidget {
  final String argument;
  const MovieInfoScreen({
    required this.argument,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var movie = Get.arguments as MovieInfoModel;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 155, 217, 238),
      appBar: AppBar(
        title: Text(argument),
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 155, 217, 238),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    bottom: 12.0,
                  ),
                  child: Image.asset(
                    'asset/img/toy_story.jpeg',
                    width: 300,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10.0,
                  ),
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: movie.genres
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            e,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CircularPercentIndicator(
                    radius: 120.0,
                    lineWidth: 20.0,
                    animation: true,
                    percent: double.parse((movie.positive_percentage / 100.0).toStringAsFixed(2)),
                    center: Text(
                      movie.positive_percentage.toStringAsFixed(2),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    footer: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            "Positive review ratio ${movie.positive_percentage.toStringAsFixed(2)}% (${movie.positive_count})",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Colors.blueAccent,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Negative review ratio ${movie.negative_percentage.toStringAsFixed(2)}% (${movie.negative_count})",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                color: Colors.redAccent,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.amber,
                  ),
                ),
                // Text(movie.positive_count.toString()),
                // Text('${movie.positive_percentage.toStringAsFixed(2)}%'),
                // Text(movie.negative_count.toString()),
                // Text('${movie.negative_percentage.toStringAsFixed(2)}%'),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: movie.tags
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              '#$e',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
