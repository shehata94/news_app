import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/modules/webview/webView_screen.dart';

Widget defaultButton(
        {double width = double.infinity, Color color = Colors.blue, @required String label, Color textColor = Colors.white, Function onPressed}) =>
    Container(
      width: width,
      color: color,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: textColor),
        ),
      ),
    );

Widget defaultTextForm({
  @required TextEditingController controller,
  @required TextInputType inputType,
  @required IconData prefix,
  bool isPassword = false,
  IconData suffix,
  @required String label,
  ValueChanged<String> onSubmit,
  Function validate,
  Function suffixPressed,
  Function onTap,
  Function onChange
}) =>
    TextFormField(
      obscureText: isPassword,
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(
                  suffix,
                ),
                onPressed: suffixPressed,
              )
            : null,
        labelText: label,
      ),
      onFieldSubmitted: onSubmit,
      validator: validate,
      onTap: onTap,
      onChanged: onChange,
    );

Widget taskList(Map task) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            child: Text(task['time']),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task['name'],
                style: TextStyle(fontSize: 20),
              ),
              Text(
                task['date'],
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );

Widget businessItem (dynamic article,context) {
  String date = article['publishedAt'].toString();
  DateTime parseDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(date);
  var inputDate = DateTime.parse(parseDate.toString());
  var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
  var outputDate = outputFormat.format(inputDate);
  return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: (){
         navigateTo(context, WebViewScreen(article['url']));
        },
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        article['urlToImage'] ?? 'https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg')),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style:Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      outputDate,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );}

Widget separator() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 1,
        color: Colors.grey,
      ),
    );

Widget newsBuilder(list,context) => list.length > 0
    ? ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => businessItem(list[index],context),
        separatorBuilder: (context, index) => separator(),
        itemCount: list.length,
      )
    : Center(
        child: CircularProgressIndicator(),
      );


void navigateTo(context, screen)
{
  Navigator.push(
      context,
      MaterialPageRoute(builder:(context) => screen));
}

void navigateAndReplace(context, screen)
{
 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>screen), (route) => false);
}