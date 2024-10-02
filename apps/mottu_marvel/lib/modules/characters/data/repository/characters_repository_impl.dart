import 'dart:convert';

import 'package:get/get.dart';
import 'package:crypto/crypto.dart';
import 'package:mottu_http/mottu_http.dart';
import 'package:common/common.dart';
import 'package:mottu_marvel/modules/characters/data/models/marvel_response_model.dart';
import 'package:mottu_marvel/modules/characters/domain/repository/characters_repository.dart';

class CharactersRepositoryImpl extends GetxService implements CharactersRepository {
  CharactersRepositoryImpl({required this.httpClient});

  final MottuHttpClient httpClient;

  String _generateHash(String timestamp) {
    final String toHash = timestamp + Environment.marvelPrivateKey + Environment.marvelPublicKey;
    return md5.convert(utf8.encode(toHash)).toString();
  }

  @override
  Future<MarvelResponse> fetchCharacters({int limit = 20, required int offset}) async {
    //TODO Test without timestamp
    print('repository: fetch offset $offset, with limit $limit');
    final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String hash = _generateHash(timestamp);

    try {
      final response = await httpClient.get(
        'characters',
        queryParameters: {
          'ts': timestamp,
          'apikey': Environment.marvelPublicKey,
          'hash': hash,
          'offset': offset,
          'limit': limit,
        },
      );

      print('Response data: ${response.data}');
      // print('New ETag: $_etag');

      return MarvelResponse.fromJson(response.data!);
    } on MottuHttpException catch (e) {
      rethrow; //TODO
    }
  }

  @override
  Future<MarvelResponse> filterCharactersByName({required String name, int limit = 10, required int offset}) {
    // TODO: implement filterCharactersByName
    throw UnimplementedError();
  }

  @override
  Future<MarvelResponse> fetchRelatedCharacters(
      {List<String>? comics, List<String>? series, List<String>? events, int limit = 10, required int offset}) async {
    print('repository: fetchRelatedCharacters - fetch offset $offset, with limit $limit');
    print('comics $comics, series: $series, events: $events');

    final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String hash = _generateHash(timestamp);

    try {
      final response = await httpClient.get(
        'characters',
        queryParameters: {
          'ts': timestamp,
          'apikey': Environment.marvelPublicKey,
          'hash': hash,
          'offset': offset,
          'limit': limit,
          if (comics?.isNotEmpty == true) 'comics': comics?.first,
          if (series?.isNotEmpty == true) 'series': series?.first,
          if (events?.isNotEmpty == true) 'events': events?.first,
        },
      );

      print('Response data: ${response.data}');

      return MarvelResponse.fromJson(response.data!);
    } on MottuHttpException catch (e) {
      rethrow; //TODO
    }
  }
}