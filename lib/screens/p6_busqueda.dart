import 'package:flutter/material.dart';
import '../widgets/cartia_widgets.dart';
import 'p5_resultados.dart';

class P6Busqueda extends StatefulWidget {
  const P6Busqueda({super.key});
  @override
  State<P6Busqueda> createState() => _P6BusquedaState();
}

class _P6BusquedaState extends State<P6Busqueda> {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _buscar() {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => P5Resultados.busqueda(texto: _controller.text.trim())));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CartiaHeader(),
    body: FondoOndas(child: ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Text('Buscar un plato', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 12),
        Text('Encuentra un plato por su nombre, ingrediente o descripción.',
          style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 24),
        Form(key: _formKey, child: TextFormField(
          controller: _controller,
          textInputAction: TextInputAction.search,
          decoration: const InputDecoration(
            labelText: 'Nombre o ingrediente',
            hintText: 'Ej. croquetas',
            prefixIcon: Icon(Icons.search),
          ),
          validator: (value) => value == null || value.trim().isEmpty
            ? 'Escribe el nombre de un plato o ingrediente.' : null,
          onFieldSubmitted: (_) => _buscar(),
        )),
        const SizedBox(height: 18),
        CartiaBoton(texto: 'Buscar platos', icono: Icons.search,
          onPressed: _buscar),
        const SizedBox(height: 26),
        const AvisoAlergenos(),
      ],
    )),
  );
}
