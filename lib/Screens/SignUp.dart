import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:random_string/random_string.dart';
import 'package:flutter/material.dart';

import 'LogIn.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignUp App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // Image.asset('assets/images/signup.jpg')
      ),
      debugShowCheckedModeBanner: false, // Hide the debug banner
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String _selectedRole;
  final List<String> _roles = ['Select', 'Teacher', 'Student'];

  final TextEditingController _teachernameController = TextEditingController();
  final TextEditingController _teachermobileController =
      TextEditingController();
  final TextEditingController _teacheremailController = TextEditingController();

  final TextEditingController _studentnameController = TextEditingController();
  final TextEditingController _studentrollNumberController =
      TextEditingController();
  final TextEditingController _studentfatherNameController =
      TextEditingController();
  final TextEditingController _studentdateOfBirthController =
      TextEditingController();
  final TextEditingController _studentmobileController =
      TextEditingController();
  final TextEditingController _studentemailController = TextEditingController();

  final List<String> _genderOptions = ['Male', 'Female'];
  late String _selectedGender;

  late DatabaseReference dbRef, dbRef2;

  final List<String> _classOptions = [
    '1st',
    '2nd',
    '3rd',
    '4th',
    '5th',
    '6th',
    '7th',
    '8th',
    '9th',
    '10th',
    '11th',
    '12th'
  ];
  late String _selectedClass;

  @override
  void initState() {
    super.initState();
    _selectedRole = _roles[0]; // Set the initial selected role
    _selectedGender = _genderOptions[0]; // Set the initial selected gender
    _selectedClass = _classOptions[0]; // Set the initial selected class
    // Firebase
    dbRef = FirebaseDatabase.instance.ref().child('Staff_details');
    dbRef2 = FirebaseDatabase.instance.ref().child('Student_details');
  }

  bool _validateStudentDetails() {
    // Validate student details
    final String name = _studentnameController.text.trim();
    final String rollNumber = _studentrollNumberController.text.trim();
    final String fatherName = _studentfatherNameController.text.trim();
    final String dateOfBirth = _studentdateOfBirthController.text.trim();
    final String mobile = _studentmobileController.text.trim();
    final String email = _studentemailController.text.trim();

    if (name.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter student name.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }

    if (rollNumber.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter roll number.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }

    if (fatherName.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text("Please enter father's name."),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }

    if (dateOfBirth.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter date of birth.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }

    if (mobile.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter mobile number...'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }

    // Perform additional validation for mobile number
    // ...

    if (email.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter email id.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }

    // Perform additional validation for email format
    // ...

    // All student details are valid
    return true;
  }

  bool _validateTeacherDetails() {
    // Validate teacher details
    final String teachername = _teachernameController.text.trim();
    final String teachermobile = _teachermobileController.text.trim();
    final String teacheremail = _teacheremailController.text.trim();

    if (teachername.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter teacher name.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }

    if (teachermobile.isEmpty || teachermobile.length != 10) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter mobile number.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }

    // Perform additional validation for mobile number
    // ...

    if (teacheremail.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter email id.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    }
    return true;
  }

  bool _submitSignUpForm() {
    if (_selectedRole == 'Teacher') {
      if (_validateTeacherDetails()) {
        showDialog(
          context: context,
          barrierDismissible:
              true, // Prevent dismissing the dialog on tap outside
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Signing Up'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(), // Show circular progress indicator
                  SizedBox(height: 16.0),
                  Text('Please wait...'),
                ],
              ),
            );
          },
        );
        // Perform signup logic for teacher
        // ...
        // Dismiss the popup
        Navigator.pop(context);
        String teacherId = generateTeacherId();
        String teacherpassword =
            generateTeacherPassword(_teachernameController.text);
        Map<String, String> users = {
          'Teacher_ID': teacherId,
          'teacher_name': _teachernameController.text,
          'mobile_number': _teachermobileController.text,
          'email_id': _teacheremailController.text,
          'teacher_password': teacherpassword
        };
        dbRef.push().set(users);
        // Navigate to the LoginApp
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginApp()),
        );
      }
    } else if (_selectedRole == 'Student') {
      if (_validateStudentDetails()) {
        showDialog(
          context: context,
          barrierDismissible:
              true, // Prevent dismissing the dialog on tap outside
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Signing Up'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(), // Show circular progress indicator
                  SizedBox(height: 16.0),
                  Text('Please wait...'),
                ],
              ),
            );
          },
        );
        // Perform signup logic for student
        // ...

        // Dismiss the popup
        Navigator.pop(context);
        String studentId = generateStudentId();
        String studentpassword =
            generateStudentPassword(_studentnameController.text);
        Map<String, String> users = {
          'student_id': studentId,
          'student_name': _studentnameController.text,
          'roll_number': _studentrollNumberController.text,
          'father_name': _studentfatherNameController.text,
          'Date_of_birth': _studentdateOfBirthController.text,
          'Gender': _selectedGender,
          'Mobile_number': _studentmobileController.text,
          'Email_ID': _studentemailController.text,
          'mobile_number': _studentmobileController.text,
          'Class': _selectedClass,
          'email_id': _studentemailController.text,
          'student_password': studentpassword
        };

        dbRef2.push().set(users);
        // Navigate to the LoginApp
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginApp()),
        );
      }
    }

    return false;
  }

  // Generating Teacher ID
  String generateTeacherId() {
    // Generate a random 5-digit number
    String teacherId = randomNumeric(5);
    return teacherId;
  }

  // Generating Teacher's Password
  String generateTeacherPassword(String teacherName) {
    // Generate a random alphanumeric value with 6 characters
    String alphabet =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String specialSymbols = '!@#\$%^&*()_-+=[]{}|:;<>,.?/~';

    String randomAlphanumeric =
        List.generate(6, (index) => alphabet[Random().nextInt(alphabet.length)])
            .join();

    String randomSpecialSymbol =
        specialSymbols[Random().nextInt(specialSymbols.length)];

    // Concatenate the first four letters of teacher's name and the random value
    String password = teacherName.substring(0, min(4, teacherName.length)) +
        randomAlphanumeric +
        randomSpecialSymbol;

    return password;
  }

  // Generating Student ID
  String generateStudentId() {
    // Generate a random 5-digit number
    String teacherId = randomNumeric(5);
    return teacherId;
  }

  // Generating Students's Password
  String generateStudentPassword(String studentName) {
    // Generate a random alphanumeric value with 6 characters
    String alphabet =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    String specialSymbols = '!@#\$%^&*()_-+=[]{}|:;<>,.?/~';

    String randomAlphanumeric =
        List.generate(6, (index) => alphabet[Random().nextInt(alphabet.length)])
            .join();

    String randomSpecialSymbol =
        specialSymbols[Random().nextInt(specialSymbols.length)];

    // Concatenate the first four letters of teacher's name and the random value
    String password = studentName.substring(0, min(4, studentName.length)) +
        randomAlphanumeric +
        randomSpecialSymbol;

    return password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: 30.0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  'Sign Up As',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                // Set the background color
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: DropdownButton<String>(
                isExpanded: true,
                value: _selectedRole,
                items: _roles.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedRole = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 16.0),
            if (_selectedRole == 'Teacher') ...[
              TextFormField(
                controller: _teachernameController,
                decoration: InputDecoration(
                  labelText: 'Teacher Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Enter teacher name',
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter teacher name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _teachermobileController,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Enter mobile number',
                ),
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter mobile number';
                  }
                  // Perform additional validation for mobile number
                  // ...
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _teacheremailController,
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Enter email id',
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email id';
                  }
                  // Perform additional validation for email format
                  // ...
                  return null;
                },
              ),
            ] else if (_selectedRole == 'Student') ...[
              TextFormField(
                controller: _studentnameController,
                decoration: InputDecoration(
                  labelText: 'Student Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Enter student name',
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter student name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _studentrollNumberController,
                decoration: InputDecoration(
                  labelText: 'Roll Number',
                  prefixIcon: Icon(Icons.plus_one),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Enter roll number',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter roll number';
                  }
                  // Perform additional validation for roll number
                  // ...
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _studentfatherNameController,
                decoration: InputDecoration(
                  labelText: "Father's Name",
                  hintText: "Enter father's name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter father's name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _studentdateOfBirthController,
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Select date of birth',
                ),
                onTap: () async {
                  // Show calendar or date picker
                  // ...
                  await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  ).then((pickedDate) {
                    if (pickedDate != null) {
                      setState(() {
                        _studentdateOfBirthController.text =
                            pickedDate.toString().split(' ')[0];
                      });
                    }
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please select date of birth';
                  }
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              DropdownButtonFormField<String>(
                isExpanded: true,
                value: _selectedGender,
                items: _genderOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        Icon(
                          Icons.group,
                          // Add any additional styling properties for the icon if needed
                        ),
                        SizedBox(
                            width:
                                10), // Adjust the spacing between the icon and the text
                        Text(value),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _studentmobileController,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  prefixIcon: Icon(Icons.dialpad),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Enter mobile number',
                ),
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter mobile number';
                  }
                  // Perform additional validation for mobile number
                  // ...
                  return null;
                },
              ),
              SizedBox(height: 8.0),
              DropdownButtonFormField<String>(
                isExpanded: true,
                value: _selectedClass,
                items: _classOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        Icon(
                          Icons.school,
                          // Add any additional styling properties for the icon if needed
                        ),
                        SizedBox(
                            width:
                                10), // Adjust the spacing between the icon and the text
                        Text(value),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedClass = value!;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              TextFormField(
                controller: _studentemailController,
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Enter email id',
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email id';
                  }
                  // Perform additional validation for email format
                  // ...
                  return null;
                },
              ),
            ],
            SizedBox(height: 16.0),
            Visibility(
              visible: _selectedRole != 'Select',
              child: Container(
                width: 150, // Adjust the width value as per your requirement
                child: ElevatedButton(
                  onPressed: () async {
                    bool isValid = _submitSignUpForm();
                    if (isValid) {
                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Sign Up Successful'),
                        ),
                      );
                      Map<String, String> students = {
                        'name': _studentnameController.text,
                        'roll_number': _studentrollNumberController.text
                      };
                    }
                  },
                  child: Text('Sign Up'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.0, // Adjust the horizontal padding value
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
