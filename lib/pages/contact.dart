import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _notABot = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Contact Form'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Contact Me!'),
              const SizedBox(height: 20),
              _buildFormField('Name', _nameController),
              const SizedBox(height: 10),
              _buildFormField('Email', _emailController),
              const SizedBox(height: 10),
              _buildFormField('Phone', _phoneController),
              const SizedBox(height: 10),
              _buildFormField('Message', _messageController),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _notABot,
                    onChanged: (newValue) {
                      setState(() {
                        _notABot = newValue!;
                      });
                    },
                  ),
                  const Text('I am not a Bot'),
                ],
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  final name = _nameController.text;
                  final email = _emailController.text;
                  final phone = _phoneController.text;
                  final message = _messageController.text;

                  print('Name: $name');
                  print('Email: $email');
                  print('Phone: $phone');
                  print('Message: $message');
                  print('Not a Bot: $_notABot');
                },
                child: const Text('Send Message'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      ),
      style: const TextStyle(fontSize: 16),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}

