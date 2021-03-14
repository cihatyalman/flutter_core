# flutter_core
Projelerinizde kullanabileceğiniz çekirdek katman.
#
### Kullanılan kütüphaneler:
- sqflite
- firebase_core
- firebase_database
#
"Core" klasörünü projenizin lib dizinine kopyalayarak kullanabilirsiniz. Projenizde kullanılmayacak klasörleri silebilirsiniz.(entities hariç)

NOT: Gerekli kütüphaneler yüklü değilse hata alabilirsiniz.
#
### Uzantılar ( utilities/extensions ):
+ #### conversion_tool: Bazı tür dönüşümleri yapmanıza yardımcı olur.
  - String -> Byte veya List<String> -> Byte gibi dönüşümleri yapabilirsiniz.
  - Uint8List(Byte) -> Image veya Uint8List(Byte) -> String gibi dönüşümleri yapabilirsiniz.
  - List<IBaseEntity> -> List<Map> gibi dönüşümleri yapabilirsiniz.
#
### Result ( exceptions/result_exceptions ):
Bir fonsiyonun belli bir kalıpta sonuç dönmesini istiyorsanız kullanabilirsiniz.

Örnek olarak, "success, message" döndürebilirsiniz veya "data, success, message" döndürebilirsiniz.
#
### Local Database ( sqflite_operations ):
Verilerinizi local bir veritabanında yönetmek istiyorsanız bu paketi kullanabilirsiniz.

Not: Varlıklarınızı entities klasöründeki IDbEntity sınıfından implement alın.
#
### Datetime İşlemleri ( datetime_operations ):
Geçerli tarihi (gmt ayarlanabilir) timestamp olarak kullanabilirsiniz. Ayrıca istenildiği zaman datetime ve timestamp arası dönüşümler yapabilirsiniz.
#
### Json Dosya İşlemleri ( json_file_operations ):
Json türünde olan verilerinizi bir dosyada tutmak isterseniz kullanabilirsiniz.
#



