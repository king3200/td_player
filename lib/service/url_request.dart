import 'package:dio/dio.dart';
import 'package:td_player/configs/urls.dart';
import 'dart:async';
import './url_request.dart';

Dio dio = Dio(
  BaseOptions(
    headers: {
      'User-Agent':
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36'
    },
  ),
);

Future getRequestData(String url, {formData}) async {
  try {
    Response response;
    if (formData != null) {
      response = await dio.get(url, queryParameters: formData);
      print('请求地址${response.request.uri}');
    } else {
      response = await dio.get(url);
    }
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('请求错误:${response.statusCode}-${response.data}');
    }
  } on DioError catch (e) {
    print('url请求发生错误.$e:${e.message}');
    if (e.response != null) {
      print('-------DioError--------');
      print(e.response.headers);
      print(e.response.data);
      print('-----------------------');
    }
  }
}

Future getHomePageData() async {
  try {
    Map<String, dynamic> homepageData = Map<String, dynamic>();

    Response bannerResponse = await dio.get(getServiceUrl('home_banner'));
    Response recommandPlaylistResponse = await dio.get(getServiceUrl('home_recommand_playlist'));
    Response recommandMvResponse = await dio.get(getServiceUrl('home_recommand_mv'), queryParameters: {'limit': 3, 'offset': 1});

    if (bannerResponse.statusCode == 200) {
      homepageData['home_banner'] = bannerResponse.data;
    }
    if (recommandPlaylistResponse.statusCode == 200) {
      homepageData['home_recommand_playlist'] = recommandPlaylistResponse.data;
    }
    if (recommandMvResponse.statusCode == 200) {
      homepageData['home_recommand_mv'] = recommandMvResponse.data;
    }

    return homepageData;
  } catch (e) {
    print('首页数据请求失败：$e');
  }
}

Future getMyMusicData() async {
  // 我的音乐页面数据拉取
  Map<String, dynamic> _pageData = Map<String, dynamic>();
  try {
    Response collectionRes = await dio.get(getServiceUrl('mymusic_quantity'));
    if (collectionRes.statusCode == 200) {
      print('我的音乐数据${collectionRes.data}');
      return collectionRes.data;
    } else {
      throw Exception('${collectionRes.statusCode}---${collectionRes.data}');
    }
  } on DioError catch (e) {
    print('我的音乐页面数据请求失败: $e----${e.message}');
    if (e.response != null) {
      print(e.response.statusCode);
      print(e.response.data);
    }
  }
}
