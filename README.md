# Flutter Core

Projelerinizde kullanabileceğiniz çekirdek katman. [ Update: 21.05.2022 ]

#

"core" klasörünü projenizin lib dizinine kopyalayarak kullanabilirsiniz. Projenizde kullanılmayacak klasörleri silebilirsiniz.

NOT: Gerekli kütüphaneler yüklü değilse hata alabilirsiniz.

#

### Kullanılan kütüphaneler:

- API Service
  - http
  - dio
- Local Database
  - sqflite
- QR Service
  - qr_flutter
  - qr_code_scanner
- Media Service
  - image_picker
  - file_picker
  - flutter_image_compress
  - image_cropper
  - video_player
  - chewie
- Firebase Service
  - firebase_core
  - firebase_database
  - cloud_firestore
  - firebase_auth
  - firebase_analytics
  - firebase_messaging
  - google_sign_in
- Cache Service
  - hive
  - hive_flutter
  - shared_preferences
- Other
  - awesome_notifications

#

### Araçlar ( [utils](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/utils) ):

- #### [extensions](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/utils/extensions.dart): Bazı tür dönüşümleri yapmanıza yardımcı olur.
- #### [mixins](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/utils/mixins): Sınıflara ek özellikler eklememizi sağlar.

#

### Firebase Servisleri ( [firebase_services](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services) ):

- #### [Realtime Database](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firebase_database_service.dart)
- #### [Firestore](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firebase_firestore_service.dart)
- #### [Firebase Auth](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firebase_auth_service.dart)
- #### [Firebase Push](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firebase_push_service.dart)
- #### [Firebase Analytics](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firebase_analytics_service.dart)
- #### [Firebase Google Auth](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firebase_google_auth_service.dart)

#

### Local Veritabanı ( [local_database](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/local_database) ):

Verilerinizi local bir veritabanında yönetmek istiyorsanız bu paketi kullanabilirsiniz.

#

### API Servisi ( [api_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/api_service) ):

WebAPI üzerinden veri alışverişi yapmak için kullanabilirsiniz.

#

### QR Servisi ( [qr_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/qr_service/qr_service.dart) ):

QR oluşturmak veya qr okumak için kullanabilirsiniz.

#

### Medya Servisleri ( [media_services](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/media_services) ):

- #### [camera_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/media_services/camera_service.dart): Kamera veya galeriyi kullanmak için kullanabilirsiniz.
- #### [video_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/media_services/video_service.dart): Videolarınızı oynatmak için kullanabilirsiniz.
- #### [file_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/media_services/file_service.dart): Telefondan resim, pdf, dosya vs. almak için kullanabilirsiniz.

#

### Ön Bellek Servisleri:

- #### [hive](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/cache_service)
- #### [shared_preferences](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/shared_preferences_service)

#

### Bildirim Servisi:

- #### [notification_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/notification_service)

#
