# flutter_core
Projelerinizde kullanabileceğiniz çekirdek katman.
[ Update: 09.06.2021 ]

### Güncelleme Notları
+ "conversion_tool" scriptine "toEnglishAlphabet" eklendi. 
  -  Türkçe harfleri(ç,ğ,ı,ö,ş,ü) ingilizce harflere(c,g,i,o,s,u) çevirir.
+ "utilities" klasörüne "helper_functions" scripti eklendi. 
  - Küçük yardımcı metotlar ile işlemlerinizi daha hızlı ve kolay bir şekilde yapabilirsiniz.
#
### Kullanılan kütüphaneler:
- sqflite
- firebase_core
- firebase_database
- http
#
"Core" klasörünü projenizin lib dizinine kopyalayarak kullanabilirsiniz. Projenizde kullanılmayacak klasörleri silebilirsiniz.(entities klasörü hariç)

NOT: Gerekli kütüphaneler yüklü değilse hata alabilirsiniz.
#
### Uzantılar ( utilities/extensions ):
+ #### conversion_tool: Bazı tür dönüşümleri yapmanıza yardımcı olur.
  - "String -> Byte" veya "List< String> -> Byte" gibi dönüşümleri yapabilirsiniz.
  - "Uint8List(Byte) -> Image" veya "Uint8List(Byte) -> String" gibi dönüşümleri yapabilirsiniz.
  - "List< IBaseEntity> -> List< Map>" gibi dönüşümleri yapabilirsiniz.
#
### Result ( exceptions/result_exceptions ):
Bir fonsiyonun belli bir kalıpta sonuç dönmesini istiyorsanız kullanabilirsiniz.

Örnek olarak, "success, message" döndürebilirsiniz veya "data, success, message" döndürebilirsiniz.
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

