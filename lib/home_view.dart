import 'package:flutter/material.dart';
import 'package:teste/custom_text_form_field.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _textEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  dynamic testeString;
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
    await Future.delayed(Duration(seconds: 2));
    if (teste == 'teste') {
      lastValidated = teste;
    } else {
      lastRejected = teste;
    }

    _formKey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          margin: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  child: Form(
                    key: _formKey,
                    child: CustomTextFormField(
                      controller: _textEditingController,
                      onChanged: null,
                      validator: validate,
                      hintText: 'Teste',
                      labelText: null,
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
