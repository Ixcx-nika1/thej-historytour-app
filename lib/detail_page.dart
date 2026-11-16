import 'dart:ui' show ImageFilter, PointerDeviceKind;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// KONSTANTA
/// ---------------------------------------------------------------------------
const Color _kBgTop = Color(0xFFF8F2D9);
const Color _kBgBottom = Color(0xFFF3E8BF);
const Color _kInk = Color(0xFF111111);
const Color _kRed = Color(0xFFFF3B30);
const String _kCinzel = 'Cinzel';
const String _kSans = 'GoogleSans';
const double _kMaxWidth = 1400; // sama seperti home_page
const double _kCollapseRange = 150; // jarak scroll sampai header mengecil penuh

/// ---------------------------------------------------------------------------
/// DATA TEMPAT
/// Dicari berdasarkan judul (title). Jika judul tidak ditemukan, halaman tetap
/// tampil memakai `description` sebagai bagian Introduction.
/// Jam buka, rating, dan ulasan selain Ahu Tongariki adalah DATA CONTOH.
/// ---------------------------------------------------------------------------
class _PlaceInfo {
  final String subtitle;
  final String location;
  final String hours;
  final String rating;
  final String reviews;
  final String intro;
  final String history;
  final String conclusion;

  const _PlaceInfo({
    this.subtitle = '',
    this.location = '',
    this.hours = '',
    this.rating = '4,9',
    this.reviews = '2,4 k',
    this.intro = '',
    this.history = '',
    this.conclusion = '',
  });
}

