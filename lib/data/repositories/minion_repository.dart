import 'package:dio/dio.dart';
import 'package:my_first_app/data/api/api.dart';
import 'package:my_first_app/data/api/api_routers.dart';
import 'package:my_first_app/data/model/answer.dart';
import 'package:my_first_app/data/model/minion.dart';

class MinionRepository {
  final Api _client;

  MinionRepository({required Api api}) : _client = api;

  Future<Answer<List<MinionModel>>> getListCharacter() async {
    try {
      final response = await _client.api.get(ApiRouters.minion);
      final list = response.data['cards'] as List;
      final data = list.map((e) => MinionModel.fromJson(e)).toList();
      return Answer(data: data);
    } on DioException catch (e) {
      return Answer(error: e.message);
    }
  }
}
