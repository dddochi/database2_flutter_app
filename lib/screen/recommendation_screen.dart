import 'package:database2_flutter_app/model/movie_info_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RecommendationScreen extends StatelessWidget {
  final String userId;
  const RecommendationScreen({
    required this.userId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<MovieInfoModel> movies = [
      MovieInfoModel(
          title: 'Waiting to Exhale (1995)',
          genres: ['Comedy', 'Drama', 'Romance'],
          positive_count: 0,
          positive_percentage: 0,
          negative_count: 0,
          negative_percentage: 0,
          tags: ['love', 'touching', 'laugh']),
      MovieInfoModel(
          title: 'Sense and Sensibility (1995)',
          genres: ['Drama', 'Romance'],
          positive_count: 0,
          positive_percentage: 0,
          negative_count: 0,
          negative_percentage: 0,
          tags: ['romentic', 'couple', 'classic'])
    ];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Recommendation for $userId'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: movies
                .map(
                  (e) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Image.asset(
                          'asset/img/recommendation_${movies.indexOf(e) + 1}.jpeg',
                          width: 200,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${movies.indexOf(e) + 1}',
                            style: const TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            e.title,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //     top: 10.0,
                      //     bottom: 10.0,
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      //         child: CircularPercentIndicator(
                      //           radius: 20.0,
                      //           lineWidth: 4.0,
                      //           animation: true,
                      //           percent: double.parse((e.positive_percentage / 100.0).toStringAsFixed(2)),
                      //           center: const Icon(
                      //             Icons.thumb_up,
                      //             color: Colors.lightBlueAccent,
                      //             size: 20.0,
                      //           ),
                      //           circularStrokeCap: CircularStrokeCap.round,
                      //           progressColor: Colors.lightBlueAccent,
                      //         ),
                      //       ),
                      //       Text(
                      //         'Positive Reivew: ${e.positive_percentage.toStringAsFixed(2)}% (${e.positive_count})',
                      //         style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      //       child: CircularPercentIndicator(
                      //         radius: 20.0,
                      //         lineWidth: 4.0,
                      //         animation: true,
                      //         percent: double.parse((e.negative_percentage / 100.0).toStringAsFixed(2)),
                      //         center: const Icon(
                      //           Icons.thumb_up,
                      //           color: Colors.redAccent,
                      //           size: 20.0,
                      //         ),
                      //         circularStrokeCap: CircularStrokeCap.round,
                      //         progressColor: Colors.redAccent,
                      //       ),
                      //     ),
                      //     Text(
                      //       'Negative Reivew: ${e.negative_percentage.toStringAsFixed(2)}% (${e.negative_count})',
                      //       style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      //     ),
                      //   ],
                      // ),

                      //e.genres
                      // Text(e.positive_count.toString()),
                      // Text(e.positive_percentage.toStringAsFixed(2)),
                      // Text(e.negative_count.toString()),
                      // Text(e.negative_percentage.toStringAsFixed(2)),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: e.tags
                              .map((e) => Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text(
                                      '#$e',
                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      if (movies.indexOf(e) != 4)
                        Container(
                          width: Get.width,
                          height: 1,
                          color: Colors.grey,
                        )
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
