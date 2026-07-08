import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_shop_app/data/remote/api/categoryremotedatasource.dart';
import 'package:flutter_shop_app/domain/model/category.dart';
import 'package:flutter_shop_app/presentation/providers/categoriesadminprovider.dart';

class FakeCategoryDatasource implements CategoryRemoteDatasource {
  FakeCategoryDatasource(this._pages);

  final List<PaginatedCategories> _pages;
  int callCount = 0;

  @override
  Future<PaginatedCategories> getCategories(
      {int page = 1, int pageSize = 20}) async {
    callCount++;
    final index = page - 1;
    if (index < 0 || index >= _pages.length) {
      return const PaginatedCategories(count: 0, hasMore: false, results: []);
    }
    return _pages[index];
  }

  @override
  Future<Category> createCategory(Map<String, dynamic> payload) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCategory(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Category> getCategory(int id) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> getStats() {
    throw UnimplementedError();
  }

  @override
  Future<Category> updateCategory(int id, Map<String, dynamic> payload) {
    throw UnimplementedError();
  }
}

void main() {
  test('loadMore appends the next page of categories', () async {
    final datasource = FakeCategoryDatasource([
      const PaginatedCategories(
        count: 2,
        hasMore: true,
        results: [
          Category(
            id: 1,
            name: 'A',
            slug: 'a',
            description: '',
            isActive: true,
            totalProducts: 0,
            createdAt: '',
          ),
        ],
      ),
      const PaginatedCategories(
        count: 2,
        hasMore: false,
        results: [
          Category(
            id: 2,
            name: 'B',
            slug: 'b',
            description: '',
            isActive: true,
            totalProducts: 0,
            createdAt: '',
          ),
        ],
      ),
    ]);

    final notifier = CategoriesAdminNotifier(datasource);
    await Future<void>.delayed(Duration.zero);

    expect(notifier.state.categories.length, 1);
    expect(notifier.state.hasMore, isTrue);

    await notifier.load(reset: false);

    expect(notifier.state.categories.length, 2);
    expect(notifier.state.hasMore, isFalse);
    expect(datasource.callCount, 2);
  });
}
