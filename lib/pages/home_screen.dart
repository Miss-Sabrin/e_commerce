import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/pages/detail_screen.dart';
import 'package:e_commerce/widgets/peoduct_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected=0;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Our Product',style: TextStyle(fontSize: 27),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCategory(index: 0,name: 'all product'),
              _buildProductCategory(index: 1,name: 'jackets'),
               _buildProductCategory(index: 2,name: 'sneakers'),




            ],
          ),
         ///todo .....?
         SizedBox(height: 15,),
         Expanded(child:
            isSelected ==0
          ? _buildAllProduct()
           : isSelected==1
           ?_buildJackets()

           :_buildSneakrs()

           

         
         ),

         
         
         

         

         
        ],
      ),
    );
      
    
  }


  _buildProductCategory({required int index,required String name})=>
  GestureDetector(
    onTap: () => setState(() {
      isSelected=index;
    }),
    child: Container(
      height: 40,
      width: 100,
      margin: const EdgeInsets.only(top: 10 ,right: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
  
        color:isSelected==index? Colors.red:Colors.red.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(name,style: TextStyle(color: Colors.white),),
    ),
  );

  
///todo  all products
///


_buildAllProduct()=>


GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: (100/140),
    crossAxisSpacing: 12,
    mainAxisSpacing: 12,
  ),
  scrollDirection: Axis.vertical,
  itemCount: MyProdducts.allProduct.length,
  itemBuilder: ( context,  index) {
    final allProduct=MyProdducts.allProduct[index];
    return GestureDetector(
      //todo mesha detail page laka wacay
      onTap:()=> Navigator.push(context, MaterialPageRoute(
        builder: (context)=>DetailScreen(product: allProduct,))),
        child: ProductCard(product: allProduct));
        
      
     // child: ProductCard(product:allProduct));
  },
);

///todo build jackets
//
_buildJackets()=>GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: (100/140),
    crossAxisSpacing: 12,
    mainAxisSpacing: 12
  ),
  scrollDirection: Axis.vertical,
  itemCount: MyProdducts.jacketList.length,
  itemBuilder: ( context,  index) {
    final jacketsList=MyProdducts.jacketList[index];
    return
     GestureDetector(

      //todo mesha detail page laka wacay
      onTap:()=> Navigator.push(context, MaterialPageRoute(
        builder: (context)=>DetailScreen(product: jacketsList,))),
  
      
      
       child: ProductCard(product: jacketsList)) ;
  },
);

//todo sneakres type

_buildSneakrs()=>GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: (100/140),
    crossAxisSpacing: 12,
    mainAxisSpacing: 12
  ),
  scrollDirection: Axis.vertical,
  itemCount: MyProdducts.sneakerList.length,
  itemBuilder: ( context,  index) {
    final sneakersList=MyProdducts.sneakerList[index];
    return GestureDetector(
      
      //todo mesha detail page laka wacay
      onTap:()=> Navigator.push(context, MaterialPageRoute(
        builder: (context)=>DetailScreen(product: sneakersList,))),
  
      child: ProductCard(product: sneakersList)) ;
  },
);





}
