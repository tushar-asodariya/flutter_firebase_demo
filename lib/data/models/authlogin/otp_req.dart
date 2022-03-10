class Otpreq {
  String? contact_number;
  String? country_code;
  Otpreq({this.contact_number, this.country_code});

  Otpreq.fromJson(Map<String, dynamic> json) {
    contact_number = json['contact_number'];
    country_code = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.contact_number != null) {
      data['contact_number'] = this.contact_number;
    }
    if (this.country_code != null) {
      data['country_code'] = this.country_code;
    }
    return data;
  }
}
