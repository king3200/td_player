import 'package:flutter/material.dart';
// import 'package:flutter_easyrefresh/material_footer.dart';
// import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_easyrefresh/taurus_footer.dart';
import 'package:flutter_easyrefresh/taurus_header.dart';
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
  int currentMVOffset = 4;
  List<MVData> mvItemList = [];

  @override
  void initState() {
    print('-----------------初始化home_page');
    super.initState();
  }

  @override
  void dispose() {
    print('----------------销毁home_page');
    super.dispose();
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
              header: TaurusHeader(),
              footer: TaurusFooter(),
              onLoad: () async {
                getRequestData(getServiceUrl('home_recommand_mv'), formData: {'limit': 3, 'offset': currentMVOffset}).then((val) {
                  RecommandMV _recommandMVData = RecommandMV.fromJson(val);
                  setState(() {
                    print(_recommandMVData.mvDataList.length);
                    print(_recommandMVData.mvDataList[0].toJson());
                    print(_recommandMVData.mvDataList[1].toJson());
                    print(_recommandMVData.mvDataList[2].toJson());
                    mvItemList.addAll(_recommandMVData.mvDataList);
                    this.currentMVOffset += 3;
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
                    mvDataList: mvItemList,
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
  final List<MVData> mvDataList;

  const RecommandMVGroup({Key key, this.mvDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      color: Colors.black12,
      child: Column(
        children: <Widget>[
          _getTitleBanner(),
          Column(
            children: _getMVList(),
          )
        ],
      ),
    );
  }

  List<Widget> _getMVList() {
    if (mvDataList.length <= 0) {
      return [Text('加载中')];
    } else {
      List<Widget> mvList = mvDataList.map((mvData) {
        return _getMVTile(
            mvData.cover, mvData.name, mvData.playCount, mvData.briefDesc == null ? '最新推荐' : mvData.briefDesc, mvData.artistName);
      }).toList();
      return mvList;
    }
  }

  Widget _getTitleBanner() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      height: ScreenUtil().setHeight(75),
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

  Widget _getMVTile(String cover, String name, int playCount, String briefDesc, String artistName) {
    Widget _getTileTitle() {
      return Container(
        padding: EdgeInsets.only(top: 5, bottom: 15),
        child: Text(
          briefDesc,
          style: TextStyle(
            color: Colors.black54,
            fontSize: ScreenUtil().setSp(35),
          ),
        ),
      );
    }

    Widget _getTileName() {
      return Container(
          color: Color.fromARGB(255, 247, 248, 249),
          padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
          child: Row(
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(35),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ));
    }

    Widget _getTileFooter() {
      var more_horiz = Icons.more_horiz;
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.play_arrow),
                Text(playCount.toString()),
              ],
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      color: Colors.white,
      width: ScreenUtil().setWidth(750),
      margin: EdgeInsets.only(bottom: 4),
      child: Column(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _getTileTitle(),
                Image.network(
                  cover,
                  fit: BoxFit.contain,
                ),
                _getTileName(),
                _getTileFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
