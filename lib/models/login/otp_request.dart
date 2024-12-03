class OtpRequest {
  String? phone;
  String? otp;
  String? fcmToken;

  OtpRequest({this.phone, this.otp, this.fcmToken});

  OtpRequest.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    otp = json['otp'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['otp'] = otp;
    data['fcm_token'] = fcmToken;
    return data;
  }
}
