# MyPortfolio Mobile

Aplikasi mobile lintas platform (*cross-platform*) berbasis **Flutter** untuk ekosistem portofolio pribadi. Proyek ini dibangun sebagai klien *frontend* mobile yang terpisah dari repositori aplikasi web Django sebelumnya, dan akan dikembangkan secara bertahap setiap minggunya.

* **Nama:** Karen Lim
* **NPM:** 2506623982
* **Kelas:** PBP C

---

## Prasyarat & Setup Umum

Pastikan perangkat lokal kamu sudah terpasang komponen berikut sebelum menjalankan proyek:
* **Flutter SDK** (versi stabil terbaru) beserta **Dart SDK**
* **IDE** (Visual Studio Code dengan ekstensi Flutter & Dart, atau Android Studio)
* **Perangkat Target:** Android Emulator, iOS Simulator, perangkat fisik dengan *USB Debugging*, atau peramban web (Chrome)
* **Git** untuk manajemen versi

### Langkah Menjalankan Proyek Secara Lokal

1. **Clone repositori ini ke komputer lokal:**
   ```bash
   git clone https://github.com/clarenvc/myportofolio_mobile.git
   cd myportofolio_mobile
   ```

2. **Clone repositori ini ke komputer lokal:**
   ```bash
   flutter pub get
   ```

3. **Pastikan tidak ada masalah sintaks dan clone repositori ini ke komputer lokal:**
   ```bash
   flutter analyze
   ```
   (Pastikan terminal menampilkan pesan: "No issues found!").

4. **Jalankan aplikasi pada emulator atau perangkat yang terhubung:**
   ```bash
   flutter run
   ```

---

## Pertanyaan Reflektif

### Tugas 7

**1.** **Widget tree** yang digunakan Flutter adalah semacam diagram berbentuk pohon (*tree*) yang terstruktur dan merepresentasikan seluruh susunan elemen antarmuka pengguna (*User Interface*) di dalam aplikasi, di mana setiap node di dalam pohon tersebut merupakan sebuah **Widget** (mulai dari tata letak, teks, ikon, hingga pengaturan tema).

=> Dalam widget tree, hubungan **induk-anak (*parent-child*)** bekerja secara komposisional: widget induk (*parent*) membungkus satu widget anak (*child*) atau sekumpulan widget anak (*children*) untuk mengatur posisi, ukuran (*constraints*), gaya visual, maupun perilaku dari anak-anaknya. Sebagai contoh pada proyek ini, `Scaffold` bertindak sebagai induk yang membungkus `Padding`, lalu `Padding` membungkus `Column`, dan `Column` memiliki `children` berupa `Row` (berisi 3 `InfoCard`) serta `Center` (berisi `Text` dan `GridView.count`). Saat parent dirender ulang atau diberi batasan ukuran, perubahan dan *constraints* tersebut diteruskan ke bawah menuju widget anak-anaknya.

**2.** Seluruh widget yang digunakan antara lain:

* **Widget Kustom (*Custom Widgets*):**
  * **`MyApp` (`StatelessWidget`):** Widget akar (*root*) aplikasi yang membungkus `MaterialApp` serta mendefinisikan judul dan skema warna utama aplikasi.
  * **`MyHomePage` (`StatelessWidget`):** Widget halaman utama portofolio yang menyusun `AppBar`, baris kartu identitas (`InfoCard`), teks sambutan, dan kisi tombol menu (`ItemCard`).
  * **`InfoCard` (`StatelessWidget`):** Widget kartu informasi modular untuk menampilkan pasangan judul (`NPM`, `Name`, `Class`) dan nilai identitas pemilik portofolio secara seragam.
  * **`ItemCard` (`StatelessWidget`):** Widget kartu tombol interaktif yang menampilkan ikon, label menu, dan warna latar unik, serta memicu `SnackBar` saat ditekan.
