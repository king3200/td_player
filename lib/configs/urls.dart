import '../models/home.dart';

const String HOST = 'http://localhost:3000';

const Map<String, String> requestUrls = {
  'home_banner': '/banner',
  'home_recommand_playlist': '/top/playlist?limit=6&order=new',
  'home_recommand_mv': '/mv/all',
  'login': '/login',
};

String getServiceUrl(String key) {
  if(requestUrls.containsKey(key)) {
    return HOST + requestUrls[key];
  }
  else {
    throw Exception('找不到相关接口地址:$key');
  }
}
