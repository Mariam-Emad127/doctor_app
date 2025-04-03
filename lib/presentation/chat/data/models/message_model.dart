class MessageModel {
final String type;
final String msgContent;
final String sender;
final String reciver;
final String time;//=DateTime.now().toUtc().toString().substring(0, 16);
  MessageModel( {required this.type, required this.msgContent,required this.sender,required this.reciver, required this.time });

   // Factory method لتحويل الـ Map إلى كائن MessagesModel
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      type: json["type"] ?? "",
      msgContent: json["message"] ?? "",
      sender: json["sender"] ?? "",
      reciver: json["reciver"] ?? "",
      time:json["time"]??"" 
    );
  } 
}