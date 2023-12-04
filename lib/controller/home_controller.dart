import 'dart:convert';

import 'package:database2_flutter_app/model/movie_info_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  TextEditingController movieNameTextController = TextEditingController();
  TextEditingController genreNameTextController = TextEditingController();
  TextEditingController userIdTextController = TextEditingController();

  Future<MovieInfoModel> getMovieInfo() async {
    final url = Uri.parse('http://127.0.0.1:5000/movie');
    print('text = ${movieNameTextController.value.text}');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"movie": movieNameTextController.value.text}),
    );
    print(response.body);

    return MovieInfoModel.fromJson(json: jsonDecode(response.body));
  }

  Future<List<MovieInfoModel>> getGenreTop5() async {
    final url = Uri.parse('http://127.0.0.1:5000/genre');
    print('text = ${genreNameTextController.value.text}');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"genre": genreNameTextController.value.text}),
    );
    print(response.body);
    List<MovieInfoModel> result = (jsonDecode(response.body) as List)
        .map(
          (e) => MovieInfoModel.fromJson(json: e),
        )
        .toList();

    return result;
  }

  // Future<List<MovieInfoModel>> getUserBasedRecommendation() async {
  //   final url = Uri.parse('http://127.0.0.1:5000/recommendation');
  //   print('text = ${userIdTextController.value.text}');
  //   final response = await http.post(
  //     url,
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode({"user_id": userIdTextController.value.text}),
  //   );
  //   print(response.body);
  //   List<MovieInfoModel> result = (jsonDecode(response.body) as List)
  //       .map(
  //         (e) => MovieInfoModel.fromJson(json: e),
  //       )
  //       .toList();

  //   return result;
  // }

  // Future<Member> signUp() async {
  //   final url = Uri.parse('http://localhost:8080/api/sign-up');
  //   final response = await http.post(
  //     url,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //     },
  //     body: json.encode({"name": nameTextController.value.text}),
  //   );
  //   print(response.body);
  //   return Member(name: response.body['name'], id: response.body['id']);
  // }
}
