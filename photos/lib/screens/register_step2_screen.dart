import 'package:flutter/material.dart';
import 'package:photos/utils/validators.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:photos/widgets/custom_text.dart';

class RegisterStep2Screen extends StatefulWidget {
  const RegisterStep2Screen({super.key});

  @override
  _RegisterStep2ScreenState createState() => _RegisterStep2ScreenState();
}

class _RegisterStep2ScreenState extends State<RegisterStep2Screen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      // Process data
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Processing Registration')));
      // TODO: Implement actual registration logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/back_button.svg'),
          onPressed: () {
            context.pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20), // Add spacing from AppBar
              CustomText(
                text: 'Register',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40), // Space between title and text field
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 10,
                  ),
                ),
                validator:
                    Validators
                        .validateEmail, // Using email validator for now, can be updated
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      5,
                    ), // Adjust border radius as needed
                  ),
                ),
                child: CustomText(
                  text: 'SIGN UP',
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              CustomText(
                text:
                    'By signing up, you agree to Photo\'s Terms of Service and Privacy Policy.',
                textAlign: TextAlign.center,
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