const Map<String, _PlaceInfo> _infos = {
  'Ahu Tongariki': _PlaceInfo(
    subtitle: 'Peradaban Kuno & Misteri Arkeologi',
    location: 'Pulau Paskah (Rapa Nui), Valparaiso, Chile.',
    hours: 'Buka setiap hari pukul 07.00 - 17.30',
    rating: '4,9',
    reviews: '6,7 k',
    intro:
        'Ahu Tongariki adalah platform upacara terbesar di Rapa Nui, menampilkan '
        '15 Moai raksasa yang berdiri megah membelakangi Samudra Pasifik. Ini '
        'adalah simbol kebanggaan dan kekuatan arsitektur prasejarah Polinesia.',
    history:
        'Dibangun antara abad ke-12 dan ke-15 oleh penduduk asli Rapa Nui. '
        'Patung-patung ini dipahat dari batu vulkanik Rano Raraku. Pada abad '
        'ke-19, terjadi konflik internal yang menyebabkan semua Moai di pulau '
        'ini dirobohkan. Pada tahun 1960, tsunami besar menyapu Ahu Tongariki '
        'dan menyeret patung-patungnya ke daratan. Restorasi besar-besaran '
        'dilakukan pada tahun 1990-an oleh tim arkeolog internasional untuk '
        'mendirikan kembali 15 Moai ini ke posisi aslinya.',
    conclusion:
        'Ahu Tongariki menjadi bukti ketangguhan fisik manusia masa lalu '
        'sekaligus pengingat tentang kerentanan ekosistem pulau kecil. Situs '
        'ini kini menjadi ikon pariwisata terpenting Chile dan warisan dunia '
        'yang terus dilindungi.',
  ),
  'Gua Lascaux': _PlaceInfo(
    subtitle: 'Galeri Seni Zaman Es',
    location: 'Montignac, Dordogne, Prancis.',
    hours: 'Buka setiap hari pukul 09.30 - 17.30',
    intro:
        'Gua Lascaux adalah gua prasejarah di Prancis barat daya yang '
        'dindingnya dipenuhi ratusan lukisan dan ukiran hewan. Karya-karya ini '
        'termasuk seni gua paling terkenal di dunia.',
    history:
        'Lukisannya diperkirakan dibuat sekitar 17.000 tahun lalu oleh manusia '
        'Zaman Es. Gua ini ditemukan secara kebetulan pada 1940 oleh sekelompok '
        'remaja. Setelah dibuka untuk umum, karbon dioksida dan kelembapan dari '
        'pengunjung mulai merusak lukisan, sehingga gua asli ditutup pada 1963.',
    conclusion:
        'Lascaux membuktikan bahwa manusia purba sudah memiliki rasa seni dan '
        'cara bercerita yang canggih. Kini replika Lascaux IV, yang dibuka '
        'tahun 2016, memungkinkan pengunjung menikmatinya tanpa merusak gua '
        'aslinya.',
  ),
  'Tesla Science Center': _PlaceInfo(
    subtitle: 'Laboratorium Sang Visioner',
    location: 'Shoreham, New York, Amerika Serikat.',
    hours: 'Buka Kamis - Minggu pukul 10.00 - 16.00',
    intro:
        'Tesla Science Center berdiri di lokasi laboratorium Wardenclyffe, '
        'tempat Nikola Tesla menjalankan eksperimen transmisi energi nirkabel. '
        'Situs ini kini menjadi museum dan pusat sains.',
    history:
        'Pada awal 1900-an, Tesla membangun menara Wardenclyffe dengan harapan '
        'dapat mengirim pesan dan listrik tanpa kabel ke seluruh dunia. '
        'Pendanaan menipis, dan menaranya dibongkar pada 1917. Bangunan '
        'laboratoriumnya bertahan dan, setelah penggalangan dana publik, '
        'diselamatkan untuk dijadikan museum.',
    conclusion:
        'Gagasan Tesla tentang energi dan komunikasi nirkabel terbukti jauh '
        'melampaui zamannya dan kini menjadi bagian dari teknologi sehari-hari. '
        'Tempat ini mengingatkan bahwa ide besar sering kali baru dihargai '
        'belakangan.',
  ),
  'Auschwitz Birkenau': _PlaceInfo(
    subtitle: 'Pengingat Tragedi Kemanusiaan',
    location: 'Oswiecim, Polandia.',
    hours: 'Buka setiap hari pukul 08.00 - 18.00',
    intro:
        'Auschwitz-Birkenau adalah bekas kamp konsentrasi dan pemusnahan Nazi '
        'Jerman, kini menjadi museum dan memorial. Tempat ini menjadi simbol '
        'Holocaust dan penderitaan jutaan korban.',
    history:
        'Kamp didirikan pada 1940 di wilayah Polandia yang diduduki Jerman, '
        'lalu diperluas dengan kompleks Birkenau. Lebih dari satu juta orang, '
        'sebagian besar Yahudi Eropa, dibunuh di sana. Pasukan Soviet '
        'membebaskan kamp pada 27 Januari 1945.',
    conclusion:
        'Situs ini ditetapkan sebagai Warisan Dunia UNESCO pada 1979 dan dijaga '
        'sebagai tempat belajar agar sejarah kelam ini tidak terulang. Kunjungan '
        'ke sini mengajak kita menghormati korban dan menolak kebencian.',
  ),
  'Gereja Lalibela': _PlaceInfo(
    subtitle: 'Gereja Batu di Dataran Tinggi Ethiopia',
    location: 'Lalibela, Wilayah Amhara, Ethiopia.',
    hours: 'Buka setiap hari pukul 06.00 - 18.00',
    intro:
        'Lalibela adalah kompleks gereja yang dipahat langsung dari batuan '
        'dan sering disebut sebagai Yerusalem baru di Ethiopia. Bete Giyorgis, '
        'gereja berbentuk salib, adalah yang paling terkenal.',
    history:
        'Gereja-gereja ini dibangun sekitar abad ke-12 hingga ke-13 pada masa '
        'Raja Lalibela dari Dinasti Zagwe. Dengan menggali ke bawah dari '
        'permukaan tanah, para pembangunnya membuat gereja yang atapnya '
        'sejajar dengan tanah.',
    conclusion:
        'Lalibela masuk daftar Warisan Dunia UNESCO pada 1978 dan hingga kini '
        'tetap menjadi pusat ziarah yang hidup bagi umat Kristen Ortodoks '
        'Ethiopia. Tempat ini menunjukkan perpaduan iman dan keahlian '
        'arsitektur yang luar biasa.',
  ),
  'Tiwanaku': _PlaceInfo(
    subtitle: 'Pusat Peradaban Pra-Inca',
    location: 'Tiwanaku, La Paz, Bolivia.',
    hours: 'Buka setiap hari pukul 09.00 - 17.00',
    intro:
        'Tiwanaku adalah situs arkeologi dekat Danau Titicaca yang dahulu '
        'menjadi pusat sebuah peradaban besar di Andes. Gerbang Matahari dan '
        'balok-balok batu raksasanya menjadi ciri khasnya.',
    history:
        'Peradaban Tiwanaku berkembang kira-kira antara tahun 500 dan 1000 '
        'Masehi, jauh sebelum kekaisaran Inca. Mereka membangun kota seremonial '
        'dengan batu yang disusun sangat presisi dan mengembangkan pertanian di '
        'dataran tinggi. Setelah itu peradaban ini perlahan meredup, diduga '
        'akibat perubahan iklim dan kekeringan.',
    conclusion:
        'Tiwanaku ditetapkan sebagai Warisan Dunia UNESCO pada tahun 2000 dan '
        'menjadi bukti kecanggihan masyarakat Andes sebelum Inca. Situs ini '
        'tetap dihormati sebagai tempat sakral oleh masyarakat setempat.',
  ),
};

