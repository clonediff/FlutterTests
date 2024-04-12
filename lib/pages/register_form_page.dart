import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_project/default_appbar.dart';
import 'package:test_project/model/user.dart';
import 'package:test_project/pages/user_info_page.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePass = true;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final List<String> _countries = ['Russia', 'Ukraine', 'Germany', 'France'];
  String? _selectedCountry;

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  User user = User();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: DefaultAppBar(
        title: const Text('Register Form'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_) =>
                  _fieldFocusChange(context, _nameFocus, _phoneFocus),
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full name *',
                hintText: 'What do people call you?',
                prefixIcon: const Icon(Icons.person),
                suffixIcon: GestureDetector(
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  onTap: () {
                    _nameController.clear();
                  },
                ),
                // Граница по умолчанию
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                // Граница, когда поле выбрано
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
              validator: _validateName,
              onSaved: (value) => user.name = value!,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              focusNode: _phoneFocus,
              onFieldSubmitted: (_) =>
                  _fieldFocusChange(context, _phoneFocus, _passFocus),
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone number *',
                hintText: 'Where can we reach you?',
                helperText: 'Phone format: (XXX)XXX-XXXX',
                prefixIcon: const Icon(Icons.call),
                suffixIcon: GestureDetector(
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  onLongPress: () {
                    _phoneController.clear();
                  },
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                // FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter(RegExp(r'[()\d -]'), allow: true)
              ],
              validator: (value) => _validatePhoneNumber(value)
                  ? null
                  : 'Phone number must be entered as (###)###-#### ',
              onSaved: (value) => user.phone = value!,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                hintText: 'Enter a email address',
                icon: Icon(Icons.mail),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: _validateEmail,
              onSaved: (value) {
                user.email = value!.isEmpty ? null : value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.map),
                  labelText: 'Country?'),
              items: _countries
                  .map((country) => DropdownMenuItem<String>(
                        value: country,
                        child: Text(country),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCountry = value;
                  user.country = value;
                });
              },
              value: _selectedCountry,
              // validator: (value) => value == null ? 'Please select a country' : null,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _storyController,
              decoration: const InputDecoration(
                labelText: 'Life story',
                hintText: 'Tell us about yourself',
                helperText: 'Keep it short, this is just a demo',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              inputFormatters: [
                LengthLimitingTextInputFormatter(100),
              ],
              onSaved: (value) => user.story = value!.isEmpty ? null : value,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              focusNode: _passFocus,
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password *',
                hintText: 'Enter the password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                  icon:
                      Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                ),
                icon: const Icon(Icons.security),
              ),
              obscureText: _hidePass,
              maxLength: 8,
              validator: _validatePassword,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirm Password *',
                hintText: 'Confirm the password',
                icon: Icon(Icons.border_color),
              ),
              obscureText: _hidePass,
              maxLength: 8,
              validator: _validateConfirmPassword,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () => _submitForm(context),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.green)),
              child: const Text(
                'Submit Form',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      _showDialog(name: _nameController.text);
      print('Name: ${_nameController.text}');
      print('Phone: ${_phoneController.text}');
      print('Email: ${_emailController.text}');
      print('Country: $_selectedCountry');
      print('Life story: ${_storyController.text}');
    } else {
      _showMessage(
          context: context,
          message: 'Form is not valid! Please review and correct');
    }
  }

  void _showMessage({required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.red,
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  void _showDialog({required String name}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Registration successful',
            style: TextStyle(color: Colors.green),
          ),
          content: Text(
            '$name is now a verified register form',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInfoPage(userInfo: user),
                ));
              },
              child: const Text(
                'Verified',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  String? _validateName(String? value) {
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value!.isEmpty) return 'Name is required';
    if (!nameExp.hasMatch(value)) return 'Please enter alphabetical characters';
    return null;
  }

  bool _validatePhoneNumber(String? value) {
    final phoneExp = RegExp(r'^\(\d{3}\)\d{3}-\d{4}$');
    return phoneExp.hasMatch(value!);
  }

  String? _validateEmail(String? value) {
    // if (value!.isEmpty) return 'Email cannot be empty';
    if (value!.isEmpty) return null;
    if (!value.contains('@')) return 'Invalid email address';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value?.length != 8) return '8 character required for password';
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    final validatePassResult = _validatePassword(value);
    if (validatePassResult != null) return validatePassResult;
    if (value != _passwordController.text) return 'Password does not match';
    return null;
  }
}
