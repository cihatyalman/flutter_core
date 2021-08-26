# flutter_core
Projelerinizde kullanabileceğiniz çekirdek katman.
[ Update: 26.08.2021 ]

### Kullanılan kütüphaneler:
- sqflite
- firebase_core
- firebase_database
- http
#
"Core" klasörünü projenizin lib dizinine kopyalayarak kullanabilirsiniz. Projenizde kullanılmayacak klasörleri silebilirsiniz.(entities klasörü hariç)

NOT: Gerekli kütüphaneler yüklü değilse hata alabilirsiniz.
#
### Araçlar ( utilities ):
+ #### [extensions](https://github.com/cihatyalman/flutter_core/blob/master/Core/utilities/extensions.dart): Bazı tür dönüşümleri yapmanıza yardımcı olur.
+ #### [helper_functions](https://github.com/cihatyalman/flutter_core/blob/master/Core/utilities/helper_functions.dart): Kod yazarken size yardımcı olacak mini fonksiyonlar.
+ #### [exceptions](https://github.com/cihatyalman/flutter_core/tree/master/Core/utilities/exceptions): Bir fonsiyonun belli bir kalıpta sonuç dönmesini sağlar.
#
### Firebase Database ( [fb_database](https://github.com/cihatyalman/flutter_core/tree/master/Core/fb_database) ):
Verilerinizi firebase veritabanında yönetmek istiyorsanız bu paketi kullanabilirsiniz.

Not: Varlıklarınızı entities klasöründeki IFbEntity sınıfından implement alın.
#
### Local Database ( [local_database](https://github.com/cihatyalman/flutter_core/tree/master/Core/local_database) ):
Verilerinizi local bir veritabanında yönetmek istiyorsanız bu paketi kullanabilirsiniz.

Not: Varlıklarınızı entities klasöründeki IDbEntity sınıfından implement alın.
#
### Dosya İşlemleri ( [file_operations](https://github.com/cihatyalman/flutter_core/tree/master/Core/file_operations) ):
Verilerinizi bir dosyada tutmak istiyorsanız bu paketi kullanabilirsiniz. Bu veriler yazı veya resim olabilir.
#
### API Servisleri ( [api_service](https://github.com/cihatyalman/flutter_core/tree/master/Core/api_service) ):
WebAPI üzerinden veri alışverişi yapmak için kullanabilirsiniz.
#