/// ---------------------------------------------------------------------------
/// UKURAN RESPONSIVE
/// ---------------------------------------------------------------------------
double _lerp(double a, double b, double t) => a + (b - a) * t;

class _DetailDim {
  final double width;
  const _DetailDim(this.width);

  /// Layar lebar (desktop / tablet landscape) memakai tata letak 2 kolom.
  bool get wide => width >= 800;

  double get pad => wide ? 40 : 20;
  double get titleRow => wide ? 72 : 64;
  double get titleSize => wide ? 32 : 26;

  // --- HP & tablet kecil ---
  double get photoH => (width * 0.5).clamp(170.0, 300.0).toDouble();
  double get subH => 54;
  double get subSize => 17;
  double get infoH => 56;
  double get infoText => 10;

  // --- Desktop ---
  double get wideBodyH => 300;
  double get wideBodyMinH => 170;

  double get statText => wide ? 15 : 12.5;
  double get iconBig => wide ? 72 : 64;
  double get bodyText => wide ? 16.5 : 14.5;

  /// Tinggi area foto/isi header. e = 0 (di atas) sampai 1 (sudah digulir).
  double bodyHeight(double e) => wide
      ? _lerp(wideBodyH, wideBodyMinH, e)
      : _lerp(photoH, photoH * 0.55, e);

  double headerHeight(double top, double e) {
    if (wide) return top + titleRow + bodyHeight(e) + 34;
    return top + titleRow + bodyHeight(e) + 14 + subH + infoH + 14;
  }
}

class _SectionSpec {
  final IconData icon;
  final List<Color> colors;
  final String heading;
  final String text;

  const _SectionSpec({
    required this.icon,
    required this.colors,
    required this.heading,
    required this.text,
  });
}

/// ---------------------------------------------------------------------------
/// HALAMAN DETAIL
/// ---------------------------------------------------------------------------
class DetailPage extends StatefulWidget {
  final String title;
  final String imagePath;
  final String description;

