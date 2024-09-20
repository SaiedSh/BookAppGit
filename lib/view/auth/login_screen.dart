import 'package:bookapp/controller/api/auth/login_controller_post.dart';
import 'package:bookapp/controller/routes/routes.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _countryCode = '+98';
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image(
                          image: AssetImage('lib/assets/images/iconperson.png'),
                          width: 45,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'شروع کار با نیکو بوک',
                          style: GoogleFonts.ibmPlexSansArabic(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'با شماره موبایل تان وارد شوید',
                          style: GoogleFonts.ibmPlexSansArabic(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 300,
                      height: 40,
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(color: Colors.grey))),
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: CountryCodePicker(
                                    padding: const EdgeInsets.all(0),
                                    flagDecoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    textStyle: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                    onChanged: (countryCode) {
                                      setState(() {
                                        _countryCode = countryCode.dialCode ??
                                            '+98'; // Default to +98 if null
                                      });
                                    },
                                    initialSelection: 'IR', // Default to Iran
                                    favorite: [
                                      '+98',
                                      'IR'
                                    ], // Favorite country (Iran)
                                  ),
                                ),
                              ),
                            ),
                          ),
                          hintText: 'شماره موبایل',
                          hintStyle: TextStyle(fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: RawMaterialButton(
                    fillColor: Colors.grey.shade300,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Icon(
                              Icons.arrow_back,
                              size: 15,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'ورود',
                            style: GoogleFonts.ibmPlexSansArabic(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () async {
                      login(
                              phoneNumber: _phoneController.text,
                              context: context)
                          .then(
                        (value) {
                          if (value.isSuccess == true) {
                            Navigator.pushNamed(context, MyRoutes.otpScreen,
                                arguments: _phoneController.text);
                          }
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'یا',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Expanded(child: Divider())
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 300,
                  child: RawMaterialButton(
                    fillColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'با ایمیل',
                            style: GoogleFonts.ibmPlexSansArabic(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image(
                            image: AssetImage('lib/assets/images/email.png'),
                            width: 25,
                          )
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.5, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () async {},
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: RawMaterialButton(
                    fillColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'با حساب گوگل',
                            style: GoogleFonts.ibmPlexSansArabic(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image(
                            image: AssetImage('lib/assets/images/google.png'),
                            width: 25,
                          )
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.5, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () async {},
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'از نیکو بوک را میپذیرم',
                      style: GoogleFonts.ibmPlexSansArabic(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'قوانین استفاده',
                          style: GoogleFonts.ibmPlexSansArabic(
                            decorationColor: Colors.blue,
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
