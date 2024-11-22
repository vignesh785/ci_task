import 'package:ci_task/features/Home_page/Model/photos_api_response.dart';
import 'package:ci_task/features/Home_page/Model/product_model.dart';
import 'package:ci_task/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeController extends ChangeNotifier {
  final HomeRepository _homeRepository = HomeRepository();

  PhotosApiResponse? _photosApiResponse;
  PhotosApiResponse? get photosApiResponse => _photosApiResponse;

  PhotosApiResponse? _searchResponse;
  PhotosApiResponse? get searchResponse => _searchResponse;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final int _perPage = 10;
  int get perPage => _perPage;

  int _page = 1;
  int get page => _page;

  Future<void> init() async {
    _productBox = Hive.box<Product>('products');
    await fetchData();
  }

  Future<void> fetchData({bool isPagenation = false}) async {
    if (isPagenation) {
      _page += 1;
    }
    toggleLoading();
    final photosData = await _homeRepository.getPhotosData(page: _page, perPage: _perPage);
    if (isPagenation) {
      _photosApiResponse?.data?.addAll(photosData.data ?? []);
    } else {
      _photosApiResponse = photosData;
    }
    toggleLoading();
  }

  Future<void> searchData({String? search}) async {
    try {
      toggleLoading();
      _searchResponse = await _homeRepository.searchData(search: search);
    } catch (error) {
      debugPrint("Search failed: $error");
    } finally {
      toggleLoading();
    }
    notifyListeners();
  }

  void toggleLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

// hive
  Box<Product>? _productBox;
  Box<Product>? get productBox => _productBox;

  List<Product>? get getProduct {
    return _productBox?.values.toList();
  }

  Future<void> createProduct(Product newProduct) async {
    await _productBox?.add(newProduct);
    notifyListeners();
  }

  Future<void> updateProduct(int index, Product updateProduct) async {
    await _productBox?.putAt(index, updateProduct);
    notifyListeners();
  }

  Future<void> deleteProduct(index) async {
    await _productBox?.deleteAt(index);
    notifyListeners();
  }
}
