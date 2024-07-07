import 'package:flutter/material.dart';


class MyResume extends StatelessWidget {
  const MyResume({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Personal Information Section
              ResumeSection(
                title: 'Datos personales',
                button: ElevatedButton(
                  onPressed: () {},
                  child: Text('Editar'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResumeItem(title: 'Nacionalidad:', value: 'Ecuador'),
                    ResumeItem(title: 'Fecha de nacimiento:', value: 'Sin especificar'),
                    ResumeItem(title: 'Género:', value: 'Sin especificar'),
                    ResumeItem(title: 'Estado civil:', value: 'Sin especificar'),
                    ResumeItem(title: 'Documento:', value: '1724658025'),
                  ],
                ),
              ),

              // Education Section
              ResumeSection(
                title: 'Educación',
                button: ElevatedButton(
                  onPressed: () {},
                  child: Text('Sumar estudio'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Add education items here
                  ],
                ),
              ),

              // Experience Section
              ResumeSection(
                title: 'Experiencia',
                button: ElevatedButton(
                  onPressed: () {},
                  child: Text('Sumar experiencia'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Add experience items here
                  ],
                ),
              ),

              // Contact Information Section
              ResumeSection(
                title: 'Datos de contacto',
                button: ElevatedButton(
                  onPressed: () {},
                  child: Text('Editar'),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResumeItem(title: 'Teléfono:', value: '+593 996589654'),
                    ResumeItem(title: 'Correo electrónico:', value: 'stalin9116@gmail.com'),
                    ResumeItem(title: 'Dirección:', value: 'Sin especificar'),
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

class ResumeSection extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget button;

  const ResumeSection({
    Key? key,
    required this.title,
    required this.child,
    required this.button,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
          const SizedBox(height: 16),
          button,
        ],
      ),
    );
  }
}

class ResumeItem extends StatelessWidget {
  final String title;
  final String value;

  const ResumeItem({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
      ],
    );
  }
}