import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(const FreshTartsApp());

class FreshTartsApp extends StatelessWidget {
  const FreshTartsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Verdana'),
      home: const HistoryPage(),
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  // Paleta de colores Premium Coquette
  static const Color softPink = Color(0xFFFFD1DC);
  static const Color deepPink = Color(0xFFFFB7B2);
  static const Color backgroundCrema = Color(0xFFFFFDF5);
  static const Color accentMint = Color(0xFFB2E2F2);
  static const Color darkText = Color(0xFF6D5D6E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundCrema,
      drawer: _buildDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: softPink),
        title: const Text('Fresh Tarts', style: TextStyle(color: deepPink, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: softPink, size: 28),
            tooltip: 'Carrito de Compras',
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(color: softPink.withOpacity(0.3), height: 2),
        ),
      ),
      body: Stack(
        children: [
          _buildDecorativeBackground(),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                _buildTitleSection(),
                const SizedBox(height: 10),
                _buildSubtitleSection(),
                const SizedBox(height: 40),
                _buildMainStoryCard(),
                const SizedBox(height: 60),
                _buildFooter(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: deepPink,
        child: const Icon(Icons.favorite_border, color: Colors.white, size: 30),
        tooltip: 'Tus Favoritos',
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: backgroundCrema,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [softPink, deepPink]),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.cake, size: 60, color: Colors.white),
                    Text('Menú Mágico', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  ],
                ),
              ),
            ),
            _buildMenuItem(Icons.home_filled, "Inicio"),
            _buildMenuItem(Icons.cake, "Pasteles"),
            _buildMenuItem(Icons.auto_stories, "Nuestra Historia"),
          ],
        ),
      ),
    );
  }

  Widget _buildDecorativeBackground() {
    return Positioned.fill(
      child: Opacity(
        opacity: 0.05,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (context, index) => const Icon(Icons.pets, size: 40, color: softPink),
          itemCount: 100,
          physics: const NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget _buildMainStoryCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: Alignment.centerRight,
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 40),
            padding: const EdgeInsets.fromLTRB(25, 35, 75, 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(color: deepPink.withOpacity(0.3), blurRadius: 25, spreadRadius: 5, offset: const Offset(5, 10)),
                BoxShadow(color: accentMint.withOpacity(0.2), blurRadius: 30, spreadRadius: -10, offset: const Offset(-5, -5)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'En Fresh Tarts horneamos sueños con harina de nubes. Cada postre es una caricia al alma creada en nuestra madriguera mágica por manos expertas que aman el dulce.',
                  style: TextStyle(fontSize: 15, color: darkText, height: 1.6, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 20),
                const PulsatingButton(), // Botón con animación
              ],
            ),
          ),
          Positioned(
            right: -10,
            top: -20,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: softPink, width: 4),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
                image: const DecorationImage(
                  image: NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/068/337/955/small/cute-bunny-chef-looking-into-oven-checking-chocolate-chip-cookies-cozy-baking-scene-perfect-for-kitchen-art-children-books-holiday-illustrations-cooking-themes-and-sweet-dessert-designs-png.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Nuestra Historia', 
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: deepPink)),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: const Icon(Icons.auto_stories, size: 45, color: deepPink),
        ),
      ],
    );
  }

  Widget _buildSubtitleSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('Inicio', style: TextStyle(fontSize: 24, color: accentMint, fontWeight: FontWeight.bold)),
        Text(' ✨', style: TextStyle(fontSize: 20)),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: const BoxDecoration(
        color: softPink,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      ),
      child: Column(
        children: const [
          Text('✨ 2026 Fresh Tarts ✨', 
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2)),
          SizedBox(height: 5),
          Text('Hecho con magia y zanahorias 🥕', style: TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: softPink),
      title: Text(title, style: const TextStyle(color: darkText, fontWeight: FontWeight.bold)),
      onTap: () {},
    );
  }
}

// --- WIDGET PARA EL BOTÓN ANIMADO ---
class PulsatingButton extends StatefulWidget {
  const PulsatingButton({super.key});

  @override
  State<PulsatingButton> createState() => _PulsatingButtonState();
}

class _PulsatingButtonState extends State<PulsatingButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween(begin: 1.0, end: 1.05).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Text('🎀', style: TextStyle(fontSize: 18)),
        label: const Text('Leer más...', style: TextStyle(fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: HistoryPage.softPink,
          foregroundColor: Colors.white,
          elevation: 5,
          shadowColor: HistoryPage.softPink.withOpacity(0.8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}