class RecommandPlayList {
  List<Playlist> playlists;
  int total;
  int code;
  bool more;
  String cat;

  RecommandPlayList(
      {this.playlists, this.total, this.code, this.more, this.cat});

  RecommandPlayList.fromJson(Map<String, dynamic> json) {
    if (json['playlists'] != null) {
      playlists = new List<Playlist>();
      json['playlists'].forEach((v) {
        playlists.add(new Playlist.fromJson(v));
      });
    }
    total = json['total'];
    code = json['code'];
    more = json['more'];
    cat = json['cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.playlists != null) {
      data['playlists'] = this.playlists.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['code'] = this.code;
    data['more'] = this.more;
    data['cat'] = this.cat;
    return data;
  }
}

class Playlist {
  String name;
  int id;
  int trackNumberUpdateTime;
  int status;
  int userId;
  int createTime;
  int updateTime;
  int subscribedCount;
  int trackCount;
  int cloudTrackCount;
  String coverImgUrl;
  int coverImgId;
  String description;
  List<String> tags;
  int playCount;
  int trackUpdateTime;
  int specialType;
  int totalDuration;
  Creator creator;
  Null tracks;
  List<Subscribers> subscribers;
  bool subscribed;
  String commentThreadId;
  bool newImported;
  int adType;
  bool highQuality;
  int privacy;
  bool ordered;
  bool anonimous;
  int coverStatus;
  int shareCount;
  String coverImgIdStr;
  int commentCount;

  Playlist(
      {this.name,
      this.id,
      this.trackNumberUpdateTime,
      this.status,
      this.userId,
      this.createTime,
      this.updateTime,
      this.subscribedCount,
      this.trackCount,
      this.cloudTrackCount,
      this.coverImgUrl,
      this.coverImgId,
      this.description,
      this.tags,
      this.playCount,
      this.trackUpdateTime,
      this.specialType,
      this.totalDuration,
      this.creator,
      this.tracks,
      this.subscribers,
      this.subscribed,
      this.commentThreadId,
      this.newImported,
      this.adType,
      this.highQuality,
      this.privacy,
      this.ordered,
      this.anonimous,
      this.coverStatus,
      this.shareCount,
      this.coverImgIdStr,
      this.commentCount});

  Playlist.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    trackNumberUpdateTime = json['trackNumberUpdateTime'];
    status = json['status'];
    userId = json['userId'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    subscribedCount = json['subscribedCount'];
    trackCount = json['trackCount'];
    cloudTrackCount = json['cloudTrackCount'];
    coverImgUrl = json['coverImgUrl'];
    coverImgId = json['coverImgId'];
    description = json['description'];
    tags = json['tags'].cast<String>();
    playCount = json['playCount'];
    trackUpdateTime = json['trackUpdateTime'];
    specialType = json['specialType'];
    totalDuration = json['totalDuration'];
    creator =
        json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    tracks = json['tracks'];
    if (json['subscribers'] != null) {
      subscribers = new List<Subscribers>();
      json['subscribers'].forEach((v) {
        subscribers.add(new Subscribers.fromJson(v));
      });
    }
    subscribed = json['subscribed'];
    commentThreadId = json['commentThreadId'];
    newImported = json['newImported'];
    adType = json['adType'];
    highQuality = json['highQuality'];
    privacy = json['privacy'];
    ordered = json['ordered'];
    anonimous = json['anonimous'];
    coverStatus = json['coverStatus'];
    shareCount = json['shareCount'];
    coverImgIdStr = json['coverImgId_str'];
    commentCount = json['commentCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['trackNumberUpdateTime'] = this.trackNumberUpdateTime;
    data['status'] = this.status;
    data['userId'] = this.userId;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['subscribedCount'] = this.subscribedCount;
    data['trackCount'] = this.trackCount;
    data['cloudTrackCount'] = this.cloudTrackCount;
    data['coverImgUrl'] = this.coverImgUrl;
    data['coverImgId'] = this.coverImgId;
    data['description'] = this.description;
    data['tags'] = this.tags;
    data['playCount'] = this.playCount;
    data['trackUpdateTime'] = this.trackUpdateTime;
    data['specialType'] = this.specialType;
    data['totalDuration'] = this.totalDuration;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    data['tracks'] = this.tracks;
    if (this.subscribers != null) {
      data['subscribers'] = this.subscribers.map((v) => v.toJson()).toList();
    }
    data['subscribed'] = this.subscribed;
    data['commentThreadId'] = this.commentThreadId;
    data['newImported'] = this.newImported;
    data['adType'] = this.adType;
    data['highQuality'] = this.highQuality;
    data['privacy'] = this.privacy;
    data['ordered'] = this.ordered;
    data['anonimous'] = this.anonimous;
    data['coverStatus'] = this.coverStatus;
    data['shareCount'] = this.shareCount;
    data['coverImgId_str'] = this.coverImgIdStr;
    data['commentCount'] = this.commentCount;
    return data;
  }
}

class Creator {
  bool defaultAvatar;
  int province;
  int authStatus;
  bool followed;
  String avatarUrl;
  int accountStatus;
  int gender;
  int city;
  int birthday;
  int userId;
  int userType;
  String nickname;
  String signature;
  String description;
  String detailDescription;
  int avatarImgId;
  int backgroundImgId;
  String backgroundUrl;
  int authority;
  bool mutual;
  List<String> expertTags;
  Experts experts;
  int djStatus;
  int vipType;
  Null remarkName;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  String avatarImgId_str;

