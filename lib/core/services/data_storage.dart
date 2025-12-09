/// Legacy in-memory storage stub kept for reference.
///
/// Team and auth flows now rely on the GraphQL backend, so this class should
/// no longer be instantiated or imported anywhere. It remains as an empty
/// placeholder to avoid stray imports breaking the build if referenced by
/// mistake.
class DataStorage {
  const DataStorage._();
}
