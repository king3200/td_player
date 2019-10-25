class MyCollectionQuantity {
  int programCount;
  int djRadioCount;
  int mvCount;
  int artistCount;
  int newProgramCount;
  int createDjRadioCount;
  int createdPlaylistCount;
  int subPlaylistCount;
  int code;

  MyCollectionQuantity(
      {this.programCount,
      this.djRadioCount,
      this.mvCount,
      this.artistCount,
      this.newProgramCount,
      this.createDjRadioCount,
      this.createdPlaylistCount,
      this.subPlaylistCount,
      this.code});

  MyCollectionQuantity.fromJson(Map<String, dynamic> json) {
    programCount = json['programCount'];
    djRadioCount = json['djRadioCount'];
    mvCount = json['mvCount'];
    artistCount = json['artistCount'];
    newProgramCount = json['newProgramCount'];
    createDjRadioCount = json['createDjRadioCount'];
    createdPlaylistCount = json['createdPlaylistCount'];
    subPlaylistCount = json['subPlaylistCount'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['programCount'] = this.programCount;
    data['djRadioCount'] = this.djRadioCount;
    data['mvCount'] = this.mvCount;
    data['artistCount'] = this.artistCount;
    data['newProgramCount'] = this.newProgramCount;
    data['createDjRadioCount'] = this.createDjRadioCount;
    data['createdPlaylistCount'] = this.createdPlaylistCount;
    data['subPlaylistCount'] = this.subPlaylistCount;
    data['code'] = this.code;
    return data;
  }
}
