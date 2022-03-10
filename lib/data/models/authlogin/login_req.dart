class Loginreq {
  String? contact_number;
  String? country_code;
  String? otp;
  String? device_type;
  String? device_token;
  Loginreq(
      {this.contact_number,
      this.country_code,
      this.device_token,
      this.device_type,
      this.otp});

  Loginreq.fromJson(Map<String, dynamic> json) {
    contact_number = json['contact_number'] ?? '';
    country_code = json['country_code'] ?? '';
    otp = json['otp'] ?? '';
    device_type = json['device_type'] ?? '';
    device_token = json['device_token'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.contact_number != null) {
      data['contact_number'] = this.contact_number;
    }
    if (this.country_code != null) {
      data['country_code'] = this.country_code;
    }
    if (this.device_type != null) {
      data['device_type'] = this.device_type;
    }
    if (this.otp != null) {
      data['otp'] = this.otp;
    }
    if (this.device_token != null) {
      data['device_token'] = this.device_token;
    }
    return data;
  }
}
