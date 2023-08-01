
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailsScreen extends StatefulWidget {
  final dynamic image;
  final String titleText;
  final int productPrice;
  final bool darkMode;
  final bool favD;

   const DetailsScreen({Key? key, required this.image, required this.titleText, required this.productPrice, required this.darkMode, required this.favD,}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  int total = 1;
  double rate = 3.0;
  String _selectedChoice = '';
  final List<String> _size = ['XS', 'S', 'M', 'L', 'XL','XXL','3XL'];

  @override
  Widget build(BuildContext context) {
        int totalPrice=widget.productPrice;
    return  Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(widget.image),fit: BoxFit.cover)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Row(children: [
                     InkWell(
                       onTap: (){
                         Navigator.pop(context);
                       },
                       child: Container(
                         width: 50,
                         height: 50,
                         decoration: BoxDecoration(
                           border: Border.all(color: Colors.white,width: 2),
                           borderRadius: BorderRadius.circular(25),
                         ),
                         child: const Center(child: Icon(Icons.arrow_back_rounded,size: 25,color: Colors.white,),),
                       ),
                     ),
                     const SizedBox(),
                   ],
                   ),
                   Row(children: [
                     Container(
                       width: 50,
                       height: 50,
                       decoration: BoxDecoration(
                         border: Border.all(color: Colors.white,width: 2),
                         borderRadius: BorderRadius.circular(25),
                       ),
                       child:  Center(child: Icon(widget.favD?FontAwesomeIcons.solidHeart:FontAwesomeIcons.heart,size: 25,color: Colors.white,),),
                     ),
                     const SizedBox(width:6,),
                     Container(
                       width: 50,
                       height: 50,
                       decoration: BoxDecoration(
                         border: Border.all(color: Colors.white,width: 2),
                         borderRadius: BorderRadius.circular(25),
                       ),
                       child: const Center(child: Icon(Icons.add_shopping_cart_rounded,size: 25,color: Colors.white,),),
                     ),
                   ],)
                  ],
                ),
              ),
              //
             SizedBox(
                    height: 600,
                    width: MediaQuery.of(context).size.width * 0.9,
                child: SingleChildScrollView(
                   child: Column(
                            children: [
                              Container(
                                height: 500,
                              ),
                            Container(
                              height: 380,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration:   BoxDecoration(
                                  color: widget.darkMode?Colors.white:Colors.black,
                                  borderRadius: const BorderRadius.all(Radius.circular(30))
                              ),
                              child:  Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    const Icon(Icons.keyboard_arrow_up_rounded,color: Colors.grey),
                                    const SizedBox(height: 7,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(widget.titleText,style:  TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color:  widget.darkMode?Colors.black:Colors.white), ),
                                      ],
                                    ),
                                    const SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                      Column(
                                        children: [
                                          RatingBar.builder(
                                            itemSize: 20,
                                            initialRating: 3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            unratedColor:Colors.grey ,
                                            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                            itemBuilder: (context, _) => const Icon(
                                              Icons.star,
                                              color: Colors.amber,

                                              ),
                                            onRatingUpdate: (rating) {
                                               setState(() {
                                                   rate = rating;
                                               });
                                            },
                                          ),
                                          Text('$rate (250k reviews)',style:  TextStyle(fontSize: 16,color:  widget.darkMode?Colors.black:Colors.white),),
                                        ],
                                      ),
                                        Container(
                                          width: 140,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color:  widget.darkMode?Colors.black:Colors.white,
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                MaterialButton(
                                                  color:Colors.grey,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                  minWidth: 0,
                                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                                  onPressed: (){
                                                    setState(() {
                                                      if(total<=1){
                                                        total = 1;
                                                      }else{
                                                        total = total-1;
                                                      }
                                                    });
                                                  },
                                                  child: const Icon(FontAwesomeIcons.minus,),
                                                ),
                                                Text('$total' ,style:  TextStyle(color:  widget.darkMode?Colors.white:Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                                MaterialButton(
                                                  color:  widget.darkMode?Colors.white:Colors.black,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                  minWidth: 0,
                                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                                  onPressed: (){
                                                    setState(() {
                                                      total = total+1;
                                                    });
                                                  },
                                                  child:  Icon(Icons.add,color:  widget.darkMode?Colors.black:Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 15,),
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("MODEL IS 6'1'',SIZE M",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color:  widget.darkMode?Colors.black:Colors.white),),
                                        Text("Size guide",style: TextStyle(color:  widget.darkMode?Colors.black:Colors.white),),
                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Builder(builder: (BuildContext context) {
                                      return Wrap(
                                        spacing: 8,
                                        children: _size.map((sizeGuide) {
                                          return ChoiceChip(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                                            backgroundColor:widget.darkMode?Colors.white:Colors.black ,
                                            side: BorderSide(color: widget.darkMode?Colors.black:Colors.white),
                                            selectedColor:widget.darkMode?Colors.black:Colors.white, //selected bg color
                                            labelStyle: TextStyle(color:_selectedChoice==sizeGuide && widget.darkMode?Colors.white:_selectedChoice!=sizeGuide&&!widget.darkMode?Colors.white:Colors.black),
                                            label: Text(sizeGuide),
                                            avatar: _selectedChoice == sizeGuide ?Container(
                                              width: 15,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black,width: 1),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ):null,
                                            selected: _selectedChoice == sizeGuide,
                                            onSelected: (selected) {
                                              setState(() {
                                                _selectedChoice = selected ? sizeGuide : '';
                                              });
                                            },
                                          );
                                        }).toList(),
                                      );
                                    }),
                                    const SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text('Total',style: TextStyle(color:  widget.darkMode?Colors.black:Colors.white),),
                                            Text('\$ ${total*totalPrice}',style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color:  widget.darkMode?Colors.black:Colors.white),),
                                          ],
                                        ),
                                        Container(
                                          width: 160,
                                          height: 60,
                                          decoration: BoxDecoration(
                                              color:  widget.darkMode?Colors.black:Colors.white,
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Text('Add to cart' ,style: TextStyle(color:  widget.darkMode?Colors.white:Colors.black,fontSize: 17,fontWeight: FontWeight.bold),),
                                                MaterialButton(
                                                  color:  widget.darkMode?Colors.white:Colors.black,
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                  minWidth: 0,
                                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                                  onPressed: (){
                                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                      backgroundColor: Colors.grey,
                                                      duration: Duration(seconds: 3),
                                                      showCloseIcon: true,
                                                        content: Text("Thank you")));
                                                  },
                                                  child:  Icon(Icons.arrow_forward_rounded,color:  widget.darkMode?Colors.black:Colors.white,),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                             SizedBox(
                               width: 200,
                               height:MediaQuery.of(context).size.width * 0.05 ,
                             ),
                           ],
                       ),
                    ),
                  ),
                ],
          ),
        ),
      ),
    );
  }
}
