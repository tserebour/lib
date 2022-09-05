abstract class Human{
  final String server = '169.254.248.163';
  String name = "";
  String username = "";
  String password = "";
  String confirm_password = "";


   Future login();
   Future signup();
}