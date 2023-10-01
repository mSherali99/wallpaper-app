

import 'package:get_it/get_it.dart';
import 'package:wallpaper/data/source/api/my_api.dart';

GetIt di = GetIt.instance;

void diSetup() {

  di.registerSingleton(MyApi());
  
}