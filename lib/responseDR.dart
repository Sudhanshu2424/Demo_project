class ResponseDR{
  String data;

  ResponseDR({required this.data});

  Map<String,dynamic> toJson() => {
    'data': data,
  };

  factory ResponseDR.fromJson(Map<String,dynamic> json) => ResponseDR(data: json['data']);

}