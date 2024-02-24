import 'package:e_commerce/provider/favrite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider=FavoriteProvider.of(context);
    final finalList=provider.favorite;
    return Scaffold(
      body: 
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 20),
            child: Row(
              children: [
                Text('Favrites',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold
                ),),
                
              ],
            ),
          ),

          Expanded(child: 
          ListView.builder(
            itemCount: finalList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(padding: 
              EdgeInsets.all(8),
//todo slidable animation was deleted product code..! 🤟🏽
              child: Slidable(
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(onPressed: (context){
                      finalList.removeAt(index);
                      setState(() {
                        
                      });

                      
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'delete',
                    )
                  ],
                ),
                child: ListTile(
                  title: Text(finalList[index].name,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(finalList[index].description,
                  overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(
                    radius: 30,
              
                    backgroundImage: AssetImage(finalList[index].image),
                    backgroundColor: Colors.red.shade100,
                  ),
                  trailing: Text( '\$' '${finalList[index].price}',
                  style: TextStyle(fontSize: 20,
                  
                  fontWeight: FontWeight.bold),),
              
                  tileColor: Colors.white,
                ),
              ),
              ) ;
            },
          ),
          )
        ],
      ),
    );
  }
}