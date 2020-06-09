import 'package:flutter/material.dart';
import '../widgets/app_text_form_field.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formkey = GlobalKey<FormState>();

  final emailFocusNode = FocusNode();
  final PhoneNoFocusNode = FocusNode();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    phoneNoController.dispose();
    PhoneNoFocusNode.dispose();
    emailFocusNode.dispose();

  }

  void _showDialog(BuildContext context, String message, String title) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('OK!'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
            splashColor: Colors.deepOrange,
          ),
        ],
      ),
      body: Form(
        key: _formkey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppTextFormField(
                  titleLabel: 'Enter Your Name',
                  inputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter name.';
                    }
                    return null;
                  },
                  inputType: TextInputType.text,
                  icon: Icons.person_pin,
                  maxLength: 20,
                  fieldSubmit: (_) {
                    FocusScope.of(context).requestFocus(emailFocusNode);
                  },
                  controller: nameController,
                ),
                AppTextFormField(
                  titleLabel: 'Enter Your Email',
                  inputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Email.';
                    }
                    return null;
                  },
                  inputType: TextInputType.emailAddress,
                  icon: Icons.email,
                  maxLength: 40,
                  focusnode: emailFocusNode,
                  fieldSubmit: (_) {
                    FocusScope.of(context).requestFocus(PhoneNoFocusNode);
                  },
                  controller: emailController,
                ),
                AppTextFormField(
                  titleLabel: 'Enter Your Phone Number',
                  inputAction: TextInputAction.done,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Phone Number.';
                    }
                    return null;
                  },
                  inputType: TextInputType.number,
                  icon: Icons.phone_android,
                  maxLength: 11,
                  focusnode: PhoneNoFocusNode,
                  controller: phoneNoController,
                ),
                RaisedButton(
                  focusColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  color: Theme.of(context).accentColor,
                  splashColor: Colors.deepOrangeAccent,
                  onPressed: () {
                    if (_formkey.currentState.validate()) {
                      _showDialog(context, 'Form Submitted', 'Success');
                      nameController.clear();
                      phoneNoController.clear();
                      emailController.clear();
                    } else {
                      _showDialog(context, 'Form Failed', 'Failed');
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
