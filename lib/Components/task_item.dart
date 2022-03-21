import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(10),
        //border: Border(top: BorderSide(width: 1, color: Theme.of(context).primaryColor)),
        border: Border.all(width: 1.5, color: Theme.of(context).primaryColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 4, height: MediaQuery.of(context).size.height *0.06,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Play basket ball', style: Theme.of(context).textTheme.headline2,),
                    Row(
                      children: [
                        Icon(Icons.watch_later_outlined, size: 16,),
                        SizedBox(width: 5,),
                        Text('data', style: Theme.of(context).textTheme.headline3?.copyWith(fontWeight: FontWeight.normal))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width *0.15,
                height: MediaQuery.of(context).size.height *0.035,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                //padding: EdgeInsets.symmetric(vertical: 60,horizontal: 20),
                child: Icon(Icons.check, size: 28, color: Theme.of(context).colorScheme.onPrimary))

          ],
        ),
      ),
    );
  }
}
