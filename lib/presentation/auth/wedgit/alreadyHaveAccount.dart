// ignore_for_file: file_names

import 'package:doctor_app/presentation/auth/login.dart';
import 'package:flutter/material.dart';

class Alreadyhaveaccount extends StatelessWidget {
  const Alreadyhaveaccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: const Text(
                            'Already have an account?',
                          ),
                        ),
                          GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>   Loginin(),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text(
                              ' Login.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                 
  }
}