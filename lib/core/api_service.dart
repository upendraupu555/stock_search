import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_market_search/models/auth/login_model.dart';
import 'package:stock_market_search/models/stocks/get_stock_by_id_model.dart';
import 'package:stock_market_search/models/stocks/get_stock_price_graph_model.dart';
import 'package:stock_market_search/models/stocks/search_stocks_model.dart';

class ApiService {
  final Dio _dio = Dio(
      BaseOptions(baseUrl: "https://illuminate-production.up.railway.app/api"));

  Future<LoginModel> login(String email, String password) async {
    try {
      Response response = await _dio.post("/auth/local", data: {
        "identifier": email,
        "password": password,
      });

      LoginModel loginModel = LoginModel.fromJson(response.data);
      String token = loginModel.jwt;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", token); // Save token for later use

      return loginModel;
    } catch (e) {
      throw Exception("Login failed: ${e.toString()}");
    }
  }

  Future<List<SearchStocksModel>> searchStocks(String query) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("auth_token");

      Response response = await _dio.get(
        "/stocks/search",
        queryParameters: {"query": query},
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      List<SearchStocksModel> searchStocksModel = [];
      if (response.statusCode == 200) {
        searchStocksModel = List<SearchStocksModel>.from(
            response.data.map((x) => SearchStocksModel.fromJson(x)));
      }

      return searchStocksModel;
    } catch (e,s) {
      if (kDebugMode) {
        print(s);
      }
      throw Exception("Stock search failed: ${e.toString()}");
    }
  }

  Future<GetStockByIdModel?> getStockById(int stockId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("auth_token");

      Response response = await _dio.get(
        "/stocks/$stockId",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode == 200) {
        GetStockByIdModel? getStockByIdModel =
            GetStockByIdModel.fromJson(response.data);
        return getStockByIdModel;
      }
      return null;
    } catch (e) {
      throw Exception("Fetching stock failed: ${e.toString()}");
    }
  }

  Future<GetStockPriceGraphModel?> getStockPriceGraph(
      int stockId, String range) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("auth_token");

      Response response = await _dio.get(
        "/stocks/$stockId/price-graph",
        queryParameters: {"range": range},
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      if (response.statusCode == 200) {
        GetStockPriceGraphModel? getStockPriceGraphModel =
            GetStockPriceGraphModel.fromJson(response.data);
        return getStockPriceGraphModel;
      }
      return null;


    } catch (e) {
      throw Exception("Fetching stock price graph failed: ${e.toString()}");
    }
  }
}
