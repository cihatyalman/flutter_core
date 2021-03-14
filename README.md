# flutter_core
Projelerinizde kullanabileceğiniz çekirdek katman.
#
### Kullanılan kütüphaneler:
- sqflite
- firebase_core
- firebase_database
#
"Core" klasörünü projenizin ana dizinine kopyalayarak kullanabilirsiniz. Projenizde kullanılmayacak klasörleri silebilirsiniz.

NOT: Gerekli kütüphaneler yüklü değilse hata alabilirsiniz.
#
### Decorator ( decorators):
Bir fonksiyon işleve başlamadan önce, işlevi bittiğinde veya işlev sırasında bir hata aldığında başka bir işlev çalıştırmasını istiyorsanız kullanabilirsiniz.

Örnek olarak, işlevden önce bir doğrulama yaptırabilirsiniz, işlevden sonra bir log kaydı yaptırabilirsiniz, hata aldığında işlevden başka bir veri dönüşü yaptırabilirsiniz.
#
### Result (results):
Bir fonsiyonun belli bir kalıpta sonuç dönmesini istiyorsanız kullanabilirsiniz. 

Örnek olarak, "success, message" döndürebilirsiniz veya "success, message, data" döndürebilirsiniz.
#
### Veri Yönetimi ( data_access ):
Verilerinizi local bir veritabanında yönetmek istiyorsanız bu paketi kullanabilirsiniz.
#
### Datetime İşlemleri ( datetime_operations ):
Geçerli tarihi (gmt ayarlanabilir) timestamp olarak kullanabilirsiniz. Ayrıca istenildiği zaman datetime ve timestamp arası dönüşümler yapabilirsiniz.
#
### Json Dosya İşlemleri ( json_file_operations ):
Json türünde olan verilerinizi bir dosyada tutmak isterseniz kullanabilirsiniz.
#



