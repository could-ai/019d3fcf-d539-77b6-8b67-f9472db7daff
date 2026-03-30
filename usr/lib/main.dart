import 'package:flutter/material.dart';

void main() {
  runApp(const HuepfburgApp());
}

class HuepfburgApp extends StatelessWidget {
  const HuepfburgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hüpfburg Rheintal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF7043), // Lebendiges Orange für Spaß & Action
          primary: const Color(0xFFFF7043),
          secondary: const Color(0xFF0288D1), // Vertrauensvolles Blau
          surface: Colors.grey[50],
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          displayMedium: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          titleLarge: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
      },
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black12,
        title: Row(
          children: [
            const Icon(Icons.castle, color: Color(0xFFFF7043), size: 32),
            const SizedBox(width: 12),
            Text(
              'Hüpfburg Rheintal',
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: isDesktop
            ? [
                TextButton(onPressed: () {}, child: const Text('Modelle')),
                TextButton(onPressed: () {}, child: const Text('Preise')),
                TextButton(onPressed: () {}, child: const Text('Über uns')),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF7043),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Jetzt anfragen'),
                  ),
                ),
              ]
            : [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black87),
                  onPressed: () {},
                ),
              ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context, isDesktop),
            _buildBenefitsSection(context, isDesktop),
            _buildPopularModelsSection(context, isDesktop),
            _buildTestimonialSection(context),
            _buildFooter(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // WhatsApp Integration
        },
        backgroundColor: const Color(0xFF25D366), // WhatsApp Green
        foregroundColor: Colors.white,
        icon: const Icon(Icons.chat),
        label: const Text('WhatsApp Chat'),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isDesktop) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100.0 : 24.0,
        vertical: isDesktop ? 120.0 : 60.0,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0288D1), Color(0xFF29B6F6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: isDesktop ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            'Mach dein Event unvergesslich!',
            textAlign: isDesktop ? TextAlign.center : TextAlign.left,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: isDesktop ? 56 : 40,
                  height: 1.1,
                ),
          ),
          const SizedBox(height: 24),
          Text(
            'Hüpfburgen mieten im Rheintal & Ostschweiz.\nLieferung, Aufbau und zuverlässiger Service inklusive.',
            textAlign: isDesktop ? TextAlign.center : TextAlign.left,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.whiteFaded,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: isDesktop ? WrapAlignment.center : WrapAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF7043),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  elevation: 4,
                ),
                child: const Text('Modelle & Preise ansehen'),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Event planen'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitsSection(BuildContext context, bool isDesktop) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100.0 : 24.0,
        vertical: 80.0,
      ),
      color: Colors.white,
      child: Flex(
        direction: isDesktop ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBenefitItem(
            icon: Icons.local_shipping,
            title: 'Rundum-Sorglos',
            description: 'Wir liefern, bauen auf und holen die Hüpfburg wieder ab.',
          ),
          if (!isDesktop) const SizedBox(height: 40),
          _buildBenefitItem(
            icon: Icons.verified_user,
            title: 'Geprüfte Sicherheit',
            description: 'Alle unsere Modelle sind zertifiziert und top gepflegt.',
          ),
          if (!isDesktop) const SizedBox(height: 40),
          _buildBenefitItem(
            icon: Icons.sentiment_very_satisfied,
            title: '100% Partyspaß',
            description: 'Strahlende Kinderaugen auf deinem nächsten Event garantiert.',
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitItem({required IconData icon, required String title, required String description}) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFE1F5FE),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 48, color: const Color(0xFF0288D1)),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.grey[600], height: 1.5),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPopularModelsSection(BuildContext context, bool isDesktop) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100.0 : 24.0,
        vertical: 80.0,
      ),
      color: Colors.grey[50],
      child: Column(
        children: [
          Text(
            'Unsere beliebtesten Modelle',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 36),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Finde die perfekte Hüpfburg für deinen Anlass',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              _buildProductCard('Ritterburg', 'Ideal für kleine Ritter und Prinzessinnen. Mit Rutsche.', 'CHF 180.-'),
              _buildProductCard('Dschungel Abenteuer', 'Große Springfläche mit coolen 3D Tieren.', 'CHF 220.-'),
              _buildProductCard('Einhorn Paradies', 'Der Traum für jeden Kindergeburtstag.', 'CHF 190.-'),
            ],
          ),
          const SizedBox(height: 48),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            child: const Text('Alle Modelle ansehen'),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(String title, String description, String price) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Color(0xFFE0F7FA),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: const Center(
              child: Icon(Icons.castle, size: 80, color: Color(0xFF00BCD4)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(color: Colors.grey[600], height: 1.5),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF7043),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0288D1),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Details'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 24.0),
      color: const Color(0xFF0288D1),
      child: Column(
        children: [
          const Icon(Icons.format_quote, size: 64, color: Colors.white54),
          const SizedBox(height: 24),
          const Text(
            '"Super Service! Die Hüpfburg wurde pünktlich geliefert und aufgebaut.\nDie Kinder hatten einen Riesenspaß. Gerne wieder!"',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.italic,
              color: Colors.white,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) => const Icon(Icons.star, color: Colors.amber)),
          ),
          const SizedBox(height: 12),
          const Text(
            'Familie Müller aus Altstätten',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.grey[900],
      child: const Column(
        children: [
          Text(
            'Hüpfburg Rheintal',
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Dein Partner für Eventattraktionen im Rheintal & Ostschweiz',
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 32),
          Text(
            '© 2024 Hüpfburg Rheintal. Alle Rechte vorbehalten.',
            style: TextStyle(color: Colors.white54, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
