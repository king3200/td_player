import 'package:dio/dio.dart';
import 'package:td_player/configs/urls.dart';
import 'dart:async';
import './url_request.dart';

Future getRequestData(String url, {formData}) async {
  try {
    Dio dio = Dio();
    Response response;
    if (formData != null) {
      response = await dio.get(url, queryParameters: formData);
      print('请求${response.request.uri}');
    } else {
      response = await dio.get(url);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('请求错误:${response.statusCode}-${response.data}');
    }
  } catch (e) {
    print('url请求发生错误.$e:${e.message}');
  }
}

Future getHomePageData() async {
  try {
    Dio dio = Dio();
    Map<String, dynamic> _homepageData = Map<String, dynamic>();

    Response _bannerResponse = await dio.get(getServiceUrl('home_banner'));
    Response _recommandPlaylistResponse = await dio.get(getServiceUrl('home_recommand_playlist'));
    Response _recommandMvResponse = await dio.get(getServiceUrl('home_recommand_mv'), queryParameters: {'limit': 3, 'offset': 1});

    if (_bannerResponse.statusCode == 200) {
      _homepageData['home_banner'] = _bannerResponse.data;
    }
    if (_recommandPlaylistResponse.statusCode == 200) {
      _homepageData['home_recommand_playlist'] = _recommandPlaylistResponse.data;
    }
    if (_recommandMvResponse.statusCode == 200) {
      _homepageData['home_recommand_mv'] = _recommandMvResponse.data;
    }

    return _homepageData;
  } catch (e) {
    print('首页数据请求失败：$e');
  }
}

Future getMyMusicData() async {
  //TODO 我的音乐页面数据拉取
  // Dio dio = Dio();
  // Map<String, dynamic> _pageData = Map<String, dynamic>();
  // try {
  //   Response _collection = await dio.get(getServiceUrl('mymusic_quantity'));
  // } catch (e) {
  //   print('我的音乐页面数据请求失败: $e');
  // }
}