* **Widget Struktur, Tema & Tata Letak (*Layout & Structural Widgets*):**
  * **`MaterialApp`:** Widget root berbasis Material Design yang mengatur konfigurasi tema global (`ThemeData`), navigasi, dan halaman awal (`home`).
  * **`Scaffold`:** Kerangka struktur visual dasar halaman Material Design yang menyediakan slot untuk `AppBar`, `body`, dan manajemen tampilan `SnackBar`.
  * **`AppBar`:** Bilah navigasi di bagian atas layar yang menampilkan judul aplikasi (`MyPortfolio`) dan warna latar utama.
  * **`Padding`:** Memberikan ruang jarak (*inset*) di sekeliling widget anaknya agar konten tidak menempel langsung ke tepi layar atau elemen lain.
  * **`Column`:** Menyusun daftar widget anak (`children`) secara vertikal dari atas ke bawah.
  * **`Row`:** Menyusun daftar widget anak (`children`) secara horizontal dari kiri ke kanan (digunakan untuk menyejajarkan tiga `InfoCard`).
  * **`Center`:** Memposisikan widget anaknya tepat di tengah ruang yang tersedia pada parent-nya.
  * **`SizedBox`:** Membuat kotak kosong berdimensi tetap (misalnya `height: 16.0` dan `height: 8.0`) untuk memberi jarak vertikal antar-widget.
  * **`Container`:** Widget pembungkus serbaguna untuk mengatur lebar responsif (`MediaQuery.of(context).size.width / 3.5` pada `InfoCard`) serta jarak internal (`padding`).
  * **`GridView.count`:** Menyusun daftar `ItemCard` ke dalam tata letak kisi (*grid*) berjumlah 3 kolom (`crossAxisCount: 3`) dengan spasi antar-kartu yang seragam.
* **Widget Visual, Konten & Interaksi (*Visual & Interactive Widgets*):**
  * **`Card`:** Menampilkan kontainer panel bergaya Material Design dengan sudut membulat dan bayangan (*elevation: 2.0*) pada `InfoCard`.
  * **`Material`:** Membentuk permukaan kanvas Material Design pada `ItemCard` yang memegang warna latar unik (`item.color`) dan sudut melengkung (`BorderRadius.circular(12)`), sekaligus menjadi media render bagi efek sentuhan `InkWell`.
  * **`InkWell`:** Membuat area widget anak (`ItemCard`) responsif terhadap interaksi sentuhan pengguna (`onTap`) dengan efek visual riak air (*ripple effect*).
  * **`Icon`:** Menampilkan ikon vektor bawaan Material (`Icons.folder`, `Icons.add_circle`, `Icons.logout`) di dalam `ItemCard`.
  * **`Text`:** Menampilkan rangkaian karakter string di layar (judul `AppBar`, isi `InfoCard`, pesan sambutan, nama tombol pada `ItemCard`, dan pesan `SnackBar`).
  * **`SnackBar`:** Menampilkan bilah notifikasi sementara di bagian bawah layar (dipanggil melalui `ScaffoldMessenger`) yang mengonfirmasi tombol mana yang baru saja ditekan pengguna.

**3.** Widget **`MaterialApp`** berfungsi sebagai pembungkus utama aplikasi Flutter yang memanfaatkan sistem desain **Material Design** dari Google. Widget ini menyediakan berbagai layanan fundamental tingkat aplikasi, seperti pengaturan tema global (`ThemeData` dan `ColorScheme`), sistem navigasi antar-halaman (*routing* dan `Navigator`), dukungan lokalisasi bahasa, arah pembacaan teks (`Directionality`), serta integrasi dengan `ScaffoldMessenger`.

=> Biasanya, `MaterialApp` digunakan sebagai **root widget** karena hampir seluruh widget Material di dalam aplikasi (seperti `Scaffold`, `AppBar`, `Card`, `InkWell`, dan `SnackBar`) membutuhkan informasi tema, arah teks, dan sistem navigasi yang diwariskan dari atas _widget tree_. Tanpa `MaterialApp` di posisi puncak, widget-widget turunan tersebut tidak akan memiliki konteks desain maupun navigasi yang valid sehingga akan memicu *runtime error*.

