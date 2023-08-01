import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoping/screens/details_screen.dart';

class HomeScreen extends StatefulWidget {

   const HomeScreen({Key? key,}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool mode = true;
  final List<String> sportChoice = [
    'Running[13]', 'Soccer[1]', 'Golf[5]', 'Basketball[4]', 'Training[1]', 'Cycling[4]'];
  final List<Map<String, Object>> _colorsName = [
    {"name":"Red","color":Colors.red},
    {"name":"White","color":Colors.white},
    {"name":"Blue","color":Colors.blue},
    {"name":"Yellow","color":Colors.yellow},
    {"name":"Green","color":Colors.green},
    {"name":"Orange","color":Colors.orange},
  ]  ;

  final List<String> _choices = [
    'Cloths', 'Shoes', 'T Shirt', 'Choice 4', 'Choice 5',];
  String _selectedChoice = '';
  List<Map<String,Object>> imageList= [
    {"price":150,"image":"assets/images/b1.jpg","title":"PUMA Every day Hassle", "fav": false},
    {"price":140,"image":"assets/images/b2.jpg","title":"PUMA Every day Hassle", "fav": false},
    {"price":105,"image":"assets/images/b3.jpg","title":"PUMA Every day Hassle", "fav": false},
    {"price":95,"image":"assets/images/man8.jpg","title":"PUMA Every day Hassle", "fav": false},
    {"price":135,"image":"assets/images/man9.jpg","title":"PUMA Every day Hassle", "fav": false},
    {"price":120,"image":"assets/images/man10.jpg","title":"PUMA Every day Hassle", "fav": false},
    {"price":145,"image":"assets/images/man11.jpg","title":"PUMA Every day Hassle", "fav": false},
    {"price":105,"image":"assets/images/man12.jpg","title":"PUMA Every day Hassle", "fav": false},
    {"price":130,"image":"assets/images/man13.jpg","title":"PUMA Every day Hassle", "fav": false},
    {"price":125,"image":"assets/images/man14.jpg","title":"PUMA Every day Hassle", "fav": false},
  ];
   RangeValues values = const RangeValues(0, 500);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: mode? const Color.fromARGB(10, 10, 12, 45):Colors.black,
      body: SingleChildScrollView(
        physics:const BouncingScrollPhysics(),
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
             const SizedBox(height: 35,),
                                                            // Header Row
            Row(children: [
              Container(
                width: 50,
                height: 50,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border:mode? null:Border.all(color: Colors.white,width: 2),
                ) ,
                child: const CircleAvatar(
                  radius: 25,
                  backgroundImage:AssetImage("assets/images/z4.jpg",),
                ),
              ),
              const SizedBox(width: 10,),
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Hi James 👏",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:mode?Colors.black:Colors.white),),
                Text("Discover fashion  your style",style: TextStyle(fontSize: 14,color:mode?Colors.black:Colors.white),),
              ],),
              const Expanded(child: SizedBox()),
              InkWell(
                borderRadius: BorderRadius.circular(25),
                onTap: (){
                  setState(() {
                    mode = !mode;
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey,width: 2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child:  Center(child: Icon(FontAwesomeIcons.solidMoon,size: 25,color:mode?Colors.black:Colors.white),),
                ),
              ),
              const Expanded(child: SizedBox()),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                   border: Border.all(color: Colors.grey,width: 2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child:  Center(child: Icon(Icons.notifications,size: 25,color:mode?Colors.black:Colors.white),),
              )
            ],),
              const SizedBox(height: 20,width: double.infinity,),
                                                                                  // TextField Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: false,

                    style: TextStyle(color:mode?Colors.black:Colors.white),
                    cursorWidth: 1,
                    cursorHeight: 17,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding: const EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          )),
                      prefixIcon: const Icon(Icons.search,color: Colors.grey,)
                    ),
                  ),
                ),
                 const SizedBox(width: 10,),
                                                                     // filter button
                MaterialButton(
                  color:mode?Colors.black:Colors.white,
                  height: 50,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  minWidth: 0,

                  onPressed: (){
                    showModalBottomSheet(context: context,
                      backgroundColor: mode?Colors.white:Colors.black,
                      shape:  RoundedRectangleBorder(
                        side:mode?BorderSide.none:const BorderSide(color: Colors.white,width: 2),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20))),
                        builder: (_){
                          return StatefulBuilder(
                          builder: (BuildContext context, StateSetter setState) {
                            return SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 6,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              5),
                                          color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                     Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text("Filters", style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,color:mode?Colors.black:Colors.white),),
                                        Text("REST",style: TextStyle(color:mode?Colors.black:Colors.white),),
                                      ],
                                    ),
                                     Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Price Range",style: TextStyle(fontWeight: FontWeight.bold,color:mode?Colors.black:Colors.white),)),
                                                                                                 // slider
                                    Column(children: [
                                      RangeSlider(
                                        min: 0,
                                        max: 500,
                                        values: values,
                                        activeColor:mode?Colors.black87:Colors.white,
                                        inactiveColor:mode?Colors.black26:Colors.white54,
                                        labels: RangeLabels("\$ ${values.start.round()}", "\$ ${values.end.round()}"),
                                        divisions: 50,
                                        onChanged: (newValues) {
                                          setState(() {
                                            values = newValues;
                                          });
                                        },
                                      ),
                                       Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("\$ 0",style: TextStyle(color:mode?Colors.black:Colors.white),),
                                          Text("\$ 500",style: TextStyle(color:mode?Colors.black:Colors.white),),
                                        ],
                                      )
                                    ],),
                                    const SizedBox(height: 5,),
                                      Align(
                                       alignment: Alignment.topLeft,
                                         child: Text("Sports",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:mode?Colors.black:Colors.white),)),
                                    Builder(builder: (BuildContext context){
                                      return Wrap(
                                        spacing: 8,
                                        children: sportChoice.map((choice) {
                                          return ChoiceChip(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                                            backgroundColor:mode?Colors.white:Colors.black ,
                                            side: BorderSide(color: mode?Colors.black:Colors.white),
                                            selectedColor:mode?Colors.black:Colors.white, //selected bg color
                                            labelStyle: TextStyle(color:_selectedChoice==choice && mode?Colors.white:_selectedChoice!=choice&&!mode?Colors.white:Colors.black),
                                            label: Text(choice,),
                                            avatar: _selectedChoice == choice ?Container(
                                              width: 15,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black,width: 1),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ):null,
                                            selected: _selectedChoice == choice,
                                            onSelected: (selected) {
                                              setState(() {
                                                _selectedChoice = selected ? choice : '';
                                              });
                                            },
                                          );
                                        }).toList(),
                                      );
                                    }),
                                    // const SizedBox(height: 5,),
                                     Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Color",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:mode?Colors.black:Colors.white),)),
                                    Builder(builder: (BuildContext context) {
                                      return Wrap(
                                        spacing: 8,
                                        children: _colorsName.map((colorData) {
                                          String name = colorData['name'] as String;
                                          Color color = colorData['color'] as Color;
                                          return ChoiceChip(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                                            backgroundColor:mode?Colors.white:Colors.black ,
                                            side: BorderSide(color: mode?Colors.black:Colors.white),
                                            selectedColor:mode?Colors.black:Colors.white, //selected bg color
                                            labelStyle: TextStyle(color:_selectedChoice==name && mode?Colors.white:_selectedChoice!=name&&!mode?Colors.white:Colors.black),
                                            label: Text(name),
                                            avatar: Container(
                                              width: 15,
                                              height: 15,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black,width: 1),
                                                color: color,
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                            ),
                                            selected: _selectedChoice == name,
                                            onSelected: (selected) {
                                              setState(() {
                                                _selectedChoice = selected ? name : '';
                                              });
                                            },
                                          );
                                        }).toList(),
                                      );
                                    }),
                                    const SizedBox(height: 2.2,),
                                    InkWell(
                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color:mode?Colors.black:Colors.white,
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Padding(
                                          padding:  const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              const SizedBox(),
                                               Text("Apply Filter",style: TextStyle(color:mode?Colors.white:Colors.black,fontSize: 17,fontWeight: FontWeight.normal),),
                                             Container(
                                               width: 36,
                                               height: 36,
                                               decoration: BoxDecoration(
                                                   color:mode?Colors.white:Colors.black,
                                                 borderRadius: BorderRadius.circular(18),
                                               ),
                                               child:  Icon(Icons.arrow_forward_rounded,color:mode?Colors.black:Colors.white),
                                             )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                       );
                      }
                    );
                  },
                  child:  Icon(Icons.filter_list_rounded,color:mode?Colors.white:Colors.black,),
                )
              ],
            ),
            const SizedBox(height: 8,width: double.infinity,),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text('New Collections',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: mode?Colors.black:Colors.white),),
              Text('See All',style: TextStyle(color:mode?Colors.black:Colors.white),),
            ],),
            const SizedBox(height: 8,width: double.infinity,),
                                                                                             // three photos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width *0.45,
                    height: MediaQuery.of(context).size.height *0.25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/177.jpg"),fit: BoxFit.cover),
                      // color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration:  const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.grey,),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("\$130",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width *0.45,
                      height: MediaQuery.of(context).size.height *0.24/2,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/images/man8.jpg"),fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration:  const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.grey,),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("\$120",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width *0.45,
                  height: MediaQuery.of(context).size.height *0.01,
                ),
                Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width *0.45,
                      height: MediaQuery.of(context).size.height *0.24/2,
                      decoration: const BoxDecoration(
                       image: DecorationImage(image: AssetImage("assets/images/sh2.jpg"),fit: BoxFit.cover),
                       borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration:  const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.grey,),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("\$100",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                  ],
                ),
              ],)
            ],),
            const SizedBox(height: 8,width: double.infinity,),
                                                                        // choice chips
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection:Axis.horizontal ,
              child: Builder(builder: (BuildContext context){
                return Wrap(
                  spacing: 8,
                  children: _choices.map((String choice) {
                    return ChoiceChip(
                      backgroundColor:mode?Colors.white:Colors.black ,
                      side: BorderSide(color: mode?Colors.black:Colors.white),
                      selectedColor:mode?Colors.black:Colors.white, //selected bg color
                      labelStyle: TextStyle(color:_selectedChoice==choice && mode?Colors.white:_selectedChoice!=choice&&!mode?Colors.white:Colors.black),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                      // mode?Colors.white:Colors.black
                      label: Text(choice,),
                      avatar: _selectedChoice == choice ?Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 1),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ):null,
                      selected: _selectedChoice == choice,

                      onSelected: (selected) {
                        setState(() {
                          _selectedChoice = selected ? choice : '';
                        });
                      },
                    );
                  }).toList(),
                );
              }),
            ),
                                                                                 // masonry view
            MasonryView(
              listOfItem: imageList,
              numberOfColumn: 2,
              itemPadding: 6,
              itemBuilder: (item ) {
                int price = item['price'] ;
                String image = item['image'] as String;
                String title = item['title'];
                bool fav = item['fav'];
                return Stack(
                  children: [
                    Image.asset(
                      image  ,
                    ),

                    Align(
                      alignment:Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          padding: const EdgeInsets.all(5),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          color: Colors.white,
                          minWidth: 0,
                          onPressed: (){
                           setState(() {
                             item['fav']= !fav;
                           });
                          },
                          child: Icon(fav?FontAwesomeIcons.solidHeart:FontAwesomeIcons.heart),
                        ),
                      ),
                    ),
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width:90,
                          height:50,
                          child: Text(title,style:const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),maxLines:2 )),
                    ),
                    Positioned(
                      bottom:8,
                      left:8,
                      right:8,
                      child: Container(
                      height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children: [
                               Text("\$ $price",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              MaterialButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                minWidth:0,
                                padding:const EdgeInsets.symmetric(horizontal: 10),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(image: image,titleText: title, productPrice: price, darkMode: mode, favD: item['fav'], ),));
                                },
                                child: const Icon(Icons.add_shopping_cart_rounded,size: 20,),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            )
           ],
          ),
        ),
      ),
    );
  }
}
