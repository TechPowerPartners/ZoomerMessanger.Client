class ChatModel {
  String? id;
  Interlocutor? interlocutor;

  ChatModel(String jsonEncode, {this.id, this.interlocutor});

  ChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    interlocutor = json['interlocutor'] != null
        ? new Interlocutor.fromJson(json['interlocutor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.interlocutor != null) {
      data['interlocutor'] = this.interlocutor!.toJson();
    }
    return data;
  }
}

class Interlocutor {
  String? id;
  String? userName;

  Interlocutor({this.id, this.userName});

  Interlocutor.fromJson(Map<String, dynamic> json) {
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
