
late DbInterface dbProvider;

abstract interface class DbInterface {

  Future<void> init({bool isCreate = false});

  Future<List> getAllSettings();
}