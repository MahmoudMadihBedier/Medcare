import 'package:flutter/material.dart';

class ArticleViewPage extends StatelessWidget {
  final String tag;

  const ArticleViewPage({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Text("Getting to know Hanta Virus Disease from Rodents",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),

            ),
            Text("Written by Lonard on January 10, 2024",
            style: TextStyle(color: Colors.grey,fontSize: 12),),
            Hero(
                tag: tag,
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Image.asset(
                    'assets/images/$tag.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )),
            Text("""Title: Understanding Hanta Virus Disease: Risks, Symptoms, and Prevention Measures from Rodents

Introduction:
Hanta virus disease, transmitted primarily through contact with rodent urine, droppings, or saliva, poses a significant health threat to humans worldwide. This article aims to provide an overview of Hanta virus disease, its potential risks, common symptoms, and essential prevention measures.

What is Hanta Virus Disease?
Hanta virus disease is a rare but potentially deadly viral infection caused by several strains of hantaviruses. These viruses are typically carried by rodents, such as mice, rats, and voles, and can be transmitted to humans through inhalation of airborne particles contaminated with rodent excreta.

Understanding the Risks:
Individuals who live or work in areas with high rodent populations, such as rural or semi-rural environments, are at an increased risk of contracting Hanta virus disease. Activities that involve disturbing rodent habitats, such as cleaning barns, sheds, or attics, can also elevate the risk of exposure.

Common Symptoms:
The symptoms of Hanta virus disease can vary widely but often include flu-like symptoms such as fever, muscle aches, headaches, and fatigue. As the disease progresses, individuals may experience respiratory symptoms such as coughing and shortness of breath, which can rapidly escalate to severe respiratory distress and potentially fatal complications.
""")
          ],
        ),
      ),
    );
  }
}
