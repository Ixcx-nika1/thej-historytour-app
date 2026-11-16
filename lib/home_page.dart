import 'dart:math' as math;
import 'dart:ui' show ImageFilter, PointerDeviceKind;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';

/// ---------------------------------------------------------------------------
/// KONSTANTA
/// ---------------------------------------------------------------------------
const Color _kBgTop = Color(0xFFF8F2D9);
const Color _kBgBottom = Color(0xFFF3E8BF);
const Color _kInk = Color(0xFF111111);
const Color _kRed = Color(0xFFFF3B30); // merah ala iOS
const String _kCinzel = 'Cinzel';
const String _kSans = 'GoogleSans';
const String _kBgImage = 'assets/images/bg_history.jpg';
const String _kAvatarImage = 'assets/images/Avatar.jpg';
const double _kMaxWidth = 1400;

/// ---------------------------------------------------------------------------
/// DATA
/// ---------------------------------------------------------------------------
class HomePlace {
  final String name;
  final String image;
  final String description; // teks singkat di kartu rekomendasi
  final String detail; // teks panjang untuk halaman detail
  final String location;
  final String rating;

  const HomePlace({
    required this.name,
    required this.image,
    this.description = '',
    this.detail = '',
    this.location = '',
    this.rating = '4.9 (2.4k ulasan)',
  });
}

const HomePlace _gua = HomePlace(
  name: 'Gua Lascaux',
  image: 'assets/images/gua1.jpg',
  description:
      'Gua prasejarah dengan lukisan dinding hewan berusia belasan ribu tahun yang luar biasa.',
  location: 'Montignac, Prancis',
  detail:
      'Gua Lascaux terletak di dekat Montignac, Prancis barat daya, dan ditemukan secara kebetulan pada tahun 1940 oleh sekelompok remaja. '
      'Dindingnya dipenuhi ratusan lukisan dan ukiran hewan seperti kuda, rusa, bison, dan banteng purba yang diperkirakan berusia sekitar 17.000 tahun, karya manusia pada akhir Zaman Es.\n\n'
      'Gua asli ditutup untuk umum pada 1963 agar lukisannya tidak rusak oleh napas dan kelembapan pengunjung. Kini pengunjung dapat melihat replika detailnya di Lascaux IV.',
);

const HomePlace _ahu = HomePlace(
  name: 'Ahu Tongariki',
  image: 'assets/images/paskah1.jpg',
  description:
      'Barisan 15 patung batu raksasa peninggalan prasejarah yang megah menatap Samudra Pasifik.',
  location: 'Pulau Paskah, Chili',
  detail:
      'Ahu Tongariki adalah platform upacara terbesar di Pulau Paskah (Rapa Nui), Chili, yang menopang 15 patung moai. '
      'Patung-patung batu raksasa ini dipahat oleh masyarakat Rapa Nui berabad-abad lalu.\n\n'
      'Pada 1960 tsunami merobohkan dan menyebarkan patung-patung tersebut. Kawasan ini kemudian dipulihkan pada tahun 1990-an dan kini menjadi salah satu pemandangan paling ikonik di pulau itu.',
);

const HomePlace _tesla = HomePlace(
  name: 'Tesla Science Center',
  image: 'assets/images/tesla1.jpg',
  description:
      'Bekas laboratorium Nikola Tesla, tempat ia bereksperimen dengan energi nirkabel.',
  location: 'Shoreham, New York, AS',
  detail:
      'Tesla Science Center berada di bekas laboratorium Wardenclyffe milik Nikola Tesla di Shoreham, New York. '
      'Di sinilah Tesla pada awal 1900-an mencoba membangun menara untuk mengirim informasi dan energi tanpa kabel.\n\n'
      'Proyek itu kehabisan dana dan menaranya dibongkar pada 1917, tetapi bangunan laboratoriumnya bertahan dan kini dijadikan pusat sains dan museum.',
);

const HomePlace _auschwitz = HomePlace(
  name: 'Auschwitz Birkenau',
  image: 'assets/images/kamp1.jpg',
  location: 'Oswiecim, Polandia',
  detail:
      'Auschwitz-Birkenau adalah kompleks kamp konsentrasi dan pemusnahan yang dibangun Nazi Jerman di wilayah Polandia yang diduduki pada 1940. '
      'Lebih dari satu juta orang, sebagian besar Yahudi Eropa, dibunuh di sana sebelum kamp dibebaskan pada Januari 1945.\n\n'
      'Kini tempat ini menjadi museum dan situs Warisan Dunia UNESCO, serta pengingat agar tragedi Holocaust tidak terulang.',
);

