import "package:flutter/material.dart";
import "package:laravelflutter/controllers/databaseHelper.dart";
import "package:laravelflutter/view/dashboard.dart";

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  // Include Class dbHelper
  DatabaseHelper dbHelper = DatabaseHelper();
  //deklarasi from text
  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          Column(
            children: [
              TextField(
                controller: _txtName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  hintText: "Product Name",
                  labelText: "Product Name",
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Column(
            children: [
              TextField(
                controller: _txtPrice,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  hintText: "Product Price",
                  labelText: "Product Price",
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              dbHelper.addData(_txtName.text.trim(), _txtPrice.text.trim());
              //redirect ke halaman dashboard
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard(),
              ));
            }, 
            child: Text("Save", style: TextStyle(color: Colors.white)),
            
          ),
        ],
      ),
    );
  }
}