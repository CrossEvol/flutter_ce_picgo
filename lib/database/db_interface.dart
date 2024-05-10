
late DbInterface dbProvider;

abstract interface class DbInterface {

  Future init({bool isCreate = false});

  Future<List> getAllSettings();
}