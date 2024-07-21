import 'package:auto_injector/auto_injector.dart';
import 'package:uno/uno.dart';

import 'app_store.dart';
import 'shared/services/http_client/i_http_client.dart';
import 'shared/services/http_client/uno_http_client.dart';
import 'shared/services/local_storage/shared_preferences_service.dart';
import 'shared/services/theme/theme_app_store.dart';

final injector = AutoInjector(on: (i) {
  // services
  i.addSingleton<Uno>(Uno.new);
  i.addSingleton<IHttpClient>(UnoHttpClient.new);
  i.addSingleton<SharedPreferencesService>(SharedPreferencesService.new);

  // repositories

  // stores
  i.addSingleton<ThemeAppStore>(ThemeAppStore.new);
  i.addSingleton<AppStore>(AppStore.new);
});
