import 'package:advert/add_product/add_product.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HomeView'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddProduct()));
                }, 
                icon: const Icon(Icons.publish), 
                label: const Text('Start')
                ),
          )
        ],
      ),
    );
  }
}
