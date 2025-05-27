import 'package:flutter/material.dart';

void main() {
  runApp(FavMoviesApp());
}

class FavMoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2C0A0A), Color(0xFF8B0C0C)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Logo
                Icon(Icons.movie_creation_outlined, color: Colors.white, size: 60),
                const SizedBox(height: 10),
                // Título
                Text(
                  'FavMovies',
                  style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                // Eslogan
                Text(
                  'Dale play a tu voz interior',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 10),
                // Estrellas
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Icon(
                      Icons.star,
                      color: index < 3 ? Colors.brown[300] : Colors.white,
                      size: 25,
                    );
                  }),
                ),
                const SizedBox(height: 30),
                // Usuario
                TextField(
                  controller: _userController,
                  decoration: InputDecoration(
                    hintText: 'Usuario',
                    filled: true,
                    fillColor: Colors.white24,
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 15),
                // Contraseña
                TextField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    filled: true,
                    fillColor: Colors.white24,
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                // Botón iniciar sesión
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 45),
                    backgroundColor: Colors.red[900],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    // Lógica de login aquí
                    print('Usuario: ${_userController.text}');
                    print('Contraseña: ${_passController.text}');
                  },
                  child: Text('Iniciar sesión'),
                ),
                const SizedBox(height: 10),
                // Botón Google (sin funcionalidad aún)
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/google_logo.png', // Debes agregar esta imagen en tu carpeta assets
                    height: 20,
                  ),
                  label: Text(
                    'Iniciar con Google',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 45),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(height: 20),
                // Enlaces
                TextButton(
                  onPressed: () {},
                  child: Text('Registrarse', style: TextStyle(color: Colors.white)),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('¿Olvidaste tu contraseña?', style: TextStyle(color: Colors.white70)),
                ),
                const SizedBox(height: 20),
                // Footer
                Text(
                  'By. UniversidadEan',
                  style: TextStyle(color: Colors.white60, fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