**4.** `StatelessWidget`** adalah widget yang bersifat statis dan tidak dapat diubah (*immutable*) setelah dibangun. Tampilannya hanya bergantung pada data konfigurasi yang diterima melalui konstruktor saat pertama kali dibuat; widget ini hanya akan dirender ulang jika widget induknya membangun ulang dengan parameter baru.

Sementara itu, `StatefulWidget`** adalah widget yang memiliki objek pendamping bernama **`State`**, yang menyimpan data dinamis yang dapat berubah selama aplikasi berjalan. Ketika data di dalam `State` diubah melalui fungsi `setState()`, Flutter akan menandai widget tersebut sebagai *dirty* dan menjalankan ulang metode `build()` untuk memperbarui tampilan di layar.

=> **`StatelessWidget`** sebaiknya dipilih ketika antarmuka hanya menampilkan informasi statis atau elemen UI yang tidak mengubah datanya sendiri secara internal (seperti `MyApp`, `MyHomePage`, `InfoCard`, dan `ItemCard` pada Tugas 7 ini). 

=> Sebaliknya, **`StatefulWidget`** dipilih ketika tampilan perlu merespons interaksi pengguna atau perubahan data secara real-time—misalnya saat mengelola input form, *counter*, animasi, status *loading*, atau daftar data yang diambil secara asinkron dari API.

**5.** **`BuildContext`** adalah objek penunjuk (*handle*) yang merepresentasikan lokasi spesifik sebuah widget di dalam struktur **widget tree**. Karena setiap widget memiliki `BuildContext`-nya masing-masing, objek ini sangat penting di Flutter sebagai mekanisme pencarian (*lookup*) untuk mengakses data atau konfigurasi yang diwariskan oleh widget leluhur (*ancestor widgets*) di atasnya tanpa harus mengoper parameter secara manual melewati setiap lapisan widget.

=> Di dalam metode **`build(BuildContext context)`**, parameter `context` digunakan untuk menelusuri widget tree ke atas guna mengambil layanan atau tema terdekat. Pada proyek ini, `context` digunakan pada beberapa bagian kunci:
* `Theme.of(context).colorScheme.primary` untuk mengambil warna utama dari `ThemeData` milik `MaterialApp` terdekat sebagai warna latar `AppBar`.
* `MediaQuery.of(context).size.width` pada `InfoCard` untuk mendapatkan ukuran lebar layar perangkat saat ini agar lebar kartu dapat dibagi secara proporsional (`/ 3.5`).
* `ScaffoldMessenger.of(context)` pada `ItemCard` untuk menemukan pengelola notifikasi milik `Scaffold` terdekat agar dapat memunculkan `SnackBar` saat kartu ditekan.

**6.** **Hot reload** adalah fitur unggulan Flutter yang menyuntikkan (*inject*) berkas kode sumber Dart yang baru saja diubah langsung ke dalam *Dart Virtual Machine (VM)* yang sedang berjalan. Setelah kode diperbarui, Flutter secara otomatis membangun ulang (*rebuild*) widget tree dalam hitungan kurang dari satu detik sambil **tetap mempertahankan state** aplikasi saat ini (misalnya posisi halaman atau data yang sedang diisi).

=> Bedanya dengan **hot restart** adalah, **hot reload** hanya memperbarui tampilan UI dan menjaga nilai variabel *state* tetap utuh, sementara itu **hot restart** mengompilasi ulang kode Dart dari awal dan me-reset seluruh *state* aplikasi kembali ke kondisi inisial (seperti saat aplikasi pertama kali dibuka), meskipun tetap lebih cepat daripada *full restart* karena tidak membangun ulang kode *native* Android/iOS.

