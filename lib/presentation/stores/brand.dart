import 'package:mobx/mobx.dart';
import 'package:walkway_mobile/domain/models/brand.dart';
import 'package:walkway_mobile/domain/services/brand.dart';

part 'brand.g.dart';

class BrandStore = _BrandStore with _$BrandStore;

abstract class _BrandStore with Store {
  final BrandService _brandService;

  _BrandStore(this._brandService);

  @observable
  ObservableList<Brand> brands = ObservableList<Brand>();

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @action
  Future<void> fetchBrands() async {
    isLoading = true;
    error = null;

    try {
      final fetchedBrands = await _brandService.getAllBrands();
      brands.clear();
      brands.addAll(fetchedBrands);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
