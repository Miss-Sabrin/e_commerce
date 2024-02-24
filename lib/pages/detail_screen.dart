import 'package:e_commerce/pages/cart_detail.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/model/peoduct.dart';
import 'package:e_commerce/provider/cart_provider.dart';
import 'package:e_commerce/widgets/availble_size.dart';
import 'package:e_commerce/provider/cart_provider.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({super.key,required this.product});

  @override
  Widget build(BuildContext context) {

    final provider=CartProvider.of(context);


    return Scaffold(
      appBar: AppBar(
        
        title: Center(child: Text('Details')),),

        body: Column(
          children: [
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red.shade100),
                    child: Image.asset(product.image,
                    fit: BoxFit.cover,
                    
                    ),
                )
              ],
            ),
            SizedBox(height: 36,),
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.name.toUpperCase(),
                        style: TextStyle(fontSize: 26,
                        fontWeight: FontWeight.bold),
                        ),
              
                        Text(
                          '\$ ''${product.price}',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                       
                      ],
                    ),
                     const SizedBox(height: 14,),
                        Text(product.description,
                        
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 14),),
                        //todo sized call
                            SizedBox(height: 10,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                         Text('Availble size',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                         ),),


                          ],
                        ),
                        SizedBox(height: 10,),

                        Row(
                          children: [
                            AvailbleSize(size: "US 6",),
                            AvailbleSize(size: 'US 7',),
                            AvailbleSize(size: 'US 8',),
                            AvailbleSize(size: 'US 9',),
                            
                          ],
                        ),
                            SizedBox(height: 8,),
                            Row(
                              
                              children: [
                                      Text('Availble Colors',style: 
                                      TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 16
                                      ),),


                              ],
                            ),
                             SizedBox(height: 8,),

                            Row(
                              
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.blue,
                                ),
                                SizedBox(height: 8,),

                                 CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.red,
                                ),
                                  SizedBox(height: 8,),

                                 CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.amber,
                                )
                              ],
                            )

                  ],
                ),
              ),
            )
          ],
        ),

        bottomSheet: BottomAppBar(

          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height/10,
            decoration: BoxDecoration(
              color: Colors.red[900],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )
            ),
            child: Padding(
              
              padding: const EdgeInsets.all(8.0),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Text(
                    '\$' '${product.price}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: (){
                      provider.toggleProduct(product);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>CartDetail())
                      );
                    },
                    
                    
                    icon: const Icon(Icons.send),
                    
                      label:  Text('Add to Cart'),
                      
                      )
                ],
              ),
            ),
            
          ),
        ),
    );
    
  }
}