=> Kita tidak bisa hanya mengandalkan *hot reload* dan harus melakukan **hot restart** atau **full restart** pada kondisi berikut:
* **Wajib Hot Restart:** Ketika mengubah inisialisasi *state* awal di dalam `initState()`, mengubah nilai variabel global atau `static`, mengubah struktur utama di fungsi `main()` atau konfigurasi akar `MyApp`, serta mengubah definisi tipe *enum* atau struktur kelas secara fundamental.
* **Wajib Full Restart (Stop & Run ulang):** Ketika menambahkan *package*/dependensi baru di `pubspec.yaml`, menambahkan aset baru (gambar/font), mengubah kode *native* platform (Kotlin/Java di Android atau Swift/Objective-C di iOS), atau mengubah izin aplikasi pada `AndroidManifest.xml` / `Info.plist`.

---

> **P.S.** Tugas 7 ini saya kerjakan dengan bantuan Gemini AI, sebagai rekan diskusi saya, asisten _debugging_, serta sebagai _buddy coding_.
>
> #### 1. **Strategi Prompting & Tools**
>
> - **Tools:** Gemini (berperan sebagai *code reviewer* dan _buddy coding_).
> - **Strategi Prompting:** Alih-alih menyalin instruksi tugas secara mentah untuk meminta kode jadi, saya menerapkan *Comparative & Architectural Prompting*. Saya menggunakan kode dasar hasil Tutorial 08 (`main.dart` dan `menu.dart`) sebagai acuan konteks, lalu membedah *trade-off* desain sebelum memodifikasi kode—mulai dari membandingkan pergeseran paradigma *server-rendered/AJAX web* (Django) ke *declarative widget tree* (Flutter), mengevaluasi cara paling bersih memisahkan data dari tampilan pada `ItemHomepage`, hingga merancang alur *granular commit* agar riwayat Git tetap terisolasi per perubahan.
>
> #### 2. **Bagian Spesifik yang Dibantu AI & Pengerjaan Manual**
>
> - **Bagian yang Dibantu AI (Review Arsitektur & Refactoring Modular):** Mendiskusikan perbandingan peran aplikasi *client* Flutter terhadap ekosistem *full-stack* Django sebelumnya, mengevaluasi kelemahan *hardcoding* warna di dalam widget `ItemCard`, serta merumuskan enkapsulasi atribut `Color` ke dalam kelas model `ItemHomepage` agar logika rendering tetap deklaratif dan bebas dari percabangan `if-else` atau `switch` yang berulang.
> - **Integrasi, Pengujian UI & Pengerjaan Manual:** Saya secara mandiri memperbarui data identitas profil (`NPM`, `Name`, `Class`) pada `MyHomePage`, menyesuaikan konfigurasi item menu portofolio, menguji respons sentuhan `InkWell` serta kemunculan `SnackBar` melalui localhost yang di-run di chrome.
> - **Tinjauan Kritis terhadap Keterbatasan AI:** Karena AI hanya membaca kode secara statis tanpa visibilitas visual terhadap ukuran layar emulator maupun *rendering* aktual di perangkat, AI cenderung tidak mendeteksi potensi *layout overflow* pada widget berdimensi proporsional (seperti pembagian lebar `MediaQuery.of(context).size.width / 3.5` pada `InfoCard` ketika teks nama lengkap cukup panjang, atau penyusunan `GridView.count` di dalam `Column`). Selain itu, saya memverifikasi tampilan secara manual pada localhost browserku untuk memastikan tidak ada *pixel overflow*.
>
> #### 3. **Cuplikan Chat Log AI**
>
> <details>
> <summary> Klik untuk melihat tinjauan diskusi bersama AI</summary>
>
> **Prompt 1 (Evaluasi Desain Modular Model-Widget & Pemilihan State):**
>
> > _"Pada kode hasil Tutorial 08, `ItemCard` masih mengambil warna seragam dari `Theme.of(context).colorScheme.secondary`. Jika setiap tombol aksi portofolio membutuhkan warna latar yang kontras satu sama lain, apa kekurangan arsitektural jika saya menaruh percabangan `if-else` atau `switch` berdasarkan `item.name` di dalam metode `build()` milik `ItemCard`, dibandingkan menyimpan properti `Color` langsung pada kelas model `ItemHomepage`? Selain itu, mengapa `MyHomePage` dan `ItemCard` tetap cukup menggunakan `StatelessWidget` meskipun memicu `SnackBar` saat ditekan?"_
>
> **Prompt 2 (Mekanisme `BuildContext` & Risiko Layout Tree):**
>
> > _"Saat `ItemCard` memanggil `ScaffoldMessenger.of(context).showSnackBar(...)`, bagaimana cara Flutter menelusuri `BuildContext` ke atas untuk menemukan `Scaffold` yang tepat tanpa memicu error? Lalu dari struktur `Column` yang membungkus `Row` (`InfoCard` dengan lebar `MediaQuery.of(context).size.width / 3.5`) dan `GridView.count(shrinkWrap: true)`, potensi masalah rendering atau overflow apa yang perlu saya uji secara manual pada layar berukuran kecil?"_
>
> </details>

