import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReviewScreen extends StatefulWidget {
  final String movieTitle;

  const ReviewScreen({super.key, required this.movieTitle});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  double _rating = 0;
  final TextEditingController _reviewController = TextEditingController();
  String _selectedCategory = 'Sin categoría';

  final List<String> _categories = [
    'Favorita',
    'Para llorar',
    'Comedia',
    'Clásico',
    'Inspiradora',
    'Recomendada',
  ];

  Future<void> _saveReview() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Debes iniciar sesión para guardar la reseña.')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('reseñas').add({
        'pelicula': widget.movieTitle,
        'estrellas': _rating,
        'reseña': _reviewController.text,
        'categoría': _selectedCategory,
        'fecha': Timestamp.now(),
        'usuarioId': user.uid,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Reseña guardada correctamente.')),
      );

      _reviewController.clear();
      setState(() {
        _rating = 0;
        _selectedCategory = 'Sin categoría';
      });
    } catch (e) {
      print('Error al guardar la reseña: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar la reseña.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reseñar: ${widget.movieTitle}'),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Estrellas
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    Icons.star,
                    color: _rating > index ? Colors.amber : Colors.grey[400],
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1.0;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 10),
            // Reseña escrita
            TextField(
              controller: _reviewController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Escribe tu reseña aquí...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Categoría desplegable
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: _categories.map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat));
              }).toList(),
              onChanged: (val) {
                if (val != null) {
                  setState(() => _selectedCategory = val);
                }
              },
              decoration: InputDecoration(
                labelText: 'Categoría',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Botón guardar
            ElevatedButton(
              onPressed: _saveReview,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[900],
                minimumSize: Size(double.infinity, 45),
              ),
              child: Text('Guardar reseña'),
            ),
          ],
        ),
      ),
    );
  }
}