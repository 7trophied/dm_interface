import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  // Parámetro para alternar entre la versión ADMIN (verde) y ALUMNO (azul)
  final bool isAdmin;

  const LoginScreen({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    // Definición de colores y textos según el tipo de usuario
    final Color primaryColor = isAdmin ? const Color(0xFF4CAF50) : const Color(0xFF2196F3);
    final String loginType = isAdmin ? 'ADMIN' : 'ALUMNO';
    final String label1 = isAdmin ? 'Num. Trabajador' : 'Num. Cuenta';
    
    // Un color más claro para los detalles en el fondo
    final Color accentShapeColor = isAdmin ? const Color(0xFF81C784) : const Color(0xFF64B5F6);
    final Color lightAccentColor = isAdmin ? const Color(0xFFE8F5E8) : const Color(0xFF87CEEB);
    
    // Usamos Scaffold con un color de fondo oscuro
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A), // Fondo más oscuro similar a la imagen
      body: Stack(
        children: [
          // ----------------------------------------------------
          // FONDO: ELEMENTOS DECORATIVOS (Círculos y Formas)
          // ----------------------------------------------------

          // Círculo grande en la esquina superior izquierda
          Positioned(
            left: -120,
            top: -80,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.9),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Círculo pequeño de detalle (punto) en la parte superior
          Positioned(
            left: 80,
            top: 120,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: lightAccentColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          
          // Formas geométricas en la esquina superior derecha
          Positioned(
            right: -50,
            top: -20,
            child: Transform.rotate(
              angle: 0.3,
              child: Container(
                width: 150,
                height: 150,
                child: CustomPaint(
                  painter: GeometricShapesPainter(primaryColor.withOpacity(0.8)),
                ),
              ),
            ),
          ),

          // Formas triangulares en la esquina inferior derecha
          Positioned(
            right: -30,
            bottom: -40,
            child: Transform.rotate(
              angle: -0.5,
              child: Container(
                width: 180,
                height: 180,
                child: CustomPaint(
                  painter: TriangularShapesPainter(primaryColor.withOpacity(0.7)),
                ),
              ),
            ),
          ),

          // ----------------------------------------------------
          // CONTENIDO PRINCIPAL: FORMULARIO DE LOGIN
          // ----------------------------------------------------
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Título "login ADMIN/ALUMNO"
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        letterSpacing: -1,
                      ),
                      children: [
                        const TextSpan(text: 'login'),
                        TextSpan(
                          text: loginType,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white70,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80), // Más espacio después del título
                  
                  // Campo de texto 1 (Num. Trabajador / Num. Cuenta)
                  Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: TextField(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        labelText: label1,
                        labelStyle: TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white30,
                            width: 1,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  
                  // Campo de texto 2 (Contraseña)
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: TextField(
                      obscureText: true,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white30,
                            width: 1,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor,
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                  
                  // Botón de Login
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Lógica de inicio de sesión
                        print('Login pressed for $loginType');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        'login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------------------------------------------
// CustomPainter para dibujar formas geométricas en la esquina superior derecha
// ----------------------------------------------------
class GeometricShapesPainter extends CustomPainter {
  final Color color;

  GeometricShapesPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Dibujar rectángulos/barras diagonales
    final double barWidth = size.width * 0.15;
    final double spacing = size.width * 0.25;

    for (int i = 0; i < 4; i++) {
      final Rect rect = Rect.fromLTWH(
        i * spacing,
        0,
        barWidth,
        size.height,
      );
      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// ----------------------------------------------------
// CustomPainter para dibujar las formas triangulares en la esquina inferior
// ----------------------------------------------------
class TriangularShapesPainter extends CustomPainter {
  final Color color;

  TriangularShapesPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint1 = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Paint paint2 = Paint()
      ..color = color.withOpacity(0.6)
      ..style = PaintingStyle.fill;

    // Triángulo principal
    final Path trianglePath1 = Path()
      ..moveTo(size.width * 0.2, size.height * 0.3)
      ..lineTo(size.width * 0.8, size.height * 0.1)
      ..lineTo(size.width * 0.9, size.height * 0.7)
      ..lineTo(size.width * 0.3, size.height * 0.9)
      ..close();

    canvas.drawPath(trianglePath1, paint1);

    // Triángulo secundario superpuesto
    final Path trianglePath2 = Path()
      ..moveTo(size.width * 0.5, size.height * 0.2)
      ..lineTo(size.width * 0.9, size.height * 0.4)
      ..lineTo(size.width * 0.7, size.height * 0.8)
      ..lineTo(size.width * 0.4, size.height * 0.6)
      ..close();

    canvas.drawPath(trianglePath2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}