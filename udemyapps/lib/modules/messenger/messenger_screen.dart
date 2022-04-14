
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpc9VXBng2yufswCRPCs1gTyL_sO_cm8N6yA&usqp=CAU'
            ),
            ),
            SizedBox(
            width : 15,
            ),
            Text  ('Chats',
              style: TextStyle(
                color : Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 15.0,
              child: Icon(
                  Icons.camera_alt,
                  size: 16.0,
                  color: Colors.white,
              ),
            ),
              onPressed: () {},
          ),
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 15.0,
              child: Icon(
                Icons.edit,
                size: 16.0,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[300],
                ),
                padding: const EdgeInsets.all(5.0),
                child: Row (
                  children: [
                  Icon(
                    Icons.search,
                  ),
                    SizedBox  (
                      width: 15.0,
                    ),
                    Text (
                      'Search',
                    ),
                ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 100,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20.0,
                  ) ,
                  itemCount: 10,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => buildChatItem(),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20.0,
                  ),
                  itemCount: 50),



            ],
          ),
        ),
      ),
    );
  }

  // 1. build Item
  // 2. build List
  // 3. add Item to List

   //arrow function
 Widget buildChatItem () => Row(
   children: [
     Stack(
       alignment: AlignmentDirectional.bottomEnd,
       children: const [
         CircleAvatar(
           radius: 30.0,
           backgroundImage: NetworkImage(
               'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpc9VXBng2yufswCRPCs1gTyL_sO_cm8N6yA&usqp=CAU'
           ),
         ),
         CircleAvatar(
           radius: 9.0,
           backgroundColor: Colors.white,
         ),
         Padding(
           padding: EdgeInsetsDirectional.only(
             bottom: 3.0,
             end: 3.0,
           ),
           child: CircleAvatar(
             radius: 7.0,
             backgroundColor: Colors.green,
           ),
         ),
       ],
     ),
     const SizedBox(
       width: 20.0,
     ),
     Expanded(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           const Text (
             'Mohammed Ibrahim',
             style:  TextStyle(
               fontSize: 16,
               fontWeight: FontWeight.bold,
             ),
             maxLines: 1,
             overflow: TextOverflow.ellipsis,
           ),
           SizedBox(height: 5.0,),
           Row(
             children: const [
               Expanded(
                 child: Text (
                   'hello my name is Mohammed Ibrahim and programming',
                   maxLines: 2,
                   overflow: TextOverflow.ellipsis,
                 ),
               ),
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10.0,),
                 child: CircleAvatar(
                   radius: 5.0,
                   backgroundColor: Colors.blue,
                 ),
               ),
               Text (
                 '02:00 pm',
               ),


             ],
           ),
         ],
       ),
     ),


   ],
 );

 Widget buildStoryItem () => Container(
   width: 60.0,
   child: Column(
     children: [
       Stack(
         alignment: AlignmentDirectional.bottomEnd,
         children: const [
           CircleAvatar(
             radius: 30.0,
             backgroundImage: NetworkImage(
                 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpc9VXBng2yufswCRPCs1gTyL_sO_cm8N6yA&usqp=CAU'
             ),
           ),
           CircleAvatar(
             radius: 9.0,
             backgroundColor: Colors.white,
           ),
           Padding(
             padding: EdgeInsetsDirectional.only(
               bottom: 3.0,
               end: 3.0,
             ),
             child: CircleAvatar(
               radius: 7.0,
               backgroundColor: Colors.green,
             ),
           ),
         ],
       ),
       const SizedBox(
         height: 6.0,
       ),
       const Text(
           'Mohammed Ibrahim',
           maxLines: 2,
           overflow: TextOverflow.ellipsis
       ),

     ],
   ),
 );


  //يعني إيه context ؟؟
  // what is the meaning of context? سياااق
  // يعني إيه سيااق المكان الانا واقف فيه اتا فيين


}