  Creator(
      {this.defaultAvatar,
      this.province,
      this.authStatus,
      this.followed,
      this.avatarUrl,
      this.accountStatus,
      this.gender,
      this.city,
      this.birthday,
      this.userId,
      this.userType,
      this.nickname,
      this.signature,
      this.description,
      this.detailDescription,
      this.avatarImgId,
      this.backgroundImgId,
      this.backgroundUrl,
      this.authority,
      this.mutual,
      this.expertTags,
      this.experts,
      this.djStatus,
      this.vipType,
      this.remarkName,
      this.avatarImgIdStr,
      this.backgroundImgIdStr,
      this.avatarImgId_str});

  Creator.fromJson(Map<String, dynamic> json) {
    defaultAvatar = json['defaultAvatar'];
    province = json['province'];
    authStatus = json['authStatus'];
    followed = json['followed'];
    avatarUrl = json['avatarUrl'];
    accountStatus = json['accountStatus'];
    gender = json['gender'];
    city = json['city'];
    birthday = json['birthday'];
    userId = json['userId'];
    userType = json['userType'];
    nickname = json['nickname'];
    signature = json['signature'];
    description = json['description'];
    detailDescription = json['detailDescription'];
    avatarImgId = json['avatarImgId'];
    backgroundImgId = json['backgroundImgId'];
    backgroundUrl = json['backgroundUrl'];
    authority = json['authority'];
    mutual = json['mutual'];
    expertTags = json['expertTags'] != null ?  json['expertTags'].cast<String>(): null;
    experts =
        json['experts'] != null ? new Experts.fromJson(json['experts']) : null;
    djStatus = json['djStatus'];
    vipType = json['vipType'];
    remarkName = json['remarkName'];
    avatarImgIdStr = json['avatarImgIdStr'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
    avatarImgId_str = json['avatarImgId_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['defaultAvatar'] = this.defaultAvatar;
    data['province'] = this.province;
    data['authStatus'] = this.authStatus;
    data['followed'] = this.followed;
    data['avatarUrl'] = this.avatarUrl;
    data['accountStatus'] = this.accountStatus;
    data['gender'] = this.gender;
    data['city'] = this.city;
    data['birthday'] = this.birthday;
    data['userId'] = this.userId;
    data['userType'] = this.userType;
    data['nickname'] = this.nickname;
    data['signature'] = this.signature;
    data['description'] = this.description;
    data['detailDescription'] = this.detailDescription;
    data['avatarImgId'] = this.avatarImgId;
    data['backgroundImgId'] = this.backgroundImgId;
    data['backgroundUrl'] = this.backgroundUrl;
    data['authority'] = this.authority;
    data['mutual'] = this.mutual;
    data['expertTags'] = this.expertTags;
    if (this.experts != null) {
      data['experts'] = this.experts.toJson();
    }
    data['djStatus'] = this.djStatus;
    data['vipType'] = this.vipType;
    data['remarkName'] = this.remarkName;
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    data['avatarImgId_str'] = this.avatarImgId_str;
    return data;
  }
}

class Experts {
  String s2;

  Experts({this.s2});

  Experts.fromJson(Map<String, dynamic> json) {
    s2 = json['2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['2'] = this.s2;
    return data;
  }
}

class Subscribers {
  bool defaultAvatar;
  int province;
  int authStatus;
  bool followed;
  String avatarUrl;
  int accountStatus;
  int gender;
  int city;
  int birthday;
  int userId;
  int userType;
  String nickname;
  String signature;
  String description;
  String detailDescription;
  int avatarImgId;
  int backgroundImgId;
  String backgroundUrl;
  int authority;
  bool mutual;
  Null expertTags;
  Null experts;
  int djStatus;
  int vipType;
  Null remarkName;
  String avatarImgIdStr;
  String backgroundImgIdStr;
  String avatarImgId_str;

  Subscribers(
      {this.defaultAvatar,
      this.province,
      this.authStatus,
      this.followed,
      this.avatarUrl,
      this.accountStatus,
      this.gender,
      this.city,
      this.birthday,
      this.userId,
      this.userType,
      this.nickname,
      this.signature,
      this.description,
      this.detailDescription,
      this.avatarImgId,
      this.backgroundImgId,
      this.backgroundUrl,
      this.authority,
      this.mutual,
      this.expertTags,
      this.experts,
      this.djStatus,
      this.vipType,
      this.remarkName,
      this.avatarImgIdStr,
      this.backgroundImgIdStr,
      this.avatarImgId_str});

  Subscribers.fromJson(Map<String, dynamic> json) {
    defaultAvatar = json['defaultAvatar'];
    province = json['province'];
    authStatus = json['authStatus'];
    followed = json['followed'];
    avatarUrl = json['avatarUrl'];
    accountStatus = json['accountStatus'];
    gender = json['gender'];
    city = json['city'];
    birthday = json['birthday'];
    userId = json['userId'];
    userType = json['userType'];
    nickname = json['nickname'];
    signature = json['signature'];
    description = json['description'];
    detailDescription = json['detailDescription'];
    avatarImgId = json['avatarImgId'];
    backgroundImgId = json['backgroundImgId'];
    backgroundUrl = json['backgroundUrl'];
    authority = json['authority'];
    mutual = json['mutual'];
    expertTags = json['expertTags'];
    experts = json['experts'];
    djStatus = json['djStatus'];
    vipType = json['vipType'];
    remarkName = json['remarkName'];
    avatarImgIdStr = json['avatarImgIdStr'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
    avatarImgId_str = json['avatarImgId_str'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['defaultAvatar'] = this.defaultAvatar;
    data['province'] = this.province;
    data['authStatus'] = this.authStatus;
    data['followed'] = this.followed;
    data['avatarUrl'] = this.avatarUrl;
    data['accountStatus'] = this.accountStatus;
    data['gender'] = this.gender;
    data['city'] = this.city;
    data['birthday'] = this.birthday;
    data['userId'] = this.userId;
    data['userType'] = this.userType;
    data['nickname'] = this.nickname;
    data['signature'] = this.signature;
    data['description'] = this.description;
    data['detailDescription'] = this.detailDescription;
    data['avatarImgId'] = this.avatarImgId;
    data['backgroundImgId'] = this.backgroundImgId;
    data['backgroundUrl'] = this.backgroundUrl;
    data['authority'] = this.authority;
    data['mutual'] = this.mutual;
    data['expertTags'] = this.expertTags;
    data['experts'] = this.experts;
    data['djStatus'] = this.djStatus;
    data['vipType'] = this.vipType;
    data['remarkName'] = this.remarkName;
    data['avatarImgIdStr'] = this.avatarImgIdStr;
    data['backgroundImgIdStr'] = this.backgroundImgIdStr;
    data['avatarImgId_str'] = this.avatarImgId_str;
    return data;
  }
}

class BannerData {
  List<Banner> banners;
  int code;

  BannerData({this.banners, this.code});

  BannerData.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = new List<Banner>();
      json['banners'].forEach((v) {
        banners.add(new Banner.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Banner {
  String imageUrl;
  int targetId;
  Null adid;
  int targetType;
  String titleColor;
  String typeTitle;
  String url;
  bool exclusive;
  Null monitorImpress;
  Null monitorClick;
  Null monitorType;
  Null monitorImpressList;
  Null monitorClickList;
  Null monitorBlackList;
  Null extMonitor;
  Null extMonitorInfo;
  Null adSource;
  Null adLocation;
  Null adDispatchJson;
  String encodeId;
  Null program;
  Null event;
  Null video;
  Null song;
  String scm;

  Banner(
      {this.imageUrl,
      this.targetId,
      this.adid,
      this.targetType,
      this.titleColor,
      this.typeTitle,
      this.url,
      this.exclusive,
      this.monitorImpress,
      this.monitorClick,
      this.monitorType,
      this.monitorImpressList,
      this.monitorClickList,
      this.monitorBlackList,
      this.extMonitor,
      this.extMonitorInfo,
      this.adSource,
      this.adLocation,
      this.adDispatchJson,
      this.encodeId,
      this.program,
      this.event,
      this.video,
      this.song,
      this.scm});

  Banner.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    targetId = json['targetId'];
    adid = json['adid'];
    targetType = json['targetType'];
    titleColor = json['titleColor'];
    typeTitle = json['typeTitle'];
    url = json['url'];
    exclusive = json['exclusive'];
    monitorImpress = json['monitorImpress'];
    monitorClick = json['monitorClick'];
    monitorType = json['monitorType'];
    monitorImpressList = json['monitorImpressList'];
    monitorClickList = json['monitorClickList'];
    monitorBlackList = json['monitorBlackList'];
    extMonitor = json['extMonitor'];
    extMonitorInfo = json['extMonitorInfo'];
    adSource = json['adSource'];
    adLocation = json['adLocation'];
    adDispatchJson = json['adDispatchJson'];
    encodeId = json['encodeId'];
    program = json['program'];
    event = json['event'];
    video = json['video'];
    song = json['song'];
    scm = json['scm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['targetId'] = this.targetId;
    data['adid'] = this.adid;
    data['targetType'] = this.targetType;
    data['titleColor'] = this.titleColor;
    data['typeTitle'] = this.typeTitle;
    data['url'] = this.url;
    data['exclusive'] = this.exclusive;
    data['monitorImpress'] = this.monitorImpress;
    data['monitorClick'] = this.monitorClick;
    data['monitorType'] = this.monitorType;
    data['monitorImpressList'] = this.monitorImpressList;
    data['monitorClickList'] = this.monitorClickList;
    data['monitorBlackList'] = this.monitorBlackList;
    data['extMonitor'] = this.extMonitor;
    data['extMonitorInfo'] = this.extMonitorInfo;
    data['adSource'] = this.adSource;
    data['adLocation'] = this.adLocation;
    data['adDispatchJson'] = this.adDispatchJson;
    data['encodeId'] = this.encodeId;
    data['program'] = this.program;
    data['event'] = this.event;
    data['video'] = this.video;
    data['song'] = this.song;
    data['scm'] = this.scm;
    return data;
  }
}

class RecommandMV {
  bool hasMore;
  List<MVData> mvDataList;
  int code;

  RecommandMV({this.hasMore, this.mvDataList, this.code});

  RecommandMV.fromJson(Map<String, dynamic> json) {
    hasMore = json['hasMore'];
    if (json['data'] != null) {
      mvDataList = new List<MVData>();
      json['data'].forEach((v) {
        mvDataList.add(new MVData.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasMore'] = this.hasMore;
    if (this.mvDataList != null) {
      data['data'] = this.mvDataList.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class MVData {
  int id;
  String cover;
  String name;
  int playCount;
  String briefDesc;
  String desc;
  String artistName;
  int artistId;
  int duration;
  int mark;
  bool subed;
  List<Artists> artists;

  MVData(
      {this.id,
      this.cover,
      this.name,
      this.playCount,
      this.briefDesc,
      this.desc,
      this.artistName,
      this.artistId,
      this.duration,
      this.mark,
      this.subed,
      this.artists});

  MVData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cover = json['cover'];
    name = json['name'];
    playCount = json['playCount'];
    briefDesc = json['briefDesc'];
    desc = json['desc'];
    artistName = json['artistName'];
    artistId = json['artistId'];
    duration = json['duration'];
    mark = json['mark'];
    subed = json['subed'];
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cover'] = this.cover;
    data['name'] = this.name;
    data['playCount'] = this.playCount;
    data['briefDesc'] = this.briefDesc;
    data['desc'] = this.desc;
    data['artistName'] = this.artistName;
    data['artistId'] = this.artistId;
    data['duration'] = this.duration;
    data['mark'] = this.mark;
    data['subed'] = this.subed;
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Artists {
  int id;
  String name;
  List<String> alias;
  List<String> transNames;

  Artists({this.id, this.name, this.alias, this.transNames});

  Artists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alias = json['alias'].cast<String>();
    transNames = json['transNames'] != null ? json['transNames'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['transNames'] = this.transNames;
    return data;
  }
}