const HomePlace _lalibela = HomePlace(
  name: 'Gereja Lalibela',
  image: 'assets/images/gereja1.jpg',
  location: 'Lalibela, Ethiopia',
  detail:
      'Gereja Lalibela adalah kumpulan gereja yang dipahat langsung ke dalam batuan di dataran tinggi Ethiopia, dibangun sekitar abad ke-12 hingga ke-13 pada masa Raja Lalibela. '
      'Salah satunya, Bete Giyorgis, berbentuk salib raksasa yang turun ke dalam tanah.\n\n'
      'Hingga kini tempat ini masih menjadi pusat ziarah umat Kristen Ortodoks Ethiopia dan termasuk Warisan Dunia UNESCO.',
);

const HomePlace _tiwa = HomePlace(
  name: 'Tiwanaku',
  image: 'assets/images/paskah6.jpg',
  location: 'Tiwanaku, Bolivia',
  detail:
      'Tiwanaku adalah situs arkeologi kuno dekat Danau Titicaca, Bolivia, pusat peradaban pra-Inca yang berkembang kira-kira antara tahun 500 dan 1000 Masehi. '
      'Situs ini terkenal dengan Gerbang Matahari dan bangunan batu raksasa yang disusun dengan presisi tinggi.\n\n'
      'Tiwanaku tercatat sebagai Warisan Dunia UNESCO.',
);

const HomePlace _madol = HomePlace(
  name: 'Nan Madol',
  image: 'assets/images/madol1.jpg',
  detail: 'Deskripsi tempat ini akan segera ditambahkan.',
);

const HomePlace _alan = HomePlace(
  name: 'Alan Turing Office',
  image: 'assets/images/alan1.jpg',
  detail: 'Deskripsi tempat ini akan segera ditambahkan.',
);

// Urutan: kiri, TENGAH (halaman awal), kanan -> sesuai desain (dot ke-2 aktif)
const List<HomePlace> _recommendations = [_gua, _ahu, _tesla];

const List<HomePlace> _topics = [
  _gua,
  _tesla,
  _auschwitz,
  _ahu,
  _lalibela,
  _tiwa,
  _madol,
  _alan,
];

/// ---------------------------------------------------------------------------
/// UKURAN RESPONSIVE
/// ---------------------------------------------------------------------------
class _Dim {
  final double width;
  const _Dim(this.width);

  bool get wide => width >= 800;
  bool get medium => width >= 560 && width < 800;

  double get pad => wide ? 40 : (medium ? 28 : 20);
  double get headerH => wide ? 88 : (medium ? 78 : 70);
  double get logo => wide ? 40 : 34;
  double get headerIcon => wide ? 30 : 26;
  double get avatar => wide ? 52 : 46;

  double get pillRight => wide ? 40 : (medium ? 28 : 24);
  double get pillIcon => wide ? 36 : 30;

  double get heroH => wide ? 420 : (medium ? 340 : 280);
  double get heroTitle => wide ? 46 : (medium ? 32 : 24);
  double get heroSub => wide ? 22 : (medium ? 17 : 15);

  double get sectionTitle => wide ? 30 : 24;

  double get recHeight => wide ? 250 : (medium ? 190 : 150); //tinggi kartu (juga foto)
  double get recImage => wide ? 240 : (medium ? 180 : 122); //lebar foto
  double get recFraction => wide ? 0.42 : (medium ? 0.62 : 0.88); //lebar kartu
  double get recTitle => wide ? 26 : 20;
  double get recDesc => wide ? 14 : 11;

  double get topicHeight => wide ? 230 : (medium ? 180 : 145);
  double get topicWidth => wide ? 210 : (medium ? 170 : 136);
  double get topicTitle => wide ? 18 : 14;
}

