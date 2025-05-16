import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/models/product.dart';

class FavoritesService {
  static const String _prefsKey = 'favorites';
  static List<int> _favoriteIds = [];
  static bool _initialized = false;

  // Initialiser en chargeant les favoris
  static Future<void> initialize() async {
    if (_initialized) return;
    
    final prefs = await SharedPreferences.getInstance();
    _favoriteIds = (prefs.getStringList(_prefsKey) ?? [])
        .map((id) => int.parse(id))
        .toList();
    
    _initialized = true;
  }

  // Vérifier si un produit est en favori
  static bool isFavorite(int productId) {
    return _favoriteIds.contains(productId);
  }

  // Ajouter un produit aux favoris
  static Future<void> addFavorite(int productId) async {
    if (!isFavorite(productId)) {
      _favoriteIds.add(productId);
      await _saveFavorites();
    }
  }

  // Supprimer un produit des favoris
  static Future<void> removeFavorite(int productId) async {
    _favoriteIds.remove(productId);
    await _saveFavorites();
  }

  // Basculer l'état de favori
  static Future<bool> toggleFavorite(int productId) async {
    if (isFavorite(productId)) {
      await removeFavorite(productId);
      return false;
    } else {
      await addFavorite(productId);
      return true;
    }
  }

  // Sauvegarder les favoris
  static Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      _prefsKey, 
      _favoriteIds.map((id) => id.toString()).toList()
    );
  }

  // Récupérer tous les IDs des favoris
  static List<int> getAllFavoriteIds() {
    return List.from(_favoriteIds);
  }
}