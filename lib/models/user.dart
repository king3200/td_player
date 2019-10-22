class User {
	int loginType;
	int code;
	Account account;
	Profile profile;
	List<Bindings> bindings;

	User({this.loginType, this.code, this.account, this.profile, this.bindings});

	User.fromJson(Map<String, dynamic> json) {
		loginType = json['loginType'];
		code = json['code'];
		account = json['account'] != null ? new Account.fromJson(json['account']) : null;
		profile = json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
		if (json['bindings'] != null) {
			bindings = new List<Bindings>();
			json['bindings'].forEach((v) { bindings.add(new Bindings.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['loginType'] = this.loginType;
		data['code'] = this.code;
		if (this.account != null) {
      data['account'] = this.account.toJson();
    }
		if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
		if (this.bindings != null) {
      data['bindings'] = this.bindings.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Account {
	int id;
	String userName;
	int type;
	int status;
	int whitelistAuthority;
	int createTime;
	String salt;
	int tokenVersion;
	int ban;
	int baoyueVersion;
	int donateVersion;
	int vipType;
	int viptypeVersion;
	bool anonimousUser;

	Account({this.id, this.userName, this.type, this.status, this.whitelistAuthority, this.createTime, this.salt, this.tokenVersion, this.ban, this.baoyueVersion, this.donateVersion, this.vipType, this.viptypeVersion, this.anonimousUser});

	Account.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		userName = json['userName'];
		type = json['type'];
		status = json['status'];
		whitelistAuthority = json['whitelistAuthority'];
		createTime = json['createTime'];
		salt = json['salt'];
		tokenVersion = json['tokenVersion'];
		ban = json['ban'];
		baoyueVersion = json['baoyueVersion'];
		donateVersion = json['donateVersion'];
		vipType = json['vipType'];
		viptypeVersion = json['viptypeVersion'];
		anonimousUser = json['anonimousUser'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['userName'] = this.userName;
		data['type'] = this.type;
		data['status'] = this.status;
		data['whitelistAuthority'] = this.whitelistAuthority;
		data['createTime'] = this.createTime;
		data['salt'] = this.salt;
		data['tokenVersion'] = this.tokenVersion;
		data['ban'] = this.ban;
		data['baoyueVersion'] = this.baoyueVersion;
		data['donateVersion'] = this.donateVersion;
		data['vipType'] = this.vipType;
		data['viptypeVersion'] = this.viptypeVersion;
		data['anonimousUser'] = this.anonimousUser;
		return data;
	}
}

class Profile {
	int city;
	int userType;
	int backgroundImgId;
	int vipType;
	int gender;
	String nickname;
	int birthday;
	int djStatus;
	Null expertTags;
	int authStatus;
	int province;
	bool defaultAvatar;
	String avatarUrl;
	int accountStatus;
	int avatarImgId;
	String backgroundUrl;
	int userId;
	bool mutual;
	Null remarkName;
	String description;
	String avatarImgIdStr;
	String backgroundImgIdStr;
	bool followed;
	String detailDescription;
	String signature;
	int authority;
	int followeds;
	int follows;
	int eventCount;
	int playlistCount;
	int playlistBeSubscribedCount;

	Profile({this.city, this.userType, this.backgroundImgId, this.vipType, this.gender, this.nickname, this.birthday, this.djStatus, this.expertTags, this.authStatus, this.province, this.defaultAvatar, this.avatarUrl, this.accountStatus, this.avatarImgId, this.backgroundUrl, this.userId, this.mutual, this.remarkName, this.description, this.avatarImgIdStr, this.backgroundImgIdStr, this.followed, this.detailDescription, this.signature, this.authority, this.followeds, this.follows, this.eventCount, this.playlistCount, this.playlistBeSubscribedCount});

	Profile.fromJson(Map<String, dynamic> json) {
		city = json['city'];
		userType = json['userType'];
		backgroundImgId = json['backgroundImgId'];
		vipType = json['vipType'];
		gender = json['gender'];
		nickname = json['nickname'];
		birthday = json['birthday'];
		djStatus = json['djStatus'];
		expertTags = json['expertTags'];
		authStatus = json['authStatus'];
		province = json['province'];
		defaultAvatar = json['defaultAvatar'];
		avatarUrl = json['avatarUrl'];
		accountStatus = json['accountStatus'];
		avatarImgId = json['avatarImgId'];
		backgroundUrl = json['backgroundUrl'];
		userId = json['userId'];
		mutual = json['mutual'];
		remarkName = json['remarkName'];
		description = json['description'];
		avatarImgIdStr = json['avatarImgIdStr'];
		backgroundImgIdStr = json['backgroundImgIdStr'];
		followed = json['followed'];
		detailDescription = json['detailDescription'];
		signature = json['signature'];
		authority = json['authority'];
		followeds = json['followeds'];
		follows = json['follows'];
		eventCount = json['eventCount'];
		playlistCount = json['playlistCount'];
		playlistBeSubscribedCount = json['playlistBeSubscribedCount'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['city'] = this.city;
		data['userType'] = this.userType;
		data['backgroundImgId'] = this.backgroundImgId;
		data['vipType'] = this.vipType;
		data['gender'] = this.gender;
		data['nickname'] = this.nickname;
		data['birthday'] = this.birthday;
		data['djStatus'] = this.djStatus;
		data['expertTags'] = this.expertTags;
		data['authStatus'] = this.authStatus;
		data['province'] = this.province;
		data['defaultAvatar'] = this.defaultAvatar;
		data['avatarUrl'] = this.avatarUrl;
		data['accountStatus'] = this.accountStatus;
		data['avatarImgId'] = this.avatarImgId;
		data['backgroundUrl'] = this.backgroundUrl;
		data['userId'] = this.userId;
		data['mutual'] = this.mutual;
		data['remarkName'] = this.remarkName;
		data['description'] = this.description;
		data['avatarImgIdStr'] = this.avatarImgIdStr;
		data['backgroundImgIdStr'] = this.backgroundImgIdStr;
		data['followed'] = this.followed;
		data['detailDescription'] = this.detailDescription;
		data['signature'] = this.signature;
		data['authority'] = this.authority;
		data['followeds'] = this.followeds;
		data['follows'] = this.follows;
		data['eventCount'] = this.eventCount;
		data['playlistCount'] = this.playlistCount;
		data['playlistBeSubscribedCount'] = this.playlistBeSubscribedCount;
		return data;
	}
}

class Bindings {
	int bindingTime;
	String tokenJsonStr;
	int expiresIn;
	int userId;
	String url;
	bool expired;
	int refreshTime;
	int id;
	int type;

	Bindings({this.bindingTime, this.tokenJsonStr, this.expiresIn, this.userId, this.url, this.expired, this.refreshTime, this.id, this.type});

	Bindings.fromJson(Map<String, dynamic> json) {
		bindingTime = json['bindingTime'];
		tokenJsonStr = json['tokenJsonStr'];
		expiresIn = json['expiresIn'];
		userId = json['userId'];
		url = json['url'];
		expired = json['expired'];
		refreshTime = json['refreshTime'];
		id = json['id'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['bindingTime'] = this.bindingTime;
		data['tokenJsonStr'] = this.tokenJsonStr;
		data['expiresIn'] = this.expiresIn;
		data['userId'] = this.userId;
		data['url'] = this.url;
		data['expired'] = this.expired;
		data['refreshTime'] = this.refreshTime;
		data['id'] = this.id;
		data['type'] = this.type;
		return data;
	}
}
