import 'package:dio/dio.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/categories_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/product_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/user/token_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/model/entities/user/user_entity.dart';
import 'package:nws_hieuvm_ecommerce_flutter/utils/logger.dart';

Future<TokenEntity?> signInRequest(String email, String password) async {
  final dio = Dio();
  try {
    final data = {'email': email, 'password': password};
    final response = await dio
        .post('https://api.escuelajs.co/api/v1/auth/login', data: data);
    final body = response.data;
    return TokenEntity(
        accessToken: body['access_token'], refreshToken: body['refresh_token']);
  } catch (e) {
    return null;
  }
}

Future<UserEntity?> signUpRequest(
    String name, String email, String password) async {
  const avatar =
      'https://www.nicepng.com/png/full/933-9332131_profile-picture-default-png.png';
  final dio = Dio();
  try {
    final data = {
      'name': name,
      'email': email,
      'password': password,
      'avatar': avatar,
    };
    final response =
        await dio.post('https://api.escuelajs.co/api/v1/users/', data: data);
    if (response.statusCode == 201) {
      final body = response.data;
      return body;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}

Future<List<CategoriesEntity>?> requestCategories() async {
  try {
    final dio = Dio();
    final response = await dio
        .get('https://v41l7.wiremockapi.cloud/api/v1/categories');
    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.data;
      List<CategoriesEntity> listCategories =
          responseData.map((json) => CategoriesEntity.fromJson(json)).toList();
      final totalProduct = listCategories.map((e) => requestTotalProduct(e.id!));
      final waitGetTotal = await Future.wait(totalProduct);
      List<CategoriesEntity>? result = [];
      for (int i = 0; i < listCategories.length; i++) {
        Map<String, dynamic> temp = listCategories[i].toJson();
        temp['totalProduct'] = waitGetTotal[i];
        result.add(CategoriesEntity.fromJson(temp));
      }
      return result;
    } else {
      return null;
    }
  } catch (e) {
    logger.e(e);
    return null;
  }
}

Future<int?> requestTotalProduct(int idCategory) async {
  try {
    final dio = Dio();
    final response = await dio.get(
        'https://v41l7.wiremockapi.cloud/api/v1/categories/$idCategory/products');
    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.data;
      List<ProductEntity> listProduct =
          responseData.map((json) => ProductEntity.fromJson(json)).toList();
      return listProduct.length;
    } else {
      return null;
    }
  } catch (e) {
    logger.e(e);
    return null;
  }
}

Future<List<ProductEntity>?> requestListProduct(int idCategory) async {
  try {
    final dio = Dio();
    final response = await dio.get(
        'https://v41l7.wiremockapi.cloud/api/v1/categories/$idCategory/products');
    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.data;
      List<ProductEntity> listProduct =
          responseData.map((json) => ProductEntity.fromJson(json)).toList();
      return listProduct;
    } else {
      return null;
    }
  } catch (e) {
    logger.e(e);
    return null;
  }
}

Future<ProductEntity?> requestProduct(int idProduct) async {
  try {
    final dio = Dio();
    final response =
        await dio.get('https://api.escuelajs.co/api/v1/products/$idProduct');
    if (response.statusCode == 200) {
      ProductEntity product = ProductEntity.fromJson(response.data);
      return product;
    } else {
      return null;
    }
  } catch (e) {
    logger.e(e);
    return null;
  }
}

Future<UserEntity> getProfileUser(String authToken) async {
  final dio = Dio();
  const baseUrl = 'https://api.escuelajs.co/api/v1/auth';

  try {
    final options = Options(headers: {
      'Authorization': 'Bearer $authToken',
    });
    final response = await dio.get('$baseUrl/profile', options: options);

    if (response.statusCode == 200) {
      return UserEntity.fromJson(response.data);
    } else {
      throw Exception('Failed to load profile data');
    }
  } catch (e) {
    logger.e(e);
    rethrow;
  }
}
