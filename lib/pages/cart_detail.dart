import 'package:e_commerce/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartDetail extends StatefulWidget {
  const CartDetail({super.key});

  @override
  State<CartDetail> createState() => _CartDetailState();
}

class _CartDetailState extends State<CartDetail> {
  @override
  Widget build(BuildContext context) {
    final provider=CartProvider.of(context);

    final finlList=provider.cart;
    _buildProductCategory(IconData icon, int index){


      return GestureDetector(
        onTap: () {
          setState(() {
            icon==Icons.add
            ?provider.incrementQunatity(index)
            :provider.decrementQunatity(index); 
          });
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red.shade100
          ),
          child:Icon(
            icon,
            size: 20,
          ) ,
      
        ),
      );
    }
    
    
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: 
          ListView.builder(
            itemCount: finlList.length,
            itemBuilder: ( context,  index) {
              return Padding(padding: EdgeInsets.all(8),
               child: Slidable(
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(onPressed: (context){
                      finlList[index].quantity=1;
                      finlList.removeAt(index);
                      setState(() {
                        
                      });
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                    )

                ]),
                 child: ListTile(
                    title: Text(finlList[index].name,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(finlList[index].price.toString() ,
                    overflow: TextOverflow.ellipsis,
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                             
                      backgroundImage: AssetImage(finlList[index].image),
                      backgroundColor: Colors.red.shade100,
                    ),
                    trailing: Column(
                      children: [
                        _buildProductCategory(Icons.add, index),
                        Text( finlList[index].quantity.toString(),
                        style: TextStyle(fontSize: 14,
                        
                        fontWeight: FontWeight.bold),),
                        _buildProductCategory(Icons.remove, index)
                      ],
                    ),
                             
                    tileColor: Colors.white,
                  ),
               ),
             
              );
            },
          ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )
            ),
            child: 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${provider.getTotalPrice()}',
                style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold),
                ),
                ElevatedButton.icon(
                  onPressed: (){},
                   icon: Icon(Icons.send),
                    label: Text('check out'))

              ],
            ),
          )
        ],
      ),
    );
  }
}