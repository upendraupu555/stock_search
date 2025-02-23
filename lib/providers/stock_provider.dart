import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_market_search/core/api_service.dart';
import 'package:stock_market_search/models/stocks/search_stocks_model.dart';


final stockSearchProvider = StateNotifierProvider<StockNotifier, AsyncValue<List<dynamic>>>((ref) => StockNotifier());

class StockNotifier extends StateNotifier<AsyncValue<List<dynamic>>> {
  StockNotifier() : super(const AsyncValue.data([]));

  final ApiService _apiService = ApiService();

  TextEditingController searchController = TextEditingController();

  List<SearchStocksModel> stocks = [];

  Future<void> searchStocks(String query) async {
    state = const AsyncValue.loading();
    try {
       stocks = await _apiService.searchStocks(query);
      state = AsyncValue.data(stocks);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
