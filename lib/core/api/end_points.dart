class EndPoint {
  static  String  baseUrl ="https://food-api-omega.vercel.app/api/v1/";
  static  String  signIn ="user/signin";
  static  String  signup ="user/signup";
  static  String  getUSerDataById(id) {
    return "user/get-user/$id";
  }
}



class ApiKey{
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String email = "email";
  static String password = "password";
  static String message = "message";
  static String token = "token";
  static String id = "id";
  static String name = "name";
  static String phone = "phone";
  static String location = "location";
  static String profilePic = "profilePic";
  static String confirmPassword = "confirmPassword";
  static String address = "address";
}