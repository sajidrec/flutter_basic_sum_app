import 'package:basic_sum_app/calculation_functions.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingControllerOne =
          TextEditingController(),
      _textEditingControllerTwo = TextEditingController();
  int _result = 0;

  final FocusNode _focusNodeOne = FocusNode();
  final FocusNode _focusNodeTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade300,
        title: const Text(
          "Basic Sum App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Give valid number input";
                    }
                    return null;
                  },
                  controller: _textEditingControllerOne,
                  decoration: const InputDecoration(hintText: "Enter number"),
                  keyboardType: TextInputType.number,
                  focusNode: _focusNodeOne,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return "Give valid number input";
                    }
                    return null;
                  },
                  controller: _textEditingControllerTwo,
                  decoration: const InputDecoration(hintText: "Enter number"),
                  keyboardType: TextInputType.number,
                  focusNode: _focusNodeTwo,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: IconButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _result = addTwo(
                                (int.tryParse(
                                      _textEditingControllerOne.text.trim(),
                                    ) ??
                                    0),
                                (int.tryParse(
                                      _textEditingControllerTwo.text.trim(),
                                    ) ??
                                    0));
                            setState(() {});
                          }
                        },
                        icon: Icon(
                          Icons.add_circle,
                          size: 50,
                          color: Colors.green.shade400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: IconButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _result = subtractTwo(
                                (int.tryParse(
                                      _textEditingControllerOne.text.trim(),
                                    ) ??
                                    0),
                                (int.tryParse(
                                      _textEditingControllerTwo.text.trim(),
                                    ) ??
                                    0));
                            setState(() {});
                          }
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          size: 50,
                          color: Colors.red.shade400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: IconButton(
                        onPressed: () {
                          _result = 0;
                          _textEditingControllerOne.text = "";
                          _textEditingControllerTwo.text = "";
                          _focusNodeOne.unfocus();
                          _focusNodeTwo.unfocus();
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.clear_all_rounded,
                          size: 50,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Result : $_result\n",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
