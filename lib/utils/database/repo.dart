import '../../src/features/homepage/do/content.dart';

abstract class Repository<T> {
  Future<void> create(T resource);
  Future<void> delete(String resourceId);
  Future<List<T>> readAll(String ownerId, UserType? ownerType);
  Future<T> readOne(String resourceId, UserType? ownerType);
  Future<void> update(String resourceId, T resource);
}
