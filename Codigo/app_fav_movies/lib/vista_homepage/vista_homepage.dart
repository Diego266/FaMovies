import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}


class HomeScreen extends StatelessWidget {
final List<Map<String, String>> movies = [
  {
    'title': 'Inception',
    'image': 'https://picsum.photos/150/220?random=1',
  },
  {
    'title': 'The Matrix',
    'image': 'https://picsum.photos/150/220?random=2',
  },
  {
    'title': 'Interstellar',
    'image': 'https://picsum.photos/150/220?random=3',
  },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B0A0A),
      appBar: AppBar(
        title: Text('Bienvenido a FavMovies'),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Películas disponibles',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Card(
                    color: Colors.white10,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          movie['image']!,
                          width: 50,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(movie['title']!, style: TextStyle(color: Colors.white)),
                      subtitle: Text('Haz clic para calificar o categorizar',
                          style: TextStyle(color: Colors.white60)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.star_border, color: Colors.amber),
                            onPressed: () {
                              // futura función de calificación
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.category, color: Colors.white),
                            onPressed: () {
                              // futura función de agregar categoría
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
