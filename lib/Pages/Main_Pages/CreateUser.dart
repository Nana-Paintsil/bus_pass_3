import 'package:bus_pass_3/Models/Scoped_Model.dart';
import 'package:bus_pass_3/Pages/Authentication/LoginPage.dart';
import 'package:bus_pass_3/Widgets/InformationDialog.dart';
import 'package:bus_pass_3/api.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uuid/uuid.dart';

import '../../Widgets/ErrorDialog.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _uniqueKeyController = TextEditingController();
  List<String> userTypes = ["Standard User", "Bus Manager"];
  String? typeUser;
  DateTime? selectedDate;
  bool isBusy = false;
  bool activatedOnce = false;
  bool isGuidFormat(String input) {
    try {
      Uuid.parse(input);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dobController.text = picked.toLocal().toString().split(' ')[0];
      });
    }
  }

  var maskFormatter = new MaskTextInputFormatter(
      mask: '(###) #### ###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/main_background.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: activatedOnce == false
                        ? AutovalidateMode.disabled
                        : AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Create An Account',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Enter your details to proceed with creating your account",
                          style: TextStyle(fontSize: 19),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            labelText: 'First Name(s)',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _dobController,
                          decoration: InputDecoration(
                            labelText: 'Date of Birth',
                            border: OutlineInputBorder(),
                            prefixIcon: IconButton(
                              icon: Icon(Icons.calendar_today),
                              onPressed: () {
                                _selectDate(context);
                              },
                            ),
                          ),
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your date of birth';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          inputFormatters: [maskFormatter],
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a phone number';
                            }
                            // Remove non-digit characters before validation
                            final digits = value.replaceAll(RegExp(r'\D'), '');
                            if (digits.length != 10) {
                              return 'Phone number must have 10 digits';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.mail_outline_outlined),
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                              // Add Horizontal padding using menuItemStyleData.padding so it matches
                              // the menu padding when button's width is not specified.
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 16),
                              border: InputBorder.none
                              // Add more decoration..
                              ),
                          hint: const Text(
                            'Select Account Type',
                            style: TextStyle(fontSize: 14),
                          ),
                          items: userTypes
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select type of account';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              typeUser = value;
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            padding: EdgeInsets.only(right: 8),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 24,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                        SizedBox(height: 20),
                        if (typeUser == "Bus Manager")
                          Column(
                            children: [
                              /*  Text(
                                  "Enter unique key provided to your transport company",
                                  style: TextStyle(fontSize: 18)),
                               SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _uniqueKeyController,
                                decoration: InputDecoration(
                                  labelText: 'Unique Key',
                                  border: OutlineInputBorder(),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Unique key field cannot be empty';
                                  }
                                  if (!isGuidFormat(value)) {
                                    return 'Please enter a valid unique key format';
                                  }
                                  return null;
                                },
                              ),*/
                            ],
                          ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              activatedOnce = true;
                            });
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isBusy = true;
                              });

                              UserAuth newUser = UserAuth(
                                  firstName: _firstNameController.text,
                                  lastName: _lastNameController.text,
                                  email: _emailController.text,
                                  tenantId:
                                      "00000000-0000-0000-0000-000000000000",
                                  password: _passwordController.text,
                                  phone: _phoneNumberController.text,
                                  jobId: 0,
                                  dob: DateTime.parse(_dobController.text),
                                  isVerified: true,
                                  userid: ScopedModel.of<MyScopedModel>(context)
                                      .generateGuid());
                              if (typeUser == "Bus Manager") {
                                newUser.role = "manager";
                              } else if (typeUser == "Standard User") {
                                newUser.role = "user";
                              }
                              await ScopedModel.of<MyScopedModel>(context)
                                  .usersApi
                                  .userNewUserPost(userAuth: newUser)
                                  .then((value) {
                                setState(() {
                                  isBusy = false;
                                });
                                if (value! == false) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        ErrorDialog(
                                      message:
                                          'The email entered is not associated with a bus company',
                                    ),
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        InformationDialog(
                                      message: 'Account Created Successfully',
                                    ),
                                  ).then((value) => {
                                        ScopedModel.of<MyScopedModel>(context)
                                            .authenticateThenNavigate(
                                                UserCred(
                                                    email:
                                                        _emailController.text,
                                                    password:
                                                        _passwordController
                                                            .text),
                                                context)
                                      });
                                }
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple.shade400,
                            // Add other styling properties here
                          ),
                          child: Container(
                            width: double
                                .infinity, // Button reaches the end of the screen
                            padding: EdgeInsets.symmetric(
                                vertical: 15), // Increased padding
                            child: Center(
                                child: isBusy == false
                                    ? Container(
                                        height: 30,
                                        padding: EdgeInsets.all(3),
                                        child: Text(
                                          'Create Account',
                                          style: TextStyle(fontSize: 18),
                                        ))
                                    : SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          color: Colors.white,
                                        )),
                                      )),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(fontSize: 18),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => LoginPage())));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ))),
    );
  }
}
