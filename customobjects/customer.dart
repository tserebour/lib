import 'human.dart';
import 'package:http/http.dart' as http;
import 'receipt.dart';
import 'dart:convert';


class Customer extends Human {

  String lastname = "";
  String address = "";
  String email = "";
  String phone = "";

  Receipt receipt = new Receipt();


  //login method
  Future <String> login() async {

    var url = Uri.http(this.server, '/laundry/login_val.php');


    Map user_info = await{
      'username': this.username,
      'password': this.password

    };

    var response = await http.post(url, body: user_info);
    // var response = http.post(Uri.http(this.server, '/laundry/login_val.php'));

    String r = response.body.toString();

    if(response.statusCode == 200){

      print('status: ${response.statusCode}');
      print('status: ${response.body}');
      this.response  =  r;
      return response.body.toString();

    }else{
      return 'error';
    }







  }

// signup method
  Future  signup() async {



      var url = Uri.http(this.server, '/laundry/signup.val.php');


      Map user_info = await{
        'username': this.username,
        'firstname': this.name,
        'lastname': this.lastname,
        'address': this.address,
        'phone': this.phone,
        'email': this.email,
        'password': this.password,
        'confirm_password': this.confirm_password
      };

      var response = await http.post(url, body: user_info);
      if(response.statusCode == 200){

        print('status: ${response.statusCode}');
        print('status: ${response.body}');
        this.response = response.body.toString();

        return this.response;

      }else{
        return 'error';
      }


  }

// method for customer to get served
  Future getServed() async{

    var url = Uri.http(this.server, '/laundry/signup.val.php');

    String customer = json.encode(this);

    Map user_info = await{
      'customer': customer
    };

    var response = await http.post(url, body: user_info);


    print('status: ${response.statusCode}');
    print('status: ${response.body}');
    this.response = response.body.toString();

    return this.response;



  }

}