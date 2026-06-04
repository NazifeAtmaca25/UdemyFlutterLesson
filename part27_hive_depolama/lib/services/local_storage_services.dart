import '../model/my_model.dart';

abstract class LocalStorageServices {

  Future<void> verileriKaydet(UserInformation information);
  Future<UserInformation> verileriGetir();
  
}