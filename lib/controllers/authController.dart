
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/models/http_exception.dart';

class AuthController extends GetxController{

  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  bool get isAuth{
    return token!= null;
}
  String? get token{
    if(_expiryDate!=null && _expiryDate!.isAfter(DateTime.now())&& _token != null){
      return _token;
    }
    return null;
  }
  Future<void> authenticateUser(String email, String password,String urlSegment)async{
    final url='https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyDdKEyC1gJmemPvLwog_0v9s1RTk9Lku70';
    try{
      final response=await http.post(Uri.parse(url),
          body: json.encode({
            'email':email,
            'password':password,
            'returnSecureToken':true,
          }));
      final responseData= json.decode(response.body);
      if (responseData['error']!=null){
        throw HttpException(responseData['error']['message']);
      }
      _token=responseData['idToken'];
      _userId=responseData['localId'];
      _expiryDate=DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn'])));
    }

    catch (error){
      throw error;
    }
  }
  Future<void> signUp(String email, String password)async{
    return authenticateUser(email, password, 'signUp');
  }
  Future<void> login(String email, String password)async{
    return authenticateUser(email, password, 'signInWithPassword');
  }



}