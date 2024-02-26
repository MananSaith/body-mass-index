import 'package:flutter/material.dart';

class BodyMassIndex extends StatefulWidget {
  const BodyMassIndex({super.key});

  @override
  State<BodyMassIndex> createState() => _BodyMassIndexState();
}

class _BodyMassIndexState extends State<BodyMassIndex>{

  var message="READY ...";
  var bmiResult="BMI Result calculation will display here";
  var weight =TextEditingController();
  var height =TextEditingController();

  double bMI=0;

  int weightInt=0;
  double heightDouble=0;
  void fun(){
   setState(() {
      try{
if(weight.text.isEmpty || height.text.isEmpty){

        if(weight.text.isEmpty && height.text.isNotEmpty){
          message="OOPS ...";
             bmiResult="provide Weight !!!!!!!!";
        } 
        else if( weight.text.isNotEmpty && height.text.isEmpty){
          message="OOPS ...";
           bmiResult="provide Height !!!!!!!!";
        }
        else{
          message="OOPS ...";
          bmiResult="provide Weight and Height !!!!!!!!";
        }
       
    }
    else{
         weightInt=int.parse(weight.text);

         heightDouble=double.parse(height.text);

         if(heightDouble%1==0){
          //it will convert the feet into meter
             heightDouble=heightDouble*0.3048;
             //heightDouble=heightDouble!*heightDouble!;
         }
         else{

          List<String> heightseprate= height.text.split('.');
          heightDouble=(int.parse(heightseprate[0])*0.3048)+(int.parse(heightseprate[1])*0.0254);

         }

/*
Underweight: BMI less than 18.5
Normal weight: BMI 18.5 to 24.9
Overweight: BMI 25 to 29.9
Obesity: BMI 30 or greater
 */
          bMI= weightInt/(heightDouble*heightDouble);

          if(bMI<18.5){
               message="Under Weight";
               bmiResult="Your BMI Rate Is ${bMI.toStringAsFixed(1)}";
          }
          else if(bMI>=18.5 && bMI<=24.9){
            message="Healthy";
            bmiResult="Your BMI Rate Is ${bMI.toStringAsFixed(1)}";
          }
          else if(bMI>=25 && bMI<=29.9){
            message="Over Weight";
            bmiResult="Your BMI Rate Is ${bMI.toStringAsFixed(1)}";
          }
          else{
            message="Obesity";
            bmiResult="Your BMI Rate Is ${bMI.toStringAsFixed(1)}";
          }
         

    }
    
    }
    catch(e){
        message="invalid operation";
    }
      
   
     
   
   });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 170, 158),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 170, 158),
        centerTitle: true,
        title: const Text(
          "Body Mass Index",
          style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255)),
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [

            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(message , style:const  TextStyle(
                fontSize: 50,fontWeight: FontWeight.bold,
                fontFamily:AutofillHints.nickname
              
                )),
            ),
          Text(bmiResult,style:const  TextStyle(
                fontSize: 18,fontWeight: FontWeight.w500,
                fontFamily:AutofillHints.nickname
          )),
           const  SizedBox(height: 25,),
           Padding(
             padding: const EdgeInsets.only(left: 20,right: 30),
             child: TextField(
              controller: weight,
                keyboardType: const TextInputType.numberWithOptions(),
                showCursor: true,
                style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                decoration: const InputDecoration(
                  hintText: "Weight in kiloGram",
                  prefixIcon: Icon(Icons.boy_outlined) ,
                  filled: true,
                  fillColor:  Color.fromARGB(216, 255, 255, 255),
                  border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black)
                      ),
                  ),
              ),
           ),
            const  SizedBox(height: 15,),
              
                
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 30),
                  child: TextField(
                  controller: height,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  showCursor: true,
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    hintText: "Height in feet and inch like \"5.4\"",
                     prefixIcon: Icon(Icons.height) ,
                    filled: true,
                    fillColor:  Color.fromARGB(216, 255, 255, 255),

                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black)
                    ),
                    ),
                              ),
                ),
              
            const  SizedBox(height: 40,),


            SizedBox(
              width: 190,
              height: 57,
              child: ElevatedButton(
                onPressed:fun, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white
                ),
                child:const Text(
                  "CONVERT", style: TextStyle(fontSize: 28,color: Colors.black,fontWeight: FontWeight.w800)),
                  
                  ),
            ),
            
            ],

        )
        
        ),
    );
  }
}