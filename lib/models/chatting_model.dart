class ChattingModel {
  List<Items>? items;
  int? pageNumber;
  int? pageSize;
  int? totalCount;
  int? totalPages;
  bool? hasPreviousPage;
  bool? hasNextPage;

  ChattingModel(
      {this.items,
      this.pageNumber,
      this.pageSize,
      this.totalCount,
      this.totalPages,
      this.hasPreviousPage,
      this.hasNextPage});

  ChattingModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    totalCount = json['totalCount'];
    totalPages = json['totalPages'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['totalCount'] = this.totalCount;
    data['totalPages'] = this.totalPages;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['hasNextPage'] = this.hasNextPage;
    return data;
  }
}

class Items {
  String? id;
  String? content;
  String? createdDate;
  Sender? sender;
  bool? hasBeenRead;

  Items(
      {this.id, this.content, this.createdDate, this.sender, this.hasBeenRead});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    createdDate = json['createdDate'];
    sender =
        json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    hasBeenRead = json['hasBeenRead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['createdDate'] = this.createdDate;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    data['hasBeenRead'] = this.hasBeenRead;
    return data;
  }
}

class Sender {
  String? id;
  String? userName;

  Sender({this.id, this.userName});

  Sender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    return data;
  }
}