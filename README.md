# flutter_core
Projelerinizde kullanabileceğiniz çekirdek katman.
[ Update: 29.06.2021 ]

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
+ #### extensions: Bazı tür dönüşümleri yapmanıza yardımcı olur.
+ #### helper_functions: Kod yazarken sıze yardımcı olacak mini fonksiyonlar.
+ #### exceptions: Bir fonsiyonun belli bir kalıpta sonuç dönmesini sağlar.
#
### Firebase Database ( fb_database ):
Verilerinizi firebase veritabanında yönetmek istiyorsanız bu paketi kullanabilirsiniz.

Not: Varlıklarınızı entities klasöründeki IFbEntity sınıfından implement alın.
#
### Local Database ( local_database ):
Verilerinizi local bir veritabanında yönetmek istiyorsanız bu paketi kullanabilirsiniz.

Not: Varlıklarınızı entities klasöründeki IDbEntity sınıfından implement alın.
#
### Dosya İşlemleri ( file_operations ):
Verilerinizi bir dosyada tutmak istiyorsanız bu paketi kullanabilirsiniz. Bu veriler yazı veya resim olabilir.
#
### API Servisleri ( api_service ):
WebAPI üzerinden veri alışverişi yapmak için kullanabilirsiniz.
#

