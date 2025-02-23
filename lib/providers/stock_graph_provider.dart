import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_market_search/core/api_service.dart';
import 'package:stock_market_search/models/stocks/get_stock_price_graph_model.dart';

final stockGraphProvider = StateNotifierProvider.family<
    StockGraphNotifier,
    AsyncValue<GetStockPriceGraphModel?>,
    int>((ref, stockId) => StockGraphNotifier(stockId));

class StockGraphNotifier
    extends StateNotifier<AsyncValue<GetStockPriceGraphModel?>> {
  final int stockId;


  StockGraphNotifier(this.stockId) : super(const AsyncValue.loading()) {
    fetchGraphData("1D"); // Default range: 1 Day
  }

  final ApiService _apiService = ApiService();

  Future<void> fetchGraphData(String range) async {
    state = const AsyncValue.loading();
    try {
      GetStockPriceGraphModel? prices =
          await _apiService.getStockPriceGraph(stockId, range);
      state = AsyncValue.data(prices);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
