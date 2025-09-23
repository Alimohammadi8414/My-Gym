
class  User {
  int? id;
  String? fullname;
  String? phone;
  int? price;
  String? enddate;
  String? registerdate;
  int? registertype;

  User(
      {this.fullname,
      this.id,
      this.phone,
      this.price,
      this.enddate,
      this.registerdate,
      this.registertype});

  User.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['Full Name'];
    phone = json['Phone Number'];
    price = json['Price'];
    enddate = json['End Date'];
    registerdate = json["Register Date"];
    registertype = json['Register Type'];
  }

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "Full Name": fullname,
      "Phone Number": phone,
      "Price": price,
      "End Date": enddate,
      "Register Date": registerdate,
      "Register Type": registertype,
    };
  }
}
