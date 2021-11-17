import 'package:flutter/material.dart';

void main() {
  runApp( const MaterialApp(
    home: MyTextField(),  //MyTextField es el nombre de nuestro satateful widget
  )
  );
}

//este es un stateful widget que nos permite manejar estados
//en el interior de nuestro widget


class MyTextField extends StatefulWidget {
  const ({ Key? key }) : super(key: key);
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  String inputValue="";
  //declaramos un controler
  final TextEditingController controller = TextEditingController();
 void onSubmitted(String value){
   setState((){ //metodo para stafulwidget
       inputValue= inputValue + "\n" + value;
       controller.text="";
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(   //esto modifica la parte superior de la pantalla 
        title: const Text("EditText widget"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Center(     //body es donde se modifica el resto de la pantalla, es lo que se muestra en el centro
             child: Column(
             children: <Widget>[
             TextField(
             //esta propiedad nos permite poner un placeholder, que es el texto que va 
             //dentro de un campo de texto donde se va ingresar contenido
             decoration:const InputDecoration(hintText: "Ingrese el texto aquí")
             //el onsubmitted es el evento que sigue cuando termina de ingresar el input 
             //value es el valor o lo que ingresamos desde textfield
             // el onchange es cuando ingresamos el texto
             onSubmitted:(String value) {onSubmitted(value);},
             //despues declaramos la funcion al ppio
             //la funcion controler es para que el text field sepa que hay un controlador observa los cambios 
             //nos sirve para limpiar el texto
             controller: controller,
           )
           Text (inputValue),
         ],
        )
       ),
      );
    
  }
}