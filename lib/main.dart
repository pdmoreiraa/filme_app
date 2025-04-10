
import 'package:filme_app/filmeClass.dart';
import 'package:flutter/material.dart';
//import para usar o Random
import 'dart:math';
//import para usar o json
import 'dart:convert';
import 'package:flutter/services.dart';

void main() {
  runApp( const MaterialApp (title: "AppFilmes",
      home: MainApp(),));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});


  @override
  MainAPP createState() => MainAPP();
}

class MainAPP extends State<MainApp> {
 // ignore: unused_field
bool mostrarFilme = false;
List<Filmes> filmes=List.empty();                                      
Filmes filmeSorteado  = Filmes();
int total = 0;
 Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/filmes.json');
     Iterable data = await json.decode(response);
    filmes =  List<Filmes>.from(data.map((model)=> Filmes.fromJson(model)));
    total = filmes.length;
    setState(() {
      filmes;
      total;
    });
  }


sorteiaFilme()
{
  var r = Random();
  var index = r.nextInt(filmes.length);
   filmeSorteado =  filmes[index];
   mostrarFilme = true;
  setState(() {
   filmeSorteado;
   mostrarFilme;}
  );

}


  @override
   initState()  {
    super.initState();
       readJson();
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body:  Center(
          child:Padding(padding:const EdgeInsets.fromLTRB(25, 30, 25 , 30) ,
          child:Column(mainAxisSize: MainAxisSize.max,
           //Alinha no centro da página - vertical - , 
           //com distribuição uniforme
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children:<Widget>[ 
             Text('Sorteie um dos $total filmes!', style: const TextStyle(color: Color.fromRGBO(73, 36, 62, 1), fontSize: 40, fontStyle: FontStyle.italic),),
            
            
            ElevatedButton(onPressed:sorteiaFilme,style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(187,132 , 147, 1),
                fixedSize: const Size(250, 75)), child: const Text("Sorteio!!!",
                style: TextStyle(color: Color.fromRGBO(73, 36, 62, 1),
                fontSize:30,
                fontWeight: FontWeight.bold
                ),
                ),
                ),
           Visibility(
  visible: mostrarFilme,
  child:Expanded(child: Column( 
  
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,mainAxisSize: MainAxisSize.max,
    children: <Widget>[
            Text(filmeSorteado.title,
                style: const TextStyle(color: Color.fromRGBO(112, 66, 100, 1), 
                                  fontSize:30, 
                                  fontWeight: FontWeight.w600),),
            Text(filmeSorteado.year,
                style: const TextStyle(color: Color.fromRGBO(112, 66, 100, 1), 
                                  fontSize:25, 
                                  fontWeight: FontWeight.w500),),
            Text(filmeSorteado.released,
                style: const TextStyle(color: Color.fromRGBO(112, 66, 100, 1), 
                                  fontSize:25, 
                                  fontWeight: FontWeight.w500),),
            Text(filmeSorteado.runtime,
                style: const TextStyle(color: Color.fromRGBO(112, 66, 100, 1), 
                                  fontSize:25, 
                                  fontWeight: FontWeight.w400),),
            Text(filmeSorteado.genre,
                style: const TextStyle(color: Color.fromRGBO(112, 66, 100, 1), 
                                  fontSize:25, 
                                  fontWeight: FontWeight.w400),),
            Text(filmeSorteado.director,
                style: const TextStyle(color: Color.fromRGBO(112, 66, 100, 1), 
                                  fontSize:25, 
                                  fontWeight: FontWeight.w400),),
            Text(filmeSorteado.actors,
                style: const TextStyle(color: Color.fromRGBO(112, 66, 100, 1), 
                                  fontSize:25, 
                                  fontWeight: FontWeight.w400),),
            Text(filmeSorteado.writer,
                style: const TextStyle(color: Color.fromRGBO(112, 66, 100, 1), 
                                  fontSize:25, 
                                  fontWeight: FontWeight.w400),),
            Text(filmeSorteado.plot,
                style: const TextStyle(color: Color.fromRGBO(112, 66, 100, 1), 
                                  fontSize:25, 
                                  fontWeight: FontWeight.w400),),
           /* ElevatedButton(onPressed: () => _abreSpotify(filmeSorteado.title),
                    style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(219,175 , 160, 1),
                    fixedSize: const Size(275, 75)), 
                 child: const Text('Ouvir no Spotify!', 
                 style: TextStyle(color: Color.fromRGBO(73, 36, 62, 1),
                  fontSize:25,fontWeight: FontWeight.bold)), )*/
           ])))

        ]
          )),
      ),
    ));
  }
}

