import 'package:go_router/go_router.dart';
import 'package:store/layouts/root_layout.dart';
import 'package:store/models/product.dart';
import 'package:store/screens/cart_screen.dart';
import 'package:store/screens/category_screen.dart';
import 'package:store/screens/home_screen.dart';
import 'package:store/screens/login_screen.dart';
import 'package:store/screens/product_detail_screen.dart';
import 'package:store/screens/list_favori_screen.dart';

class RouterService {
  // liste des routes de l'application
  GoRouter getRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => RootLayout(screen: HomeScreen()),
        ),
        GoRoute(
          path: '/category',
          name: 'category',
          builder: (context, state) => RootLayout(screen: CategoryScreen()),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => RootLayout(screen: LoginScreen()),
        ),
        // ? Route créée pour afficher la liste des favoris : Keziah
        GoRoute(
       path: '/favoris',
       name: 'favoris',
       builder: (context, state) => RootLayout(screen: ListFavoriScreen()),
     ),
        // !Route créée pour afficher le détail d'un produit : Salimou
        // ? Rajout de layout pour la page de détail : Keziah
        GoRoute(
          path: '/product-detail',
          name: 'product-detail',
          builder: (context, state) => RootLayout(screen: ProductDetailScreen()),
        ),
        GoRoute(
          path: '/cart',
          name: 'cart',
          builder: (context, state) => RootLayout(screen: CartScreen()),
        ),
      ],
    );
  }
}