---

### Tugas 8

**1.**  Perbedaan antara Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop() adalah: 
   - **`Navigator.push()`** berfungsi untuk menambahkan *route* baru ke  *top of stack* di atas halaman yang sedang tampil saat ini. Halaman lama tetap tersimpan di bawahnya sehingga pengguna dapat kembali ke halaman sebelumnya menggunakan tombol *Back* bawaan perangkat atau `Navigator.pop()`.
   - **`Navigator.pushReplacement()`** berfungsi untuk menggantikan *route* yang ada di *top of stack* dengan *route* baru dan menghapus halaman sebelumnya dari posisi tersebut, sehingga pengguna tidak bisa kembali ke halaman yang digantikan lewat tombol *Back*.
   - **`Navigator.pop()`** berfungsi untuk menghapus *route* yang ada di *top of stack* dan mengembalikan tampilan ke *route* yang berada tepat di bawahnya (digunakan misalnya untuk menutup `AlertDialog` atau kembali satu langkah).

=> Untuk membuka halaman formulir baru (`EducationFormPage`) dari kartu aksi (`ItemCard`), metode yang digunakan flutter adalah **`Navigator.push()`** agar halaman utama (`MyHomePage`) tetap tersimpan di tumpukan bawah dan pengguna bisa kembali memakai tombol *Back* bawaan perangkat.

=> Sementara itu, opsi **Home** di dalam `LeftDrawer` menggunakan **`Navigator.pushReplacement()`** menuju `MyHomePage()`. Karena perpindahan melalui *drawer* merepresentasikan perpindahan menu utama (bukan menumpuk halaman di stack), `pushReplacement()` langsung mengganti halaman formulir yang sedang aktif dengan halaman utama tanpa menumpuk riwayat layar secara berlebihan—dan sangat membantu menguji alur kembali saat aplikasi dijalankan di Chrome.

**2.** Susunan **`Scaffold`**, **`AppBar`**, dan **`Drawer`** bekerja sama membentuk kerangka arsitektur antarmuka yang seragam di setiap layar:

- **`Scaffold`** menyediakan struktur tata letak standar Material Design (slot `appBar`, `drawer`, `body`) di setiap halaman sehingga letak header, tombol menu garis tiga (*hamburger icon*), dan area konten utama selalu berada pada posisi yang konsisten.
- **`AppBar`** menjaga konsistensi bilah judul di bagian atas layar sekaligus secara otomatis menampilkan tombol pembuka *drawer* pada koordinat yang sama.
- **`Drawer`** (yang dienkapsulasi sebagai *reusable widget* `LeftDrawer` di `lib/widgets/left_drawer.dart`) memungkinkan halaman utama (`MyHomePage`), halaman form proyek (`ProjectFormPage`), maupun halaman form edukasi (`EducationFormPage`) berbagi komponen navigasi samping yang identik tanpa duplikasi kode.

=> **Contoh penggunaan warna tema di lebih dari satu halaman:** Properti `backgroundColor: Theme.of(context).colorScheme.primary` (yang mewarisi warna utama dari `seedColor: Colors.indigo` pada `ThemeData` di `main.dart`) digunakan secara konsisten pada `AppBar` di halaman utama (`MyHomePage`) sekaligus diterapkan pada `AppBar` dan tombol `ElevatedButton` ("Simpan") di halaman formulir baru (`EducationFormPage`).

