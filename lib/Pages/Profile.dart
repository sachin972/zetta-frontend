// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../Components/ProfileHeader.dart';
import '../Models/ProfileItem.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const ProfileHeader(),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileItem(label: "Roll Number", value: "0175"),
                    ProfileItem(label: "Date of Birth", value: "10 Oct 1996"),
                    ProfileItem(label: "Blood Group", value: "B+"),
                    ProfileItem(
                        label: "Emergency Contact", value: "+91 9812345678"),
                    ProfileItem(label: "Position in Class", value: "12th"),
                    ProfileItem(label: "Father's Name", value: "Mr. Raj Shaje"),
                    ProfileItem(
                        label: "Mother's Name", value: "Mrs. Priya Shaje"),
                    const Spacer(),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF4D67),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 16),
                        ),
                        onPressed: () {
                          // Action for "Ask for Update"
                        },
                        child: const Text(
                          "Ask for Update",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
