import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:patch_task/src/common/constants/api_helper.dart';

@injectable
class ProductRemoteDataSource {
  final Dio _dio = Dio();

  Future<Response> getProductList() async {
    try {
      Response response = await _dio.get(
        ApiHelper.productApi,
        options: Options(
          contentType: "application/json",
          headers: {
            HttpHeaders.acceptHeader: "application/json",
          },
        ),
      );

      debugPrint("Get Product List Code: ${response.statusCode}");
      debugPrint("Get Product List Data: ${response.data}");

      return response;
    } on SocketException catch (e) {
      debugPrint("Get Product List Socket Error: ${e.message}");
      rethrow;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.receiveTimeout) {
        //ToastMsg.showToast(msg: StringHelper.serverDown);
      } else {
        debugPrint("Get Product List Dio Error Code: ${e.response!.statusCode}");
        debugPrint("Get Product List Dio Error Data: ${e.response!.data}");
      }
      rethrow;
    } catch (e) {
      debugPrint("Get Product List Catch Error: $e");
      rethrow;
    }
  }

  Future<Response> getCategoryList() async {
    try {
      Response response = await _dio.get(
        ApiHelper.categoryApi,
        options: Options(
          contentType: "application/json",
          headers: {
            HttpHeaders.acceptHeader: "application/json",
          },
        ),
      );

      debugPrint("Get Product List Code: ${response.statusCode}");
      debugPrint("Get Product List Data: ${response.data}");

      return response;
    } on SocketException catch (e) {
      debugPrint("Get Product List Socket Error: ${e.message}");
      rethrow;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.receiveTimeout) {
        //ToastMsg.showToast(msg: StringHelper.serverDown);
      } else {
        debugPrint("Get Product List Dio Error Code: ${e.response!.statusCode}");
        debugPrint("Get Product List Dio Error Data: ${e.response!.data}");
      }
      rethrow;
    } catch (e) {
      debugPrint("Get Product List Catch Error: $e");
      rethrow;
    }
  }

  Future<Response> getProductsCategoryList({required String catName}) async {
    try {
      Response response = await _dio.get(
        "${ApiHelper.productCategoryApi}$catName",
        options: Options(
          contentType: "application/json",
          headers: {
            HttpHeaders.acceptHeader: "application/json",
          },
        ),
      );

      debugPrint("Get Product by Category List Code: ${response.statusCode}");
      debugPrint("Get Product by Category List Data: ${response.data}");

      return response;
    } on SocketException catch (e) {
      debugPrint("Get Product by Category List Socket Error: ${e.message}");
      rethrow;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.receiveTimeout) {
        //ToastMsg.showToast(msg: StringHelper.serverDown);
      } else {
        debugPrint("Get Product by Category List Dio Error Code: ${e.response!.statusCode}");
        debugPrint("Get Product by Category List Dio Error Data: ${e.response!.data}");
      }
      rethrow;
    } catch (e) {
      debugPrint("Get Product by Category List Catch Error: $e");
      rethrow;
    }
  }


}