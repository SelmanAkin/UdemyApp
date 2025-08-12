# Udemy Klon Eğitim Platformu

Bu proje, **Ruby on Rails 7** ile geliştirilmiş bir Udemy klonudur. Kullanıcıların kayıt olabildiği, kurs oluşturup video yükleyebildiği, kursları değerlendirebildiği bir eğitim platformu uygulamasıdır. Ayrıca yapay zeka destekli kullanıcı bilgilendirme sistemi içermektedir.



## Özellikler

- **Kullanıcı Kayıt ve Giriş:** Devise gemi ile güvenli kullanıcı kimlik doğrulama.
- **Yetkilendirme:** Pundit ile kullanıcı yetki .
- **Kurs Yönetimi:** Kurs oluşturma, düzenleme ve silme işlemleri.
- **Video Yükleme:** ActiveStorage ile kurslara video dosyası yükleme.
- **Değerlendirme:** Kullanıcılar kursları puanlayabilir ve yorum yapabilir.
- **Yapay Zeka Destekli Bilgilendirme:** HTTParty kullanarak dış AI API’leri ile etkileşim.



## Kullanılan Teknolojiler ve Gemler

- **Ruby on Rails 7:** Güçlü ve modern web framework.
- **Devise:** Kullanıcı kimlik doğrulama.
- **Pundit:** Rol tabanlı yetkilendirme.
- **ActiveStorage:** Dosya ve video yükleme yönetimi.
- **HTTParty:** AI servisleri ile HTTP istekleri yapmak için.

  
## Kullanım

- Kayıt olun veya mevcut kullanıcı ile giriş yapın.
- Kurs oluşturabilir, video yükleyebilir ve diğer kullanıcıların kurslarını inceleyebilirsiniz.
- Kursları değerlendirebilir, yorum yapabilirsiniz.
- Yapay zeka destekli bilgilendirme sistemi ile etkileşim kurabilirsiniz.



## Proje Yapısı

- **app/models:** Kullanıcı, Kurs, Video, Değerlendirme modelleri
- **app/controllers:** Kurs ve kullanıcı işlemleri için controllerlar
- **app/policies:** Pundit yetkilendirme politikaları
- **app/views:** Kullanıcı arayüzü sayfaları
- **app/jobs:** AI ile ilgili arka plan işleri (opsiyonel)
- **config/routes.rb:** Uygulama rotaları





