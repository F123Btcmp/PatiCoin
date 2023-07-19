# F-123
F-123
# Ürün ile ilgili Bilgiler
## Takım Elemanları
- Zeynep Nazlı Erşen: Product Owner
- Rümeysa Ordu: Scrum Master  (kod yazmadı)
- İbrahim Ethem Akbıyık: Team Member/Developer  
- Berat Berkay Abakay: Team Member/Developer (kod yazmadı)

## Ürün İsmi
--Pati Coin--
## Ürünün Açıklaması
PatiCoin, hayvanları beslerken fotoğraf çekip coin kazanabileceğiniz ve bu coinlerle mama satın alabileceğiniz bir uygulamadır. Aynı zamanda çektiğiniz fotoğrafları uygulama içinde paylaşarak diğer kullanıcılara örnek olabilir ve rozetler kazanabilirsiniz. PatiCoin, hayvanlara daha fazla yardım etmek isteyen ve hayvanlar hakkında yeni bilgiler öğrenmek isteyen kullanıcılar için bir platform sunar.

Uygulama içinde, hayvanlara daha fazla yardım etmek amacıyla çeşitli bölümler bulunur. Bu bölümlerde, kullanıcılar hayvanlar hakkında bilgilendirici içerikler, bakım ipuçları gibi kaynaklara erişebilirler. Ayrıca, kayıp hayvan ilanı verebilecekleri bir bölüm de bulunur. Bu sayede, kaybolan hayvanların sahipleriyle iletişim kurulabilir ve onların tekrar bulunmalarına yardımcı olunabilir.

PatiCoin, hayvan severler arasında bir topluluk oluşturmayı hedefler. Kullanıcılar, uygulama içinde birbirleriyle etkileşimde bulunabilir, fotoğraflarını paylaşabilir ve deneyimlerini paylaşabilirler. Bu şekilde, hayvanlara olan sevgi ve sorumluluk bilinci artırılırken, aynı zamanda kullanıcılar arasında bir dayanışma ve yardımlaşma duygusu oluşturulur.

PatiCoin, hayvanları beslerken fotoğraf çekip coin kazanma ve bu coinlerle mama satın alma özelliğiyle kullanıcılarına hem eğlenceli bir deneyim sunar hem de hayvanlara yardım etme fırsatı verir. Ayrıca, hayvanlar hakkında bilgi edinmek, kayıp hayvanlara yardım etmek ve hayvan severler arasında bir topluluk oluşturmak gibi ek özellikleriyle de kullanıcıların ihtiyaçlarını karşılamayı amaçlar.

## Hedef Kitle
- Hayvansever insanlar
- Evcil hayvan sayhipleri
- hayvan refahıyla ilgilenen bireyler
- 13 - 65 yaş ararsı kullanıcılar

## Product Backlog URL
[Flutter Team 123 Asana Backlog Board.](https://www.figma.com/file/KctUcPnt5oI4gVXcWZ6DuI/Untitled?type=whiteboard&node-id=0%3A1&t=DBEIuGtybizM1CS9-1)

# Sprint 1
- Sprint içinde tamamlanması tahmin edilen puan: 100 Puan
- Puan tamamlama mantığı: Toplamda proje boyunca tamamlanması gereken 340 puanlık backlog bulunmaktadır. 3 sprint'e bölündüğünde ilk sprint'in en azından 100 ile başlaması gerektiğine karar verildi.
- Daily Scrum:Günlük olarak takımca toplantılar yapıyoruz. Planlamaları ve deadlineları belirliyoruz.
-Sprint board update: Sprint board screenshotları:

![image](https://github.com/F123Btcmp/StreetAnimals/assets/92324388/94833c6e-bf38-41d5-80b0-429c576b1c86)

- Ürün Durumu: Ekran görüntüleri

<img src="https://github.com/F123Btcmp/StreetAnimals/assets/92324388/cf6bbbae-f2de-41cf-a5c4-2c4df09e7031" width=50% height=40%>



# Sprint 2

## Tasarım

Figma kullanarak uygulamamızın temasını ve renklerini belirleyip tasarımlarımızı oluşturduk. Yapılması gereken tüm sayfaları başlıklarına göre sınıflandırıp, tasarımlarımızın yapılabilitesini Discord kanalımız üzerinden tartıştık. Oluşturduğumuz figma tasarımları :
<img src="https://github.com/F123Btcmp/StreetAnimals/assets/79331212/b6e3f56d-920b-4d12-8c0e-f9857f79c347" width=80% height=50%>


## Kodlama

### Giriş ve Kayıt ol ekranı
Giriş ve kayıt olma sayfalarının tasarımı ve kodlama kısmı bitti. Aynı zamanda firebase ile entegrasyonu gerçekleştirildi. Uygulamamıza uygun bir isim düşündük ve PatiCoin ismininde karar kıldık. 


<img src="https://github.com/F123Btcmp/StreetAnimals/assets/92324388/561e0534-5b65-41c7-a28c-1745bcafd5e2" width=50% height=40%>  

<img src="https://github.com/F123Btcmp/StreetAnimals/assets/79331212/f71c03c8-e9f3-4680-8fb6-7362c71591b4" width=50% height=40%>

### Profil

Profil kısmı tamamlanıldı ve top barı özel bir çizim kodu ile oluşturuldu. Bu sayfada kullanıcalar kendi postlarını, hayvanları beslemeleri sayesinde kazandıkları rozetleri ve eğer kayıp hayvan ilanları var ise onları görüntüleyebilecekler.

<img src="https://github.com/F123Btcmp/StreetAnimals/assets/92324388/1182f9a9-39fd-4e21-a96b-ccd3043416cf" width=50% height=50%>

### Paylaşım yapma ekranı

Hayvanları beslerken çekilecek fotoğraflar galeriden yüklenemeyip, sadece anlık olarak çekilebilecek. Bu sayede sistemimiz tarafından onaylanan fotoğraflar -hayvan besleme fotoğrafları dışındakiler onaylanmayacaktır- ödüllendirilerek sadece uygulama içerisinde harcanabilecek PatiCoin isimli sanal paradan kazanılacaktır. Bu para sayesinde mağazamızdan hayvan mamaları satın alınılabilir. Çekeceğimiz fotoğraf için aşağıdaki ekran kullanılacaktır. Kod ve firebase entegrasyonu full bir şekilde çalışmaktadır.
<img src="https://github.com/F123Btcmp/StreetAnimals/assets/79331212/bd8c4a53-3754-4ace-b3aa-64d61ddcaa09" width=50% height=50%>
