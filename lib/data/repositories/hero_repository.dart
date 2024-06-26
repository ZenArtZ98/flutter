import 'package:dio/dio.dart';
import 'package:my_first_app/data/api/api.dart';
import 'package:my_first_app/data/api/api_routers.dart';
import 'package:my_first_app/data/model/answer.dart';
import 'package:my_first_app/data/model/hero.dart';

class HeroRepository {
  final Api _client;

  HeroRepository({required Api api}) : _client = api;

  Future<Answer<List<HeroModel>>> getListHero() async {
    try {
      final response = await _client.api.get(ApiRouters.hero);
      final list = response.data['cards'] as List;
      final data = list.map((e) => HeroModel.fromJson(e)).toList();
      return Answer(data: data);
    } on DioException catch (e) {
      return Answer(error: e.message);
    }
  }
}
