# flutter_core
Projelerinizde kullanabileceğiniz çekirdek katman.
[ Update: 13.12.2021 ]

### Kullanılan kütüphaneler:
- http
- dio
- sqflite
- firebase_core
- firebase_database
- cloud_firestore  
- firebase_auth
- firebase_analytics
- firebase_messaging
#
"core" klasörünü projenizin lib dizinine kopyalayarak kullanabilirsiniz. Projenizde kullanılmayacak klasörleri silebilirsiniz.

NOT: Gerekli kütüphaneler yüklü değilse hata alabilirsiniz.
#
### Araçlar ( utilities ):
+ #### [extensions](https://github.com/cihatyalman/flutter_core/blob/master/lib/core/utilities/extensions.dart): Bazı tür dönüşümleri yapmanıza yardımcı olur.
+ #### [helper_functions](https://github.com/cihatyalman/flutter_core/blob/master/lib/core/utilities/helper_functions.dart): Kod yazarken size yardımcı olacak mini fonksiyonlar.
+ #### [results](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/utilities/results): Bir fonsiyonun belli bir kalıpta sonuç dönmesini sağlar.
#
### Firebase Servisleri ( [firebase_services](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services) ):
+ #### [Realtime Database](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firebase_database_service.dart)
+ #### [Firestore](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firestore_service.dart)
+ #### [Firebase Auth](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firebase_auth_service.dart)
+ #### [Firebase Push](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firebase_push_service.dart)
+ #### [Firebase Analytics](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firebase_analytics_service.dart)
#
### Local Database ( [local_database](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/local_database) ):
Verilerinizi local bir veritabanında yönetmek istiyorsanız bu paketi kullanabilirsiniz.
#
### API Servisleri ( [api_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/api_service) ):
WebAPI üzerinden veri alışverişi yapmak için kullanabilirsiniz.
#