**3.** Tata letak formulir disusun menggunakan **`Column`** dengan `crossAxisAlignment: CrossAxisAlignment.start` agar seluruh elemen input (`TextFormField`) dan tombol aksi tersusun vertikal secara alami dari atas ke bawah, mudah dipindai secara visual, dan memiliki perataan kiri yang rapi pada berbagai ukuran lebar layar.

=> **Peran widget pengatur jarak (`Padding` dan `SizedBox`):** `Padding` (seperti `EdgeInsets.symmetric(vertical: 8.0)` pada tiap input dan `EdgeInsets.all(16.0)` pada pembungkus luar) serta `SizedBox(height: 16.0)` memberikan ruang pemisah antar-kolom dan tombol *Simpan* agar tidak saling berhimpitan, sekaligus menyisakan ruang aman di bawah tiap kolom ketika pesan *error* validasi muncul.

=> **Peran widget penggulir (`SingleChildScrollView`):** Secara default, widget `Column` tidak dapat digulir (*non-scrollable*) dan akan memicu galat `RenderFlex overflow` apabila total tinggi elemennya melebihi ruang layar yang tersedia. Membungkus `Column` di dalam **`SingleChildScrollView`** memastikan pengguna tetap dapat menggulir halaman ke bawah untuk mengisi seluruh kolom dan menjangkau tombol *Simpan*, baik pada layar ponsel yang sempit maupun ketika tinggi layar terpotong oleh kemunculan papan ketik virtual (*on-screen keyboard*).

**4.** Saat tombol **Simpan** ditekan, ketiga komponen validasi formulir bekerja secara berurutan sebagai berikut:

- **`GlobalKey<FormState>` (`_formKey`):** Bertindak sebagai pengenal unik yang menyimpan referensi langsung ke objek `FormState` internal milik widget `Form`, sehingga logika tombol di luar `Form` dapat mengakses dan mengontrol seluruh state formulir.
- **`validator`:** Fungsi *callback* pada masing-masing `TextFormField` yang memeriksa nilai input terhadap aturan model (mengembalikan teks pesan kesalahan jika tidak valid, atau `null` jika valid).
- **`validate()` (`_formKey.currentState!.validate()`):** Metode yang dipanggil ketika tombol *Simpan* diklik untuk mengeksekusi seluruh fungsi `validator` di dalam `Form` secara bersamaan. Metode ini mengembalikan `true` hanya jika semua kolom lolos validasi (sehingga `AlertDialog` ringkasan boleh ditampilkan), atau `false` jika ada minimal satu kolom yang gagal sambil menampilkan pesan kesalahan merah pada kolom terkait.

=> **Contoh nilai yang ditolak & mengapa jenis input/papan ketik saja belum cukup:** Pada `EducationFormPage`, kolom *Tahun Mulai* sudah diberi `keyboardType: TextInputType.number`, namun validasi tetap menolak input berupa `"   "` (hanya spasi), `"25"` (kurang dari 4 digit), maupun kombinasi urutan tahun yang tidak logis seperti *Tahun Mulai* `"2026"` dengan *Tahun Selesai* `"2022"` (`parsedEnd < parsedStart`). Memilih `keyboardType` hanya mengatur tata letak tombol virtual yang disarankan pada layar sentuh, tetapi tidak mencegah pengguna menempelkan karakter huruf (*copy-paste*), mengetik lewat keyboard fisik di browser/Chrome, mengosongkan kolom, atau memasukkan angka yang melanggar aturan urutan logis data.

---

