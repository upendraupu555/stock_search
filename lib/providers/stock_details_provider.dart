import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_market_search/core/api_service.dart';
import 'package:stock_market_search/models/stocks/get_stock_by_id_model.dart';

final stockDetailsProvider = StateNotifierProvider.family<
    StockDetailsNotifier,
    AsyncValue<GetStockByIdModel?>,
    int>((ref, stockId) => StockDetailsNotifier(stockId));

class StockDetailsNotifier
    extends StateNotifier<AsyncValue<GetStockByIdModel?>> {
  final int stockId;

  StockDetailsNotifier(this.stockId) : super(const AsyncValue.loading()) {
    rangeDropdownValue = ranges.first;
    fetchStockDetails();
  }

  final ApiService _apiService = ApiService();
  String rangeDropdownValue = '';
  final List<String> ranges = ["1D", "1W", "1M", "1Y", "5Y"];

  Future<void> fetchStockDetails() async {
    try {
      final GetStockByIdModel? stockDetails =
          await _apiService.getStockById(stockId);
      state = AsyncValue.data(stockDetails);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
