
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/stock_details_provider.dart';
import '../../providers/stock_graph_provider.dart';

class StockDetailsScreen extends ConsumerWidget {
  final int stockId;

  const StockDetailsScreen({super.key, required this.stockId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockState = ref.watch(stockDetailsProvider(stockId));
    final graphState = ref.watch(stockGraphProvider(stockId));
    final stockDetailsNotifier =
        ref.read(stockDetailsProvider(stockId).notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock Details"),
      ),
      body: stockState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (stock) => Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(stock?.name ?? '',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Current Price: ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("\$ ${stock?.price.toString() ?? ''  }",
                            style: const TextStyle(fontSize: 24)),
                        const SizedBox(width: 10,),
                        Text(stock?.changePercent?.toStringAsPrecision(4).toString() ?? '',
                            style:   TextStyle(
                              fontSize: 18,
                              color: ((stock?.changePercent ?? 0) > 0) ?  Colors.green : Colors.red ,
                            ))
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                textWidget("Description: ", stock?.description ?? ''),
                const SizedBox(height: 8),
                textWidget("Listing date: ",
                    stock?.listingDate?.toIso8601String().split("T")[0] ?? ''),
                const SizedBox(height: 16),
                const Text("Price Chart",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey6,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CupertinoSegmentedControl<String>(
                      borderColor: Colors.transparent,
                      selectedColor: Colors.white,
                      unselectedColor: CupertinoColors.systemGrey6,
                      pressedColor: Colors.white.withOpacity(0.5),
                      children: {
                        for (var range in stockDetailsNotifier.ranges)
                          range: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              range,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color:
                                    stockDetailsNotifier.rangeDropdownValue ==
                                            range
                                        ? CupertinoColors.activeBlue
                                        : CupertinoColors.black,
                              ),
                            ),
                          ),
                      },
                      groupValue: stockDetailsNotifier.rangeDropdownValue,
                      onValueChanged: (newRange) {
                        stockDetailsNotifier.rangeDropdownValue = newRange;
                        ref
                            .read(stockGraphProvider(stockId).notifier)
                            .fetchGraphData(newRange);
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                graphState.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  data: (prices) => const Expanded(
                    child: Text("Graph"),
                  ),
                  error: (err, _) => const Text(
                      "No graphs available for this stock for now. Please try again later"),
                ),
              ],
            ),
          ),
        ),
        error: (err, _) => Center(child: Text("Error: $err")),
      ),
    );
  }

  Widget textWidget(String headline, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headline,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        Text(text, style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}
