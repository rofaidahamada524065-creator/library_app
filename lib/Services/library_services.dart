import 'package:dio/dio.dart';
import 'package:library_app/Models/library_model.dart';

class LibraryServices {
  static Dio dio = Dio();
  static Future<LibraryModel> LibraryRequest() async {
    try {
      Response response = await dio.get(
        "https://librarysystemflutterteam.runasp.net/api/Book/GetBooks",
      );
      print("Response Data: ${response.data}");
      return LibraryModel.fromjson(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (other) {
      throw Exception("Error : ${other.toString()}");
    }
  }

  static Future<LibraryModel> SearchRequest({required String title}) async {
    try {
      Response response = await dio.get(
        "https://librarysystemflutterteam.runasp.net/api/Book/GetBookByName?Bookname=$title",
      );
      print("Response Data: ${response.data}");
      return LibraryModel.fromjson(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (other) {
      throw Exception("Error : ${other.toString()}");
    }
  }
}
