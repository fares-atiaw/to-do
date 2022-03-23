import 'package:flutter/material.dart';

class BS_AddTask extends StatelessWidget {

  //final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        /*decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),*/
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(10),
                child: Text('Add new Task', style: Theme.of(context).textTheme.headline3?.copyWith(fontSize: 26))
            ),
            Form(
              //key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.headline3?.copyWith(fontSize: 20, fontWeight: FontWeight.normal),
                      labelText: 'Title',
                    ),
                    maxLines: 4,
                    validator: (value) {
                      if( value==null || value.isEmpty) return 'Please enter some text';
                      else return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.headline3?.copyWith(fontSize: 20, fontWeight: FontWeight.normal),
                      labelText: 'Description',
                    ),
                    minLines: 1,
                    maxLines: 4,
                    validator: (value) {
                      if( value==null || value.isEmpty) return 'Please enter some text';
                      else return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text('Task Date', style: Theme.of(context).textTheme.headline3?.copyWith(fontSize: 18)),
            SizedBox(height: 4),
            Text('5/55/5555', style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 18)),
            SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width *0.5,
              child: ElevatedButton(
                  onPressed: (){
                    // if(_formKey.currentState!.validate()){
                    //   //add     soon
                    // }
                  },
                  child: Text('Add this'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
