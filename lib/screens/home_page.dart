import 'package:flutter/material.dart';
import 'package:number_estimation/RandomNumber.dart';
import 'package:number_estimation/components/card.dart';
import 'package:number_estimation/components/custom_dialog.dart';
import 'package:number_estimation/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
var tahmin = "-1";
int counter = 0;
  TextEditingController _controller = TextEditingController();

RandomNumber rn = RandomNumber();

@override
  void initState() {
    super.initState();
	rn.randomizer();
  }
	void karsilastir(){
    
    setState(() {     
    });

    var intTahmin = int.parse(this.tahmin);
		print(intTahmin.toString());
    if(intTahmin.toString()=="-1"){
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => new CustomDialog("Sayı Girilmedi.\n Lütfen Sayi Giriniz",closeDialog,"Tamam",FontAwesomeIcons.dizzy));
    }
    else{    
   print(rn.number.toString());
      print(intTahmin.toString());

  // if(intTahmin<rn.number && intTahmin>0){
      //   Fluttertoast.showToast(
      //     msg: "Yukarı",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.TOP,
      //     timeInSecForIos: 1,
      //     backgroundColor: Colors.red,
      //     textColor: kToastMessageTextColor,
      //     fontSize: 16.0
      //   );
      // }
      // if(intTahmin>rn.number && intTahmin<=100){
      //   Fluttertoast.showToast(
      //     msg: "Aşağı",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.TOP,
      //     timeInSecForIos: 1,
      //     backgroundColor: Colors.red,
      //     textColor: kToastMessageTextColor,
      //     fontSize: 16.0  
      //   );
      // }

      if(intTahmin > 100){
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => new CustomDialog( "Lütfen 0 ile 100 arasında bir değer giriniz.", closeDialog, "Kapat",FontAwesomeIcons.exclamation));
      }
      else{
        if(counter<10)
        {
          setState(() {
            counter++;
          });
        if(rn.number == int.parse(this.tahmin)){
          print("dogru "+counter.toString()+". tahmininde bildin!!");

          showDialog(context: context,
            builder: (_) => new CustomDialog( ""+this.counter.toString()+". denemede buldunuz. \nYeniden başlamak için Sıfırla butonuna tıklayın!", resetGame, "Sıfırla",FontAwesomeIcons.check));
        }
          else{        
          print("yanlış");
          }
        }
      else{
        print("Kaybettin");
        showDialog(
          barrierDismissible: false,
          context: context,
            builder: (_) => new CustomDialog("\nTutulan Sayı--> "+ rn.number.toString()+" \nYeniden başlamak için Sıfırla butonuna tıklayın!", resetGame, "Sıfırla",FontAwesomeIcons.sadTear));
        }	
      }
      
      this.tahmin = "-1";

    }
    
	} 
	
  void resetGame(){
		if(Navigator.canPop(context)) Navigator.pop(context);
    setState(() {     
		  rn.randomizer();
		  counter=0;
		  tahmin="";
		});
	}
  void closeDialog(){
    if(Navigator.canPop(context)) Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {   
    return Scaffold( 
      appBar: AppBar(
        title: Text('Number Estimation'),
      ),
      body: SingleChildScrollView(
				child: Column(
		  	crossAxisAlignment: CrossAxisAlignment.stretch,
        	children: <Widget>[
						Container(
							margin: EdgeInsets.only(top:30.0),
							height: 200.0,
							child: CircleAvatar(                                        
                		  radius: 70.0,
						         	backgroundColor: Colors.white,					
						        	child: Text(
												this.counter.toString(),
												style: kCircleAvatarText
												),
             					), 
			  	),
					ReusableCard(
							color : kCardColor, 
							cardChild: Row(
								children: <Widget>[
									Expanded(
										flex:3,
										child:TextFormField(
                      controller: _controller,
  														onChanged: (text) { 
                                this.tahmin = text;                          														
														},								
                            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
														keyboardType: TextInputType.number,
                            
														decoration: InputDecoration(
																					hintText: "Sayi giriniz",
																					),
													),
									),
									Expanded(
										flex:1,
										child: IconButton(
												icon: Icon(FontAwesomeIcons.angleDoubleRight),
                        // Icon(Icons.send,color: Colors.greenAccent),
												iconSize: 40.0,
												onPressed: (){                       
													this.karsilastir();
                          _controller.clear();
												},
											),
										
									)
							],)
						),
						Container(
							margin: EdgeInsets.all(15.0),
							child: RaisedButton(               
								child: new Text(                
									"Reset",
									style: kResetButtonText,
								),
								color: Colors.deepPurpleAccent,
								padding: const EdgeInsets.all(20.0),
								onPressed: resetGame,
							),
							)
						
        ],
      ),
				)
			 
    );
  }

}