import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_market_search/models/stocks/search_stocks_model.dart';
import '../../providers/stock_provider.dart';

class StockSearchScreen extends ConsumerWidget {
  const StockSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockState = ref.watch(stockSearchProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Stocks"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.push("/settings");
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller:
                  ref.read(stockSearchProvider.notifier).searchController,
              decoration: InputDecoration(
                labelText: "Enter stock name",
                prefixIcon: const Icon(Icons.search),
                hintText: "Enter 3 letters to start searching...",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (query) {
                if (query.length > 2) {
                  ref.read(stockSearchProvider.notifier).searchStocks(query);
                }
                if (query.isEmpty) {
                  ref.read(stockSearchProvider.notifier).stocks = [];
                  ref.refresh(stockSearchProvider.notifier);
                }
              },
            ),
            const SizedBox(height: 16),
            stockState.when(
              loading: () => const CircularProgressIndicator(),
              data: (stocks) =>
                  ref.read(stockSearchProvider.notifier).stocks.isEmpty
                      ? const Text("No results found")
                      : Expanded(
                          child: ListView.builder(
                            itemCount: stocks.length,
                            itemBuilder: (context, index) {
                              SearchStocksModel stock = stocks[index];
                              return Card(
                                child: ListTile(
                                  leading: CachedNetworkImage(
                                    height: 30,
                                    width: 30,
                                    imageUrl: stock.image?.url ?? '',
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                  title: Text(stock.name ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text(stock.symbol ?? ''),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                  onTap: () {
                                    context.push('/stock/${stock.id}');
                                  },
                                ),
                              );
                            },
                          ),
                        ),
              error: (err, _) => Text("Error: $err"),
            ),
          ],
        ),
      ),
    );
  }
}
