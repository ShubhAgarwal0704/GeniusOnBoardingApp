import 'package:flutter/material.dart';
import 'package:onboarding_form/components/home_screen_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(7, 150, 253, 1.0),
        extendBody: true,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: mediaQueryData.size.height * 0.02,
                  ),
                  child: const Text(
                    'Discover All-Inclusive Features',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const AboutUsTile(

                  title: ' 🤖 AI Chatbot',
                  subtitle:
                  'Interact with an AI-powered chatbot that provides intelligent responses and personalized recommendations.',
                ),
                const AboutUsTile(

                  title: ' 💬 Seamless Multiturn Conversation',
                  subtitle:
                  'Engage in fluid and continuous dialogue, allowing for natural conversation flow across multiple turns.',
                ),
                const AboutUsTile(

                  title: ' 🔍 Search Island',
                  subtitle:
                  'Perform parallel searches efficiently within a single platform, enhancing productivity and speed.',
                ),
                const AboutUsTile(

                  title: ' 💻 Chat With Any Website',
                  subtitle:
                  'Interact directly with websites through conversational interfaces, saving time and effort in information retrieval.',
                ),
                const AboutUsTile(

                  title: ' 🌐 Universal Query',
                  subtitle:
                  'Obtain comprehensive answers from various sources with a single query, streamlining information gathering.',
                ),
                const AboutUsTile(
                  title: ' 🌊 Experience Depth',
                  subtitle:
                  'Dive deep into discussions with your favorite subjects, products, or personalities, fostering enriching interactions.',
                ),
                const AboutUsTile(
                  title: ' 🕊️ Chat For Peace',
                  subtitle:
                  'Access mental health support rooted in ancient wisdom, providing insights from the Bhagavad Gita and Srimad Bhagavatam for inner peace and well-being.',
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  child: SizedBox(
                    height: mediaQueryData.size.height * 0.06,
                    width: mediaQueryData.size.width * 0.9,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/form');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
