import 'package:flutter/material.dart';
import 'package:teste/widgets/custom_text_form_field.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String lastValidated;
  String lastRejected;

  String validate(String teste) {
    if (lastValidated == teste) {
      return null;
    } else if (lastRejected == teste) {
      return 'Invalido';
    } else {
      validateAsync(teste);
      return 'Validação em andamento';
    }
  }

  Future<void> validateAsync(String teste) async {
    await Future.delayed(const Duration(seconds: 2));
    if (teste == 'teste') {
      lastValidated = teste;
    } else {
      lastRejected = teste;
    }

    _formKey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Validador Assíncrono'),
        centerTitle: true,
        elevation: 5,
      ),
      backgroundColor: Colors.grey,
      body: Container(
        margin: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: CustomTextFormField(
            controller: _textEditingController,
            validator: validate,
            onChanged: null,
          ),
        ),
      ),
    );
  }
}