> **P.S.** Tugas 8 ini saya kerjakan dengan bantuan Gemini AI, sebagai rekan diskusi saya, asisten _debugging_, serta sebagai _buddy coding_.
>
> #### 1. **Strategi Prompting & Tools**
>
> - **Tools:** Gemini (berperan sebagai *code reviewer*, asisten *debugging*, dan _buddy coding_).
> - **Strategi Prompting:** Saya menerapkan *Incremental & Comparative Prompting* dengan mengacu pada struktur hasil Tutorial 09 (`screens/` dan `widgets/`) serta model `Education` dari proyek Django sebelumnya. Setiap tahap pengerjaan mulai dari pembuatan halaman form, integrasi *drawer*, penambahan kartu aksi, hingga perbaikan *layout* dipecah menjadi langkah kecil yang langsung diuji dan di*commit* secara bertahap. Ketika menemukan galat *rendering*, saya menyertakan pesan *stack trace* aktual untuk membedah akar masalah *constraints* tata letak di Flutter.
>
> #### 2. **Bagian Spesifik yang Dibantu AI & Pengerjaan Manual**
>
> - **Bagian yang Dibantu AI (Perancangan Validasi Form & Arsitektur Navigasi):** Mendiskusikan perbandingan perilaku `Navigator.push()` (pada kartu aksi) terhadap `Navigator.pushReplacement()` (pada *drawer*), merancang logika validasi lintas-kolom antara `Tahun Mulai` dan `Tahun Selesai` di `EducationFormPage`, serta menelusuri penyebab error `RenderFlex overflow` saat jumlah kartu pada `GridView` bertambah di *viewport* browser yang lebar namun pendek.
> - **Integrasi, Pengujian UI & Pengerjaan Manual:** Saya secara mandiri mengintegrasikan komponen *drawer* yang sama ke `EducationFormPage`, menyesuaikan daftar item dan ikon pada `MyHomePage` dan `ItemCard`, menguji berbagai skenario input tidak valid (string kosong/spasi, format tahun salah, serta urutan tahun terbalik) maupun input valid di Chrome, menjalankan `flutter analyze` hingga bebas isu (`No issues found!`), dan melakukan *commit* bertahap ke GitHub.
> - **Tinjauan Kritis terhadap Keterbatasan AI:** AI menyusun kode secara statis tanpa mengetahui dimensi *viewport* aktual tempat aplikasi dijalankan. Pada rancangan awal `menu.dart`, penambahan kartu keempat (`Tambah Edukasi`) membuat `GridView.count(crossAxisCount: 3)` membentuk baris kedua, yang memicu `RenderFlex overflowed by 275 pixels` ketika dijalankan pada jendela Chrome yang melebar secara horizontal. Saya harus mengidentifikasi temuan visual tersebut secara manual saat pengujian dan membungkus `body` pada `menu.dart` dengan `SingleChildScrollView` (serta mengatur `primary: false` pada `GridView`) agar halaman utama tetap dapat digulir tanpa *overflow*.
>
> #### 3. **Cuplikan Chat Log AI**
>
> <details>
> <summary> Klik untuk melihat tinjauan diskusi bersama AI</summary>
>
> **Prompt 1 (Perbandingan Perilaku Navigasi Stack & Reuse Komponen):**
>
> > _"Pada struktur hasil Tutorial 09, mengapa tombol aksi di halaman utama menggunakan `Navigator.push()` sementara opsi navigasi di `LeftDrawer` menggunakan `Navigator.pushReplacement()`? Selain itu, apakah lebih baik membuat widget kartu baru khusus untuk Edukasi atau tetap menggunakan kembali cetakan `ItemCard` di `project_card.dart` dengan percabangan rute?"_
>
> **Prompt 2 (Debugging Layout Overflow pada Viewport Browser):**
>
> > _"Setelah menambahkan kartu keempat (`Tambah Edukasi`) pada `GridView.count(crossAxisCount: 3)` di `menu.dart` dan menjalankannya dengan `flutter run -d chrome`, muncul exception `A RenderFlex overflowed by 275 pixels on the bottom` pada widget `Column`. Mengapa penambahan satu kartu ini memicu overflow vertikal di Chrome, dan bagaimana cara mengatasinya tanpa bentrok scroll antara `Column` dan `GridView`?"_
>
> </details>