/// ---------------------------------------------------------------------------
/// HALAMAN UTAMA
/// ---------------------------------------------------------------------------
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scroll = ScrollController();
  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    _scroll.addListener(_onScroll);
  }

  void _onScroll() {
    final scrolled = _scroll.hasClients && _scroll.offset > 12;
    if (scrolled != _scrolled) {
      setState(() => _scrolled = scrolled);
    }
  }

  void _openDetail(HomePlace place) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => DetailPage(
          title: place.name,
          imagePath: place.image,
          description: place.detail.isNotEmpty
              ? place.detail
              : place.description,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scroll.removeListener(_onScroll);
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [_kBgTop, _kBgBottom],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, c) {
            final d = _Dim(c.maxWidth);
            final topInset = MediaQuery.paddingOf(context).top;
            final headerTotal = topInset + d.headerH;
            final extra = math.max(0.0, (c.maxWidth - _kMaxWidth) / 2);

            return ScrollConfiguration(
              behavior: const _DragScrollBehavior(),
              child: Stack(
                children: [
                  // ---------------- ISI HALAMAN (scroll) ----------------
                  SingleChildScrollView(
                    controller: _scroll,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: headerTotal),
                        _Hero(d: d),
                        _Centered(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: d.pad),
                            child: _SectionTitle('Our Recomendation:', d: d),
                          ),
                        ),
                        const SizedBox(height: 6),
                        _Centered(
                          child: _RecommendationCarousel(
                            d: d,
                            onTap: _openDetail,
                          ),
                        ),
                        SizedBox(height: d.wide ? 30 : 22),
                        _Centered(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: d.pad),
                            child: _SectionTitle('More Topic:', d: d),
                          ),
                        ),
                        const SizedBox(height: 10),
                        _Centered(
                          child: _TopicList(d: d, onTap: _openDetail),
                        ),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ),

                  // ---------------- NAVBAR GENRE (tetap, transparan) ------
                  Positioned(
                    top: headerTotal + 14,
                    right: d.pillRight + extra,
                    child: _GenrePill(d: d),
                  ),

                  // ---------------- NAVBAR HEADER (tetap) -----------------
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: _Header(
                      d: d,
                      topInset: topInset,
                      scrolled: _scrolled,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Agar list/carousel bisa di-drag memakai mouse di desktop & web.
class _DragScrollBehavior extends MaterialScrollBehavior {
  const _DragScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
      };
}

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

/// ---------------------------------------------------------------------------
/// SHADOW MELAYANG (hanya di LUAR bentuk, supaya widget transparan tetap bersih)
/// ---------------------------------------------------------------------------
class _FloatingShadow extends StatelessWidget {
  final BorderRadius radius;
  final Color color;
  final double blur;
  final Offset offset;
  final Widget child;