  const DetailPage({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final ScrollController _scroll = ScrollController();
  late final PageController _pager;
  late final List<String> _images;
  late final _PlaceInfo _info;

  int _imgIndex = 0;
  bool _liked = false;
  bool _pressed = false;

  @override
  void initState() {
    super.initState();
    _images = _imagesFor(widget.imagePath);
    final found = _images.indexOf(widget.imagePath);
    _imgIndex = found < 0 ? 0 : found;
    _pager = PageController(initialPage: _imgIndex);
    _info = _infos[widget.title] ?? _PlaceInfo(intro: widget.description);
  }

  @override
  void dispose() {
    _scroll.dispose();
    _pager.dispose();
    super.dispose();
  }

  /// Menyesuaikan daftar file gambar sesuai dengan isi folder assets/images
  List<String> _imagesFor(String path) {
    final m = RegExp(r'^(.*?)(\d+)\.(jpg|jpeg|png)$').firstMatch(path);
    if (m == null) return [path];

    final prefix = m.group(1)!;
    final startNum = int.tryParse(m.group(2)!) ?? 1;
    final ext = m.group(3)!;

    // Jika memakai paskah6.jpg (cadangan Tiwanaku), gunakan paskah6..paskah7
    if (prefix.endsWith('paskah') && startNum >= 6) {
      return [
        '${prefix}6.$ext',
        '${prefix}7.$ext',
      ];
    }

    // Sesuaikan jumlah foto berdasarkan prefix file yang ada di folder assets/images
    int count = 5;
    if (prefix.endsWith('alan')) {
      count = 3; // alan1.jpg .. alan3.jpg
    } else if (prefix.endsWith('gereja')) {
      count = 4; // gereja1.jpg .. gereja4.jpg
    } else if (prefix.endsWith('madol')) {
      count = 3; // madol1.jpg .. madol3.jpg
    } else if (prefix.endsWith('paskah')) {
      count = 5; // paskah1.jpg .. paskah5.jpg (atau bisa sampai 7)
    }

    return List.generate(count, (i) => '$prefix${i + 1}.$ext');
  }

  void _startTrip() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.fromLTRB(
            16,
            0,
            16,
            MediaQuery.paddingOf(context).bottom + 90,
          ),
          backgroundColor: _kInk,
          duration: const Duration(seconds: 2),
          content: Text(
            'Perjalanan ke ${widget.title} dimulai. Selamat jalan!',
            style: const TextStyle(fontFamily: _kSans, color: Colors.white),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.trackpad,
            PointerDeviceKind.stylus,
          },
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [_kBgTop, _kBgBottom],
            ),
          ),
          child: LayoutBuilder(
            builder: (context, c) {
              final d = _DetailDim(c.maxWidth);
              final top = MediaQuery.paddingOf(context).top;
              final bottom = MediaQuery.paddingOf(context).bottom;
              final fullHeader = d.headerHeight(top, 0);
              final specs = _specs();

              return Stack(
                children: [
                  // ---------------- ISI (scroll) ---------------------------
                  SingleChildScrollView(
                    controller: _scroll,
                    child: Column(
                      children: [
                        SizedBox(height: fullHeader + 24),
                        _Centered(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: d.pad),
                            child: _buildSections(d, specs),
                          ),
                        ),
                        SizedBox(height: 140 + bottom),
                      ],
                    ),
                  ),

                  // ---------------- HEADER (tetap) -------------------------
                  // Di atas: tanpa latar sama sekali. Saat digulir: muncul
                  // latar kaca transparan (blur) yang menimpa isi di bawahnya.
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AnimatedBuilder(
                      animation: _scroll,
                      builder: (context, _) {
                        final offset = _scroll.hasClients ? _scroll.offset : 0.0;
                        final t = (offset / _kCollapseRange).clamp(0.0, 1.0);
                        return _buildHeader(d, top, t.toDouble());
                      },
                    ),
                  ),

                  // ---------------- TOMBOL TCHUSS (kanan bawah) ------------
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: bottom + 22,
                    child: Padding(
                      padding: EdgeInsets.only(right: d.pad),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [_buildTchuss()],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // -------------------------------------------------------------------------
  // SECTIONS
  // -------------------------------------------------------------------------
  List<_SectionSpec> _specs() {
    final list = <_SectionSpec>[];
    if (_info.intro.isNotEmpty) {
      list.add(
        _SectionSpec(
          icon: CupertinoIcons.lightbulb_fill,
          colors: const [Color(0xFFFFE08A), Color(0xFFF2A21B)],
          heading: 'Introduction',
          text: _info.intro,
        ),
      );
    }
    if (_info.history.isNotEmpty) {
      list.add(
        _SectionSpec(
          icon: CupertinoIcons.book_fill,
          colors: const [Color(0xFFF0BE8A), Color(0xFFB8641E)],
          heading: 'History',
          text: _info.history,
        ),
      );
    }
    if (_info.conclusion.isNotEmpty) {
      list.add(
        _SectionSpec(
          icon: CupertinoIcons.flag_fill,
          colors: const [Color(0xFF7BE3CC), Color(0xFF1E8F7B)],
          heading: 'Conclusion',
          text: _info.conclusion,
        ),
      );
    }
    return list;
  }

  Widget _buildSections(_DetailDim d, List<_SectionSpec> specs) {
    if (d.wide) {
      // Desktop: tiga kartu berdampingan, tinggi disamakan.
      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var i = 0; i < specs.length; i++) ...[
              if (i > 0) const SizedBox(width: 24),
              Expanded(child: _Section(index: i, spec: specs[i], d: d)),
            ],
          ],
        ),
      );
    }
    return Column(
      children: [
        for (var i = 0; i < specs.length; i++) ...[
          if (i > 0) const SizedBox(height: 22),
          _Section(index: i, spec: specs[i], d: d),
        ],
      ],
    );
  }

  // -------------------------------------------------------------------------
  // HEADER
  // -------------------------------------------------------------------------
  Widget _buildHeader(_DetailDim d, double top, double t) {
    final e = Curves.easeOut.transform(t);
    final bodyH = d.bodyHeight(e);
    final total = d.headerHeight(top, e);
    const radius = BorderRadius.vertical(bottom: Radius.circular(26));

    final List<Widget> rows = d.wide
        ? [
            SizedBox(height: top),
            SizedBox(height: d.titleRow, child: _buildTitleRow(d)),
            SizedBox(height: bodyH, child: _buildWideBody(d)),
            const SizedBox(height: 34),
          ]
        : [
            SizedBox(height: top),
            SizedBox(height: d.titleRow, child: _buildTitleRow(d)),
            SizedBox(height: bodyH, child: _buildCarousel(d)),
            const SizedBox(height: 14),
            SizedBox(height: d.subH, child: _buildSubtitle(d)),
            SizedBox(height: d.infoH, child: _buildInfoRow(d)),
            const SizedBox(height: 14),
          ];

    return _OuterShadow(
      radius: radius,
      color: Colors.black.withValues(alpha: 0.20 * e),
      blur: 22,
      offset: const Offset(0, 8),
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          // Blur dan latar mulai dari 0 (benar-benar bening) lalu menguat.
          filter: ImageFilter.blur(sigmaX: 0.01 + 16 * e, sigmaY: 0.01 + 16 * e),
          child: Container(
            height: total,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.30 * e),
              borderRadius: radius,
            ),
            child: Column(children: rows),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleRow(_DetailDim d) {
    final heartBox = d.wide ? 44.0 : 38.0;

    return _Centered(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: d.pad - 6),
        child: Row(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.of(context).maybePop(),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  CupertinoIcons.chevron_left,
                  size: d.wide ? 34 : 30,
                  color: _kInk,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.title,
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: _kCinzel,
                    fontWeight: FontWeight.w700,
                    fontSize: d.titleSize,
                    color: _kInk,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Ikon love putih (isi & tepi) di dalam lingkaran gelap tipis
            // supaya tetap terlihat di atas latar krem.
            GestureDetector(
              onTap: () => setState(() => _liked = !_liked),
              child: AnimatedScale(
                scale: _liked ? 1.12 : 1.0,
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOutBack,
                child: Container(
                  width: heartBox,
                  height: heartBox,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withValues(alpha: 0.32),
                  ),
                  child: Icon(
                    CupertinoIcons.heart_fill,
                    size: heartBox * 0.56,
                    color: _liked ? _kRed : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 6),
          ],
        ),
      ),
    );
  }

  /// Desktop: foto di kiri, informasi singkat di kanan.
  Widget _buildWideBody(_DetailDim d) {
    return _Centered(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: d.pad),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex: 6, child: _carouselCore(d)),
            const SizedBox(width: 36),
            Expanded(flex: 5, child: _buildWideInfo(d)),
          ],
        ),
      ),
    );
  }

  Widget _buildWideInfo(_DetailDim d) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_info.subtitle.isNotEmpty) ...[
            Text(
              _info.subtitle,
              maxLines: 1,
              style: const TextStyle(
                fontFamily: _kSans,
                fontSize: 24,
                height: 1.3,
                color: _kInk,
              ),
            ),
            const SizedBox(height: 16),
          ],
          if (_info.location.isNotEmpty) ...[
            _WideInfoLine(icon: CupertinoIcons.location_solid, text: _info.location),
            const SizedBox(height: 10),
          ],
          if (_info.hours.isNotEmpty) ...[
            _WideInfoLine(icon: CupertinoIcons.clock, text: _info.hours),
            const SizedBox(height: 16),
          ],
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _StatTile(
                icon: CupertinoIcons.star_fill,
                text: _info.rating,
                fontSize: d.statText,
              ),
              const SizedBox(width: 22),
              _StatTile(
                icon: CupertinoIcons.chat_bubble_fill,
                text: _info.reviews,
                fontSize: d.statText,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// HP: carousel selebar layar dengan margin.
  Widget _buildCarousel(_DetailDim d) {
    return _Centered(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: d.pad),
        child: _carouselCore(d),
      ),
    );
  }

  Widget _carouselCore(_DetailDim d) {
    final radius = BorderRadius.circular(d.wide ? 38 : 34);

    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.38),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              controller: _pager,
              itemCount: _images.length,
              onPageChanged: (i) => setState(() => _imgIndex = i),
              itemBuilder: (context, i) {
                // Efek parallax halus saat foto digeser.
                return AnimatedBuilder(
                  animation: _pager,
                  builder: (context, _) {
                    var page = _imgIndex.toDouble();
                    if (_pager.hasClients && _pager.position.haveDimensions) {
                      page = _pager.page ?? page;
                    }
                    final delta = (page - i).clamp(-1.0, 1.0).toDouble();
                    return ClipRect(
                      child: Transform.scale(
                        scale: 1.18,
                        child: Transform.translate(
                          offset: Offset(-delta * 36, 0),
                          child: _AssetImg(_images[i]),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            // Gradasi tipis di bawah agar titik indikator terlihat.
            const IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0x44000000)],
                    stops: [0.6, 1],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              top: 0,
              bottom: 0,
              child: Center(
                child: _ArrowBtn(
                  icon: CupertinoIcons.chevron_left,
                  enabled: _imgIndex > 0,
                  onTap: () => _pager.previousPage(
                    duration: const Duration(milliseconds: 380),
                    curve: Curves.easeOutCubic,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 8,
              top: 0,
              bottom: 0,
              child: Center(
                child: _ArrowBtn(
                  icon: CupertinoIcons.chevron_right,
                  enabled: _imgIndex < _images.length - 1,
                  onTap: () => _pager.nextPage(
                    duration: const Duration(milliseconds: 380),
                    curve: Curves.easeOutCubic,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_images.length, (i) {
                  final active = i == _imgIndex;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: active ? 16 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white.withValues(alpha: active ? 0.95 : 0.55),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubtitle(_DetailDim d) {
    return _Centered(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: d.pad),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            _info.subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: _kSans,
              fontSize: d.subSize,
              height: 1.3,
              color: _kInk,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(_DetailDim d) {
    return _Centered(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: d.pad),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_info.location.isNotEmpty)
              Expanded(
                flex: 11,
                child: _InfoItem(
                  icon: CupertinoIcons.location_solid,
                  text: _info.location,
                  fontSize: d.infoText,
                ),
              ),
            if (_info.hours.isNotEmpty)
              Expanded(
                flex: 9,
                child: _InfoItem(
                  icon: CupertinoIcons.clock,
                  text: _info.hours,
                  fontSize: d.infoText,
                ),
              ),
            if (_info.location.isEmpty && _info.hours.isEmpty) const Spacer(),
            const SizedBox(width: 6),
            _StatTile(
              icon: CupertinoIcons.star_fill,
              text: _info.rating,
              fontSize: d.statText,
            ),
            const SizedBox(width: 12),
            _StatTile(
              icon: CupertinoIcons.chat_bubble_fill,
              text: _info.reviews,
              fontSize: d.statText,
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------------------------------------------------------
  // TOMBOL TCHUSS
  // -------------------------------------------------------------------------
  Widget _buildTchuss() {
    const radius = BorderRadius.all(Radius.circular(40));

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: _startTrip,
      child: AnimatedScale(
        scale: _pressed ? 0.94 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: _OuterShadow(
          radius: radius,
          color: Colors.black.withValues(alpha: 0.32),
          blur: 22,
          offset: const Offset(0, 10),
          child: ClipRRect(
            borderRadius: radius,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.72), //warna button tchuss
                  borderRadius: radius,
                  border: Border.all(color: Colors.white.withValues(alpha: 0.9)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Tchuss!',
                      style: TextStyle(
                        fontFamily: _kSans,
                        fontSize: 20,
                        color: _kInk,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(CupertinoIcons.airplane, size: 26, color: _kInk),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _WideInfoLine extends StatelessWidget {
  final IconData icon;
  final String text;
  const _WideInfoLine({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 28, color: _kInk),
        const SizedBox(width: 10),
        Text(
          text,
          maxLines: 1,
          style: const TextStyle(
            fontFamily: _kSans,
            fontSize: 16,
            color: _kInk,
          ),
        ),
      ],
    );
  }
}

/// ---------------------------------------------------------------------------
/// SECTION (Introduction / History / Conclusion)
/// ---------------------------------------------------------------------------
class _Section extends StatelessWidget {
  final int index;
  final _SectionSpec spec;
  final _DetailDim d;

  const _Section({
    required this.index,
    required this.spec,
    required this.d,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(26);

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 500 + index * 160),
      curve: Curves.easeOutCubic,
      builder: (context, v, child) => Opacity(
        opacity: v,
        child: Transform.translate(
          offset: Offset(0, 26 * (1 - v)),
          child: child,
        ),
      ),
      child: _OuterShadow(
        radius: radius,
        color: Colors.black.withValues(alpha: 0.16),
        blur: 24,
        offset: const Offset(0, 10),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(d.wide ? 24 : 18),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.55), //warna conclusion, introduction, and history
            borderRadius: radius,
            border: Border.all(color: Colors.white.withValues(alpha: 0.7)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _Icon3D(
                    icon: spec.icon,
                    colors: spec.colors,
                    size: d.iconBig,
                    phase: (index * 0.33) % 1,
                  ),
                  SizedBox(width: d.wide ? 20 : 16),
                  Expanded(
                    child: Text(
                      spec.heading,
                      style: TextStyle(
                        fontFamily: _kSans,
                        fontWeight: FontWeight.w700,
                        fontSize: d.wide ? 22 : 20,
                        color: _kInk,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: d.wide ? 18 : 16),
              Text(
                spec.text,
                style: TextStyle(
                  fontFamily: _kSans,
                  fontSize: d.bodyText,
                  height: 1.65,
                  color: _kInk,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// IKON 3D: ubin gradien + kilap + bayangan, melayang dan sedikit berputar
/// ---------------------------------------------------------------------------
class _Icon3D extends StatefulWidget {
  final IconData icon;
  final List<Color> colors;
  final double size;
  final double phase;

  const _Icon3D({
    required this.icon,
    required this.colors,
    required this.size,
    this.phase = 0,
  });

  @override
  State<_Icon3D> createState() => _Icon3DState();
}

class _Icon3DState extends State<_Icon3D> with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3200),
      value: widget.phase,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.size;
    final r = s * 0.3;
    final glyph = s * 0.52;

    final body = SizedBox(
      width: s,
      height: s,
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(r),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: widget.colors,
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.colors.last.withValues(alpha: 0.55),
                    blurRadius: 18,
                    offset: const Offset(0, 10),
                  ),
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.7),
                    blurRadius: 4,
                    offset: const Offset(-2, -2),
                  ),
                ],
              ),
            ),
          ),
          // Kilap di bagian atas
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: s * 0.5,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(r)),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withValues(alpha: 0.55),
                      Colors.white.withValues(alpha: 0.02),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Glyph dengan bayangan timbul
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.translate(
                  offset: Offset(0, s * 0.045),
                  child: Icon(
                    widget.icon,
                    size: glyph,
                    color: Colors.black.withValues(alpha: 0.28),
                  ),
                ),
                Icon(widget.icon, size: glyph, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );

    return AnimatedBuilder(
      animation: _c,
      child: body,
      builder: (context, child) {
        final v = Curves.easeInOut.transform(_c.value);
        return Transform.translate(
          offset: Offset(0, -5 * v),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0014)
              ..rotateX(-0.10)
              ..rotateY((v - 0.5) * 0.4),
            child: child,
          ),
        );
      },
    );
  }
}

/// ---------------------------------------------------------------------------
/// KOMPONEN KECIL
/// ---------------------------------------------------------------------------
class _Centered extends StatelessWidget {
  final Widget child;
  const _Centered({required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _kMaxWidth),
        child: child,
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final double fontSize;
  const _InfoItem({
    required this.icon,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 28, color: _kInk),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: _kSans,
              fontSize: fontSize,
              height: 1.3,
              color: _kInk,
            ),
          ),
        ),
        const SizedBox(width: 6),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final double fontSize;
  const _StatTile({
    required this.icon,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 28, color: _kInk),
        const SizedBox(height: 2),
        Text(
          text,
          style: TextStyle(
            fontFamily: _kSans,
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
            color: _kInk,
          ),
        ),
      ],
    );
  }
}

class _ArrowBtn extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;
  const _ArrowBtn({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: enabled ? 1 : 0.35,
      duration: const Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: enabled ? onTap : null,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.18),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(icon, size: 20, color: _kInk),
        ),
      ),
    );
  }
}

class _AssetImg extends StatelessWidget {
  final String path;
  const _AssetImg(this.path);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => Container(
        color: const Color(0xFFCBB98A),
        child: const Icon(CupertinoIcons.photo, color: Colors.white70),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// BAYANGAN MELAYANG (hanya di luar bentuk, aman untuk widget transparan)
/// ---------------------------------------------------------------------------
class _OuterShadow extends StatelessWidget {
  final BorderRadius radius;
  final Color color;
  final double blur;
  final Offset offset;
  final Widget child;

  const _OuterShadow({
    required this.radius,
    required this.color,
    required this.blur,
    required this.offset,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _OuterShadowPainter(
        radius: radius,
        color: color,
        blur: blur,
        offset: offset,
      ),
      child: child,
    );
  }
}

class _OuterShadowPainter extends CustomPainter {
  final BorderRadius radius;
  final Color color;
  final double blur;
  final Offset offset;

  const _OuterShadowPainter({
    required this.radius,
    required this.color,
    required this.blur,
    required this.offset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rrect = radius.toRRect(Offset.zero & size);
    final bigRect = Rect.fromLTWH(
      -400,
      -400,
      size.width + 800,
      size.height + 800,
    );
    final outside = Path.combine(
      PathOperation.difference,
      Path()..addRect(bigRect),
      Path()..addRRect(rrect),
    );

    canvas.save();
    canvas.clipPath(outside);
    canvas.drawRRect(
      rrect.shift(offset),
      Paint()
        ..color = color
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, blur * 0.5),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _OuterShadowPainter old) =>
      old.radius != radius ||
      old.color != color ||
      old.blur != blur ||
      old.offset != offset;
}