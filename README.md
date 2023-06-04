# Flutter Core

Projelerinizde kullanabileceğiniz çekirdek katman. [ Update: 04.06.2023 ]

#

"core" klasörünü projenizin lib dizinine kopyalayarak kullanabilirsiniz. Projenizde kullanılmayacak klasörleri silebilirsiniz.

NOT: Gerekli kütüphaneler yüklü değilse hata alabilirsiniz.

#

### Kullanılan kütüphaneler:

<table>
  <tr valign="top">
    <td>
      <ul>
        <li>API Service</li>
        <ul>
          <li>http</li>
          <li>dio</li>
        </ul>
        <li>Firebase Service</li>
        <ul>
          <li>firebase_core</li>
          <li>firebase_database</li>
          <li>cloud_firestore</li>
          <li>firebase_auth</li>
          <li>firebase_analytics</li>
          <li>google_sign_in</li>
          <li>firebase_dynamic_links</li>
        </ul>
        <li>Media Service</li>
        <ul>
          <li>image_picker</li>
          <li>image_cropper</li>
          <li>flutter_image_compress</li>
          <li>file_picker</li>
          <li>video_player</li>
          <li>chewie</li>
          <li>flutter_sound_record</li>
          <li>just_audio</li>
        </ul>
        <li>Map Service</li>
        <ul>
          <li>google_maps_flutter</li>
          <li>geolocator</li>
          <li>geocoding</li>
        </ul>
      </ul>
    </td>
    <td>
      <ul>
        <li>Notification Service</li>
        <ul>
          <li>awesome_notifications</li>
          <li>firebase_messaging</li>
          <li>onesignal_flutter</li>
        </ul>
        <li>Shared Preferences Service</li>
        <ul>
          <li>shared_preferences</li>
        </ul>
        <li>Local Database</li>
        <ul>
          <li>sqflite</li>
        </ul>
        <li>Other</li>
        <ul>
          <li>hive</li>
          <li>hive_flutter</li>
          <li>qr_flutter</li>
          <li>qr_code_scanner</li>
          <li>flutter_downloader</li>
          <li>crypto</li>
        </ul>
        <li>Base</li>
        <ul>
          <li>path_provider</li>
          <li>screenshot</li>
        </ul>
      </ul>
    </td>
  </tr>
</table>

#

### Araçlar ( [utils](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/utils) ):

- #### [extensions](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/utils/extensions.dart): Bazı tür dönüşümleri yapmanıza yardımcı olur.
- #### [mixins](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/utils/mixins): Sınıflara ek özellikler eklememizi sağlar.

#

### API Servisi ( [api_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/api_service) ):

WebAPI üzerinden veri alışverişi yapmak için kullanabilirsiniz.

#

### Firebase Servisleri ( [firebase_services](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services) ):

- #### [Realtime Database](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firebase_database_service.dart)
- #### [Firestore](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firebase_firestore_service.dart)
- #### [Firebase Auth](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firebase_auth_service.dart)
- #### [Firebase Analytics](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firebase_analytics_service.dart)
- #### [Firebase Google Auth](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firebase_google_auth_service.dart)
- #### [Firebase Dynamic Link](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/firebase_services/firebase_dynamic_link_service.dart)

#

### Medya Servisleri ( [media_services](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/media_services) ):

- #### [camera_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/media_services/camera_service.dart): Kamera veya galeriyi kullanmak için kullanabilirsiniz.
- #### [file_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/media_services/file_service.dart): Telefondan resim, pdf, dosya vs. almak için kullanabilirsiniz.
- #### [video_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/media_services/video_service.dart): Videolarınızı oynatmak için kullanabilirsiniz.
- #### [audio_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/media_services/audio_service.dart): Ses kaydetmek veya oynatmak için kullanabilirsiniz.

#

### Harita Servisleri ( [map_services](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/map_services) ):

- #### [map_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/map_services/map_service.dart)
- #### [location_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/map_services/location_service.dart)

#

### Bildirim Servisleri ( [notification_services](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/notification_services) ):

- #### [awesome_notification_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/notification_services/awesome_notification_service.dart)
- #### [firebase_push_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/notification_services/firebase_push_service.dart)
- #### [onesignal_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/notification_services/onesignal_service.dart)

#

### Local Veritabanı ( [local_database](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/local_database) ):

Verilerinizi local bir veritabanında yönetmek istiyorsanız bu servisi kullanabilirsiniz.

#

### Diğer Servisler ( [other_services](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/other_services) ):

- #### [cache_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/other_services/cache_service.dart): Verilerinizi cihazın ön belleğinde saklamak için kullanabilirsiniz.
- #### [qr_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/other_services/qr_service.dart): QR oluşturmak veya okumak için kullanabilirsiniz.
- #### [download_service](https://github.com/cihatyalman/flutter_core/tree/master/lib/core/other_services/download_service.dart): Medya dosyalarınızı cihazınıza indirmek için kullanabilirsiniz.

#
