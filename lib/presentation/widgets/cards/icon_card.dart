import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final void Function()? onTap;
  const IconCard({super.key, required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      child: Card(
        color: colors.inversePrimary,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0), 
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: 80,
                    color: colors.inverseSurface,
                  ),
                  const SizedBox(height: 8), 
                  Text(
                    label,
                    style: textStyle.titleLarge,
                  ),
                ],
              ),
              const SizedBox(width: 15,),
      
              const Icon(Icons.arrow_forward_ios)
      
      
            ],
          ),
        ),
      ),
    );
  }
}
