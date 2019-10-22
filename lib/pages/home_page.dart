import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:td_player/configs/urls.dart';
import 'package:td_player/models/home.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../service/url_request.dart';
import '../models/home.dart' as HomeDate;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int currentMVPage = 0;
  List<MVData> mvItemList = [];

  @override
  void initState() {
    print('-----------------初始化home_page');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('-------------home_page...build');
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text('TD网易云播放器'),
      ),
      body: FutureBuilder(
        future: getHomePageData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('加载中');
          } else {
            Map<String, dynamic> _homepageData = snapshot.data;
            BannerData _bannerData = BannerData.fromJson(_homepageData['home_banner']);
            RecommandPlayList _recommandPlaylistData = RecommandPlayList.fromJson(_homepageData['home_recommand_playlist']);
            if (mvItemList.length <= 0) {
              RecommandMV _recommandMVData = RecommandMV.fromJson(_homepageData['home_recommand_mv']);
              mvItemList.addAll(_recommandMVData.mvDataList);
            }
            return EasyRefresh(
              header: MaterialHeader(),
              footer: MaterialFooter(),
              onLoad: () async {
                getRequestData(getServiceUrl('home_recommand_mv'), formData: {'limit': 3, 'offset': currentMVPage}).then((val) {
                  RecommandMV _recommandMVData = RecommandMV.fromJson(_homepageData['home_recommand_mv']);
                  setState(() {
                    mvItemList.addAll(_recommandMVData.mvDataList);
                  });
                });
              },
              child: ListView(
                children: <Widget>[
                  HomeBanner(
                    bannerList: _bannerData,
                  ),
                  HomeBtnGroup(),
                  RecommandPlayListGroup(
                    playList: _recommandPlaylistData,
                  ),
                  RecommandMVGroup(
                    MVDataList: mvItemList,
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class HomeBanner extends StatelessWidget {
  final BannerData bannerList;

  HomeBanner({this.bannerList}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300.0),
      child: Swiper(
        autoplay: true,
        itemCount: 5,
        pagination: SwiperPagination(),
        control: SwiperControl(),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            bannerList.banners[index].imageUrl,
            fit: BoxFit.fill,
          );
        },
        onTap: (index) {
          HomeDate.Banner _bannerItem = bannerList.banners[index];
          print('你点击了${_bannerItem.toJson()}');
        },
      ),
    );
  }
}

class HomeBtnGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.2)), color: Colors.white),
      padding: EdgeInsets.fromLTRB(20, 3, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _getBtns(),
      ),
    );
  }

  List<Widget> _getBtns() {
    return [
      _createBtn(Icon(Icons.calendar_today), Colors.red, '每日推荐'),
      _createBtn(Icon(Icons.list), Colors.red, '歌单'),
      _createBtn(Icon(Icons.filter_list), Colors.red, '排行榜'),
      _createBtn(Icon(Icons.radio), Colors.red, '电台'),
      _createBtn(Icon(Icons.live_tv), Colors.red, '直播'),
    ];
  }

  Widget _createBtn(Icon icon, Color btnColor, String title) {
    return Container(
      child: Column(
        children: <Widget>[
          IconButton(
            icon: icon,
            color: btnColor,
            onPressed: () {
              print('您点击了${title}按钮');
            },
          ),
          Text(title)
        ],
      ),
    );
  }
}

class RecommandPlayListGroup extends StatelessWidget {
  final RecommandPlayList playList;

  const RecommandPlayListGroup({Key key, this.playList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
      child: Column(
        children: <Widget>[_getTitleBanner(), _getRecommandBanner()],
      ),
    );
  }

  Widget _getTitleBanner() {
    return Container(
      margin: EdgeInsets.all(10),
      height: ScreenUtil().setHeight(55),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '推荐歌单',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.w700,
            ),
          ),
          FlatButton(
            child: Text("歌单广场"),
            onPressed: () {},
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.lightBlue),
              borderRadius: new BorderRadius.circular(50.0),
            ),
          )
        ],
      ),
    );
  }

  Widget _getRecommandBanner() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _getRecommandPlaylistItem(playList.playlists[0]),
              _getRecommandPlaylistItem(playList.playlists[1]),
              _getRecommandPlaylistItem(playList.playlists[2])
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _getRecommandPlaylistItem(playList.playlists[3]),
              _getRecommandPlaylistItem(playList.playlists[4]),
              _getRecommandPlaylistItem(playList.playlists[5])
            ],
          )
        ],
      ),
    );
  }

  Widget _getRecommandPlaylistItem(Playlist playlist) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {
        print('你点击了歌单${playlist.name}');
      },
      child: Container(
        width: ScreenUtil().setWidth(200.0),
        child: Column(
          children: <Widget>[
            Image.network(
              playlist.coverImgUrl,
              width: 95,
              height: 95,
              fit: BoxFit.fill,
            ),
            Text(
              playlist.name,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}

class RecommandMVGroup extends StatelessWidget {
  final List<MVData> MVDataList;

  const RecommandMVGroup({Key key, this.MVDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _getTitleBanner(),
          _getMVList(),
        ],
      ),
    );
  }

  Widget _getTitleBanner() {
    return Container(
      margin: EdgeInsets.all(10),
      height: ScreenUtil().setHeight(55),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '最新MV',
            style: TextStyle(fontSize: ScreenUtil().setSp(36), fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }

  Widget _getMVList() {
    return Container(
      height: ScreenUtil().setHeight(500),
      // child: ListView.builder(
      //   itemCount: recommandMVData.mvList.length,
      //   itemBuilder: (context, index) {
      //     MVData _tmp = recommandMVData.mvList[index];
      //     return _getMVTile(_tmp.cover, _tmp.name, _tmp.playCount, _tmp.briefDesc);
      //   },
      // ),
    );
  }

  Widget _getMVTile(String cover, String name, int playCount, String briefDesc) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Image.network(
                  cover,
                  height: ScreenUtil().setHeight(100),
                  fit: BoxFit.contain,
                ),
                Text(name),
                Text(briefDesc)
              ],
            ),
          ),
          Container(
            child: Text('已播放$playCount'),
          ),
        ],
      ),
    );
  }
}
