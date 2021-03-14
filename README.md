# flutter_core
Projelerinizde kullanabileceğiniz çekirdek katman.
#
### Kullanılan kütüphaneler:
- sqflite
- firebase_core
- firebase_database
#
"Core" klasörünü projenizin lib dizinine kopyalayarak kullanabilirsiniz. Projenizde kullanılmayacak klasörleri silebilirsiniz.(entities klasörü hariç)

NOT: Gerekli kütüphaneler yüklü değilse hata alabilirsiniz.
#
### Uzantılar ( utilities/extensions ):
+ #### conversion_tool: Bazı tür dönüşümleri yapmanıza yardımcı olur.
  - String -> Byte veya List&<String> -> Byte gibi dönüşümleri yapabilirsiniz.
  - Uint8List(Byte) -> Image veya Uint8List(Byte) -> String gibi dönüşümleri yapabilirsiniz.
  - List<IBaseEntity> -> List<Map> gibi dönüşümleri yapabilirsiniz.
#
### Result ( exceptions/result_exceptions ):
Bir fonsiyonun belli bir kalıpta sonuç dönmesini istiyorsanız kullanabilirsiniz.

Örnek olarak, "success, message" döndürebilirsiniz veya "data, success, message" döndürebilirsiniz.
#
### Firebase Database ( fb_database_operations ):
Verilerinizi firebase veritabanında yönetmek istiyorsanız bu paketi kullanabilirsiniz.

Not: Varlıklarınızı entities klasöründeki IFbEntity sınıfından implement alın.
#
### Local Database ( sqflite_operations ):
Verilerinizi local bir veritabanında yönetmek istiyorsanız bu paketi kullanabilirsiniz.

Not: Varlıklarınızı entities klasöründeki IDbEntity sınıfından implement alın.
#
### Dosya İşlemleri ( file_operations ):
Verilerinizi bir dosyada tutmak istiyorsanız bu paketi kullanabilirsiniz. Bu veriler yazı veya resim olabilir.
#

