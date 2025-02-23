import 'package:go_router/go_router.dart';
import 'package:stock_market_search/screens/settings/settings.dart';
import '../screens/auth/login_screen.dart';
import '../screens/stocks/stock_search_screen.dart';
import '../screens/stocks/stock_details_screen.dart';

// GoRouter configuration
GoRouter router(token) => GoRouter(
      initialLocation: token != null && token.isNotEmpty ? '/search' : '/login', // Default route
      redirect: (context, state) async {
        if (token == null && state.name != '/login') {
          return '/login'; // Redirect to login if unauthenticated
        }
        return null; // Continue normally
      },
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginScreen(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const StockSearchScreen(),
        ),
        GoRoute(
          path: '/stock/:id',
          builder: (context, state) {
            final stockId = int.parse(state.pathParameters['id']!);
            return StockDetailsScreen(stockId: stockId);
          },
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) =>  const SettingsScreen(),
        ),
      ],
    );
