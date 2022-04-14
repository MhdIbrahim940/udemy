
 import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:udemyapps/modules/web_view/web_view_screen.dart';
import 'package:udemyapps/shared/cubit/cubit.dart';



//.................................................................................................................................................................................................
//.................................................................................................................................................................................................

  Widget defaultButton({

    Color background = Colors.blue,
    double width = double.infinity,
    bool isUpperCase = true,
    required String text,
    required Function function,
    double radius = 10.0,
 }) =>
      Container(
         width: width,
         height: 40.0,
        child: MaterialButton(
          onPressed:  function(),
          child:  Text (
            isUpperCase ? text.toUpperCase() : text,
            style: const TextStyle(
            color: Colors.white,
            ),
          ),
        ),
          decoration : BoxDecoration (
            borderRadius: BorderRadius.circular(radius,),
            color : background,
          ),
      );


 //.................................................................................................................................................................................................
 // .................................................................................................................................................................................................


 Widget defaultFormField(
 {
   required BuildContext  context,
   required TextEditingController controller,
   required TextInputType type,
    onSubmit,
    onChange,
    onTap,
    bool isPassword = false,
    validate,
   required String  lable,
   hintText,
    //String? hintText,
   required IconData prefix,
    IconData? suffix,
    Function? suffixPressed,
    bool isClickable = true,

 }) =>
      TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        validator: validate,

       decoration:  InputDecoration(
         labelText:  '$lable',
         labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
           fontSize: 18
         ),
         hintText: hintText,
         hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
           fontSize: 14),

         prefixIcon: Icon(
         prefix,
          ),

        suffixIcon: suffix != null ? IconButton(
            onPressed: (){
              suffixPressed!();
            },
             icon: Icon (suffix,
             ),
          //tooltip: ,
        )
            : null,
        border: OutlineInputBorder(),
         

       ),
  );


 //.................................................................................................................................................................................................
 //.................................................................................................................................................................................................


 Widget buildTaskItem(Map model , context) => Dismissible(
    key: Key(model['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [

          CircleAvatar(
            radius: 40.0,
            backgroundColor: Colors.lightBlue,
            child: Text('${model['time']}',
            style: TextStyle (
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),),
          ),
       SizedBox(
            width: 20.0,
          ),
       Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model['title']}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox( height: 5,),
                Text(
                  '${model['date']}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(
            width: 20.0,
          ),

       IconButton(
         onPressed: ()
         {
           AppCubit.get(context).updateData(status: 'done', id: model['id'],);
         },
         icon: const Icon(
         Icons.check_box,
         color: Colors.green,
       ),
       ),
       IconButton(
         onPressed: ()
         {
           AppCubit.get(context).updateData(status: 'archive', id: model['id'],);
         },
         icon: const Icon(
         Icons.archive,
         color: Colors.black45,
       ),
       ),

        ],
      ),
    ),
    onDismissed: (direction){
      AppCubit.get(context).deleteData(id: model['id'], );
    },
  );


 //.................................................................................................................................................................................................
 //.................................................................................................................................................................................................


 Widget buildEmptyScreen ()
  {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  const [
         Icon (
           Icons.menu,
           size: 100,
           color: Colors.grey,
         ),
          Text (
            'No Task Yet,Please Add Some Tasks',
            style:  TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }


 //.................................................................................................................................................................................................
 //.................................................................................................................................................................................................


 void NavigatTo(context , widget) => Navigator.push
    (context,
      MaterialPageRoute ( builder: (context) => widget,  ),
  );


 //.................................................................................................................................................................................................
 //.................................................................................................................................................................................................


 Widget buildArticleItem (article, context) => InkWell (
    onTap: (){
        NavigatTo( context , WebViewScreen(article ['url']),);
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
          children:[
            if( article['urlToImage'] != null)
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image : DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(   // child:  Container(  height: 120.0,   child: Expanded(
              child:  Container(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),

                    const SizedBox(
                      height: 10.0,
                    ),

                    Text('${article['publishedAt']}',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),)
                  ],
                ),
              ),
            ),
          ]
      ),
    ),
  );


 //.................................................................................................................................................................................................
 //.................................................................................................................................................................................................


 Widget myDivider() => Padding(
   padding: const EdgeInsetsDirectional.only(
   start: 20.0,
   ),
   child: Container (
     width: double.infinity,
     height: 1,
     color: Colors.grey,
   ),
 );


 //.................................................................................................................................................................................................
 //.................................................................................................................................................................................................


 Widget articleBuilder (List, context, {isSearch = false}) =>
     ConditionalBuilder (
        condition:  List.length >0 ,                           //state is! NewsGetBusinessLoadingState ,
        builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context,index) => buildArticleItem(List[index],context),
        separatorBuilder: (context,state) => myDivider(),
        itemCount: List.length,
        ),
        fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()) ,
 );


