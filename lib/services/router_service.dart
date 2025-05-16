import 'package:go_router/go_router.dart';
import 'package:store/layouts/root_layout.dart';
import 'package:store/screens/category_screen.dart';
import 'package:store/screens/home_screen.dart';
import 'package:store/screens/login_screen.dart';
import 'package:store/screens/product_detail_screen.dart';
import 'package:store/models/product.dart';

class RouterService {
  GoRouter getRouter() {
    return GoRouter(
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            // RootLayout est affiché tout le temps, avec son body = child
            return RootLayout(screen: child);
          },
          routes: [
            GoRoute(
              path: '/',
              name: 'home',
              builder: (context, state) => HomeScreen(),
            ),
            GoRoute(
              path: '/category',
              name: 'category',
              builder: (context, state) => CategoryScreen(),
            ),
            GoRoute(
              path: '/login',
              name: 'login',
              builder: (context, state) => LoginScreen(),
            ),
            GoRoute(
              path: '/product-detail',
              name: 'product-detail',
              builder: (context, state) {
                final product = state.extra as Product;
                return ProductDetailScreen(product: product);
              },
            ),
          ],
        ),
      ],
    );
  }
}
