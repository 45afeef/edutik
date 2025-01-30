import '../../src/features/homepage/do/content.dart';

abstract class Repository<T> {
  Future<void> create(T model);
  Future<void> delete(String modelId);
  Future<List<T>> readAll(String ownerId, {UserType? ownerType});
  Future<T> readOne(String modelId, {UserType? ownerType});
  Future<void> update(String modelId, T model);
}