  const _FloatingShadow({
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

/// ---------------------------------------------------------------------------
/// HEADER (menempel di atas, jadi transparan saat di-scroll)
/// ---------------------------------------------------------------------------
class _Header extends StatelessWidget {
  final _Dim d;
  final double topInset;
  final bool scrolled;

  const _Header({
    required this.d,
    required this.topInset,
    required this.scrolled,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(top: topInset),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: scrolled ? 0.10 : 0.45),
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withValues(alpha: scrolled ? 0.35 : 0.0),
              ),
            ),
          ),
          child: SizedBox(
            height: d.headerH,
            child: _Centered(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: d.pad),
                child: Row(
                  children: [
                    Text(
                      'TheJ',
                      style: TextStyle(
                        fontFamily: _kCinzel,
                        fontWeight: FontWeight.w700,
                        fontSize: d.logo,
                        color: _kInk,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Icon(
                          CupertinoIcons.search,
                          size: d.headerIcon + 4,
                          color: _kInk,
                        ),
                      ),
                    ),
                    SizedBox(width: d.wide ? 18 : 10),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Icon(
                          CupertinoIcons.line_horizontal_3,
                          size: d.headerIcon + 8,
                          color: _kInk,
                        ),
                      ),
                    ),
                    SizedBox(width: d.wide ? 16 : 10),
                    _Avatar(size: d.avatar),
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

class _Avatar extends StatelessWidget {
  final double size;
  const _Avatar({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          _kAvatarImage,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => Container(
            color: const Color(0xFFD9B968),
            child: Icon(
              CupertinoIcons.person_fill,
              size: size * 0.6,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// NAVBAR GENRE (transparan + shadow pekat, ikut tetap saat scroll)
/// ---------------------------------------------------------------------------
class _GenrePill extends StatelessWidget {
  final _Dim d;
  const _GenrePill({required this.d});

  static const List<IconData> _icons = [
    CupertinoIcons.lab_flask, // sains
    CupertinoIcons.building_2_fill, // sejarah
    CupertinoIcons.device_laptop, // teknologi
    CupertinoIcons.paintbrush, // seni
  ];

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(40);

    return _FloatingShadow(
      radius: radius,
      color: Colors.black.withValues(alpha: 0.42),
      blur: 26,
      offset: const Offset(6, 12),
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: d.wide ? 22 : 16,
              horizontal: d.wide ? 18 : 12,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFBF7E8).withValues(alpha: 0.55), //warna pil genre
              borderRadius: radius,
              border: Border.all(color: Colors.white.withValues(alpha: 0.6)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < _icons.length; i++) ...[
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Icon(_icons[i], size: d.pillIcon, color: _kInk),
                    ),
                  ),
                  if (i != _icons.length - 1) SizedBox(height: d.wide ? 14 : 8),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// HERO (gambar latar + teks)
/// ---------------------------------------------------------------------------
class _Hero extends StatelessWidget {
  final _Dim d;
  const _Hero({required this.d});

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
      fontFamily: _kSans,
      fontSize: d.heroTitle,
      height: 1.3,
      color: _kInk,
      letterSpacing: 0.5,
      shadows: const [
        Shadow(color: Color(0x55000000), blurRadius: 6, offset: Offset(0, 2)),
      ],
    );

    return SizedBox(
      width: double.infinity,
      height: d.heroH,
      child: Stack(
        children: [
          // Gambar latar (tangan): ukuran & posisi mengikuti desain.
          Positioned.fill(child: _HeroBackground(d: d)),
          // Teks hero
          Positioned.fill(
            child: _Centered(
              child: Padding(
                padding: EdgeInsets.only(left: d.pad, right: d.pad + 90),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('TRAVEL', style: titleStyle),
                      Text('THROUGH TIME,', style: titleStyle),
                      const SizedBox(height: 4),
                      Text(
                        'one place at a time.',
                        style: TextStyle(
                          fontFamily: _kSans,
                          fontSize: d.heroSub,
                          color: _kInk,
                          letterSpacing: 0.4,
                          shadows: const [
                            Shadow(
                              color: Color(0x44000000),
                              blurRadius: 5,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Gambar latar hero. Ukuran asli PNG 494x342; tangan berada di area
/// x 27-474 dan y 104-272, jadi gambar diskalakan dan digeser agar bagian
/// tangan tepat di tengah blok hero dan selebar layar (seperti desain).
class _HeroBackground extends StatelessWidget {
  final _Dim d;
  const _HeroBackground({required this.d});

  static const double _srcW = 494;
  static const double _srcH = 342;
  static const double _handsCx = 250.5;
  static const double _handsCy = 188.0;
  static const double _handsW = 448;
  static const double _handsH = 169;

  @override
  Widget build(BuildContext context) {
    final scale = math.min(
      d.width * 1.04 / _handsW,
      d.heroH * 0.85 / _handsH,
    );
    final dispW = _srcW * scale;
    final dispH = _srcH * scale;
    final dx = (_srcW / 2 - _handsCx) * scale;
    final dy = (_srcH / 2 - _handsCy) * scale;

    return ClipRect(
      child: OverflowBox(
        minWidth: dispW,
        maxWidth: dispW,
        minHeight: dispH,
        maxHeight: dispH,
        child: Transform.translate(
          offset: Offset(dx, dy),
          child: Image.asset(
            _kBgImage,
            width: dispW,
            height: dispH,
            fit: BoxFit.fill,
            errorBuilder: (_, _, _) => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  final _Dim d;
  const _SectionTitle(this.text, {required this.d});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _kCinzel,
        fontWeight: FontWeight.w700,
        fontSize: d.sectionTitle,
        color: _kInk,
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// CAROUSEL REKOMENDASI (kartu tengah lebih besar)
/// ---------------------------------------------------------------------------
class _RecommendationCarousel extends StatefulWidget {
  final _Dim d;
  final ValueChanged<HomePlace>? onTap;
  const _RecommendationCarousel({required this.d, this.onTap});

  @override
  State<_RecommendationCarousel> createState() =>
      _RecommendationCarouselState();
}

class _RecommendationCarouselState extends State<_RecommendationCarousel> {
  late PageController _controller;
  int _page = 1; // kartu tengah (sesuai desain)

  PageController _create() => PageController(
        viewportFraction: widget.d.recFraction,
        initialPage: _page,
      );

  @override
  void initState() {
    super.initState();
    _controller = _create();
  }

  @override
  void didUpdateWidget(covariant _RecommendationCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.d.recFraction != widget.d.recFraction) {
      _controller.dispose();
      _controller = _create();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _currentPage() {
    if (_controller.hasClients && _controller.position.haveDimensions) {
      return _controller.page ?? _page.toDouble();
    }
    return _page.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.d;

    return Column(
      children: [
        SizedBox(
          height: d.recHeight + 70, // ruang untuk shadow melayang
          child: PageView.builder(
            controller: _controller,
            itemCount: _recommendations.length,
            onPageChanged: (i) => setState(() => _page = i),
            itemBuilder: (context, i) {
              final card = Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: _RecommendationCard(
                  place: _recommendations[i],
                  d: d,
                  onTap: widget.onTap,
                ),
              );

              return AnimatedBuilder(
                animation: _controller,
                child: card,
                builder: (context, child) {
                  final delta = (_currentPage() - i).abs().clamp(0.0, 1.0);
                  final scale = 1.0 - (delta * 0.13);
                  return Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      height: d.recHeight,
                      child: Transform.scale(
                        scale: scale,
                        alignment: Alignment.center,
                        child: child,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_recommendations.length, (i) {
            final active = i == _page;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: active ? _kInk : const Color(0xFFA9A28F),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _RecommendationCard extends StatefulWidget {
  final HomePlace place;
  final _Dim d;
  final ValueChanged<HomePlace>? onTap;
  const _RecommendationCard({required this.place, required this.d, this.onTap});

  @override
  State<_RecommendationCard> createState() => _RecommendationCardState();
}

class _RecommendationCardState extends State<_RecommendationCard> {
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    final d = widget.d;
    final p = widget.place;
    final radius = BorderRadius.circular(20);
    final heartBox = d.wide ? 38.0 : 32.0;

    return GestureDetector(
      onTap: () => widget.onTap?.call(p),
      child: _FloatingShadow(
        radius: radius,
        color: Colors.black.withValues(alpha: 0.36),
        blur: 30,
        offset: const Offset(0, 16),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 202, 27, 27).withValues(alpha: 0.58), //warna container
            borderRadius: radius,
            border: Border.all(color: Colors.white.withValues(alpha: 0.75)), //warna border
          ),
          child: Row(
            children: [
              SizedBox(
                width: d.recImage,
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      _AssetImg(p.image),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Color(0x88000000)],
                            stops: [0.55, 1],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 8,
                        right: 8,
                        bottom: 7,
                        child: _RatingRow(
                          text: p.rating,
                          fontSize: d.wide ? 12 : 9.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            p.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: _kCinzel,
                              fontWeight: FontWeight.w700,
                              fontSize: d.recTitle,
                              color: _kInk,
                              height: 1.15,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        // Ikon love putih (isi & tepi), dengan lingkaran gelap
                        // tipis di belakangnya supaya tetap terlihat jelas.
                        GestureDetector(
                          onTap: () => setState(() => _liked = !_liked),
                          child: Container(
                            width: heartBox,
                            height: heartBox,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withValues(alpha: 0.32),
                            ),
                            child: Icon(
                              CupertinoIcons.heart_fill,
                              size: heartBox * 0.58,
                              color: _liked ? _kRed : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Flexible(
                      child: Text(
                        p.description,
                        maxLines: d.wide ? 5 : 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: _kSans,
                          fontSize: d.recDesc,
                          height: 1.35,
                          color: _kInk,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.location_solid,
                          size: d.wide ? 18 : 14,
                          color: _kInk,
                        ),
                        const SizedBox(width: 3),
                        Expanded(
                          child: Text(
                            p.location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: _kSans,
                              fontSize: d.wide ? 12 : 9,
                              color: _kInk,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
/// MORE TOPIC (panah kiri & kanan)
/// ---------------------------------------------------------------------------
class _TopicList extends StatefulWidget {
  final _Dim d;
  final ValueChanged<HomePlace>? onTap;
  const _TopicList({required this.d, this.onTap});

  @override
  State<_TopicList> createState() => _TopicListState();
}

class _TopicListState extends State<_TopicList> {
  final ScrollController _scroll = ScrollController();

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _scrollBy(double delta) {
    if (!_scroll.hasClients) return;
    final target = (_scroll.offset + delta)
        .clamp(0.0, _scroll.position.maxScrollExtent)
        .toDouble();
    _scroll.animateTo(
      target,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final d = widget.d;
    final step = (d.topicWidth + 16) * 2;
    final arrowTop = (d.topicHeight - 50) / 2 + 6;

    return SizedBox(
      height: d.topicHeight + 54, // ruang shadow melayang
      child: Stack(
        children: [
          ListView.separated(
            controller: _scroll,
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            padding: EdgeInsets.only(
              left: d.pad,
              right: d.pad + 20,
              top: 6,
              bottom: 40,
            ),
            itemCount: _topics.length,
            separatorBuilder: (_, _) => const SizedBox(width: 16),
            itemBuilder: (_, i) => _TopicCard(
              place: _topics[i],
              d: d,
              onTap: widget.onTap,
            ),
          ),
          Positioned(
            left: 6,
            top: arrowTop,
            child: _ArrowButton(
              icon: CupertinoIcons.chevron_left,
              onTap: () => _scrollBy(-step),
            ),
          ),
          Positioned(
            right: 6,
            top: arrowTop,
            child: _ArrowButton(
              icon: CupertinoIcons.chevron_right,
              onTap: () => _scrollBy(step),
            ),
          ),
        ],
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _ArrowButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withValues(alpha: 0.6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(icon, size: 24, color: _kInk),
      ),
    );
  }
}

class _TopicCard extends StatefulWidget {
  final HomePlace place;
  final _Dim d;
  final ValueChanged<HomePlace>? onTap;
  const _TopicCard({required this.place, required this.d, this.onTap});

  @override
  State<_TopicCard> createState() => _TopicCardState();
}

class _TopicCardState extends State<_TopicCard> {
  bool _liked = false;

  @override
  Widget build(BuildContext context) {
    final d = widget.d;
    final p = widget.place;

    return GestureDetector(
      onTap: () => widget.onTap?.call(p),
      child: Container(
        width: d.topicWidth,
        height: d.topicHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black.withValues(alpha: 0.35)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.45),
              blurRadius: 26,
              spreadRadius: 1,
              offset: const Offset(0, 16),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 8,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _AssetImg(p.image),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x55000000),
                      Colors.transparent,
                      Color(0x99000000),
                    ],
                    stops: [0, 0.4, 1],
                  ),
                ),
              ),
              Positioned(
                left: 8,
                top: 8,
                child: _RatingRow(text: p.rating, fontSize: d.wide ? 11 : 8.5),
              ),
              Positioned(
                right: 8,
                top: 6,
                child: GestureDetector(
                  onTap: () => setState(() => _liked = !_liked),
                  child: Icon(
                    CupertinoIcons.heart_fill,
                    size: d.wide ? 30 : 24,
                    color: _liked
                        ? _kRed
                        : Colors.white.withValues(alpha: 0.6),
                  ),
                ),
              ),
              Positioned(
                left: 14,
                right: 10,
                bottom: 14,
                child: Text(
                  p.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: _kSans,
                    fontWeight: FontWeight.w700,
                    fontSize: d.topicTitle,
                    height: 1.4,
                    color: Colors.white,
                  ),
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
/// KOMPONEN KECIL
/// ---------------------------------------------------------------------------
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

class _RatingRow extends StatelessWidget {
  final String text;
  final double fontSize;
  const _RatingRow({required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomPaint(
          size: Size(fontSize + 8, fontSize + 8),
          painter: const _FourPointStarPainter(),
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: _kSans,
              fontSize: fontSize,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

/// Bintang 4 sudut kuning (ikon rating pada desain).
class _FourPointStarPainter extends CustomPainter {
  const _FourPointStarPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final cx = w / 2;
    final cy = h / 2;
    final inner = w * 0.14;

    final path = Path()
      ..moveTo(cx, 0)
      ..quadraticBezierTo(cx + inner, cy - inner, w, cy)
      ..quadraticBezierTo(cx + inner, cy + inner, cx, h)
      ..quadraticBezierTo(cx - inner, cy + inner, 0, cy)
      ..quadraticBezierTo(cx - inner, cy - inner, cx, 0)
      ..close();

    canvas.drawShadow(path, const Color(0xFFFFE600), 3, true);
    canvas.drawPath(path, Paint()..color = const Color(0xFFFFE91F));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}