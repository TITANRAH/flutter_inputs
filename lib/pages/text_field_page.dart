import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inputs/utils/capitalize_input_format.dart';
import '../models/country.dart';
import '../constants/countries.dart';

// Pasos para usar modelos en mapa o lista forma 1 iterando con for

// 1 Tengo un json ya sea escrito o ya sea como respuesta
// 2 lo importo para su uso, esto equivale a un controller haciendo una peticion http
// y onbjetiendo una respuesta, podria ser alli o aqui
// 3 creo mi modelo como se creo para hacer match con el mapa json
// 4 traigo el json creado en este caso, importo y escribo en cualquier parte el nombre
// del mapa creado con el json, import '../constants/countries.dart'; nombre del mapa countries
// 5 llamo a init state para pintar a penas se habra el componente
// 6 creo una lista vacia de tipo Country, el modelo creado
// 7 recorro con un for las countries y hago un add a la lista vacia por cada elemento,
// llamando a Country.fromJson (factory realizada en el modelo que permite
// devolver una instancia de Coutry) y pasandole el elemento recorrido
// cuando tengo la lista llena digo que la lista privada _countries sea igual
// a countriesList

// forma 2 iterando con map

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final _textEditingController = TextEditingController();
  late final List<Country> _countries;
  // String _query = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // final List<Country> countriesList = [];

    // for (final e in countries) {
    //   countriesList.add(
    //     Country.fromJson(e),
    //   );
    // }

    // _countries = countriesList;

    // otra forma de hacer lo mismo pero iterando con map
    // debo pasarle el tipado de Country del modelo y llamar a country fromjson

    _countries = countries.map<Country>((e) => Country.fromJson(e)).toList();

    // con esto escucho cada vez que escriba algo en textfield
    // _textEditingController.addListener(
    //   () {
    //     print('editingcongroller');
    //   },
    // );

    _textEditingController.text = 'Ch';
  }

  // SIEMPRE HAY QUE LIBERAR LOS RECURSOS QUE CONSUME TEXTEDITING CONTROLLER
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _textEditingController.text;
    late final List<Country> filteredList;

    // 6 CAMBIE LO DE _QUERY Y LA DECLARE ACA DONDE DIJE QUE QUERY ES IGUAL AL TEXTEDITING.TEXT

    // pasos para hacer un filtro

    // 1 declaro una variable llamada _query
    // 2 declaro una variable llamada filteredList que es una lista de filtros
    // 3 en la propiedad onchange de text field digo que _query es igual al texto escrito
    // 4 hago un set state
    // 5 luego realizo una condicion donde digo que si el text field esta vacio ,la lista vacia de filteredlist es igual
    //   a mi lista de _countries y si no la lista es igual al objeto escrito
    // el where dice, si lo escrito en el texfield es igual a un elemento en _countries
    // eso muestrame en la pantalla
    // el where lo pase todo a minuscuilas y aahora el filtro aceptaria min y may
    // por lo que en el list view ahora ira esta variable de tipo List filtrada

    // para que busque puede ser que empieze con el nombre del elemento
    // o constains, es mejor constains
    // puede ser asi   puede ser asi _countries.where((e) => e.name.toLowerCase().starWith(_query.toLowerCase())).toList();
    if (query.isEmpty) {
      filteredList = _countries;
    } else {
      filteredList = _countries.where((e) => e.name.toLowerCase().contains(query.toLowerCase())).toList();
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,

        // customizacion de texfield bakan
        // si no quisiera bordes en las propiedades que ahora estan
        // customizadas hay que pasar InputBorder.none asi:

        // focusedBorder: InputBorder.none
        // enableBorder: InputBorder.none
        //  disableBorder: InputBorder.none
        title: TextField(
          controller: _textEditingController,
          // con esto formateo y digo que debe contener un texto para poder ser valido
          // en este caso que solo sean letras fui a regexr.com y busque en la comunidad
          // una expresion regular apta para solo letras y la traje aca
          inputFormatters: [
            FilteringTextInputFormatter(
              // esta expresion regular permite ingresar letras y espacios en blanco
              RegExp(r'^[a-zA-Z\s]*$'),
              allow: true,
            ),
            CapitalizeInputFormatter()
          ],
          enabled: true,
          onChanged: (_) {
            setState(() {});
          },
          decoration: InputDecoration(
            label: const Text(
              'search...',
              style: TextStyle(
                color: Color.fromARGB(255, 50, 85, 48),
              ),
            ),
            hintText: 'Example: Ecuador',
            hintStyle: TextStyle(color: Colors.black26),
            prefixIcon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 50, 85, 48),
            ),
            suffixIcon: IconButton(
                // con esto limpio el textfield
                onPressed: () {
                  // con esto limpio el textfield
                  _textEditingController.text = '';
                  // debo ademas manejar la query para que me muestre
                  // los paises en caso de una query vacia
                  // si no no se me vera nada
                  // _query = '';
                  // ESCONDO EL TECLADO CUANDO PULSE LA X
                  // CON ESTO DE FOCUS NO ES NECESARIO LA LLAMADA A SET STATE
                  FocusScope.of(context).unfocus();
                },
                icon: const Icon(
                  Icons.clear,
                  color: Color.fromARGB(255, 50, 85, 48),
                )),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 50, 85, 48),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 171, 212, 168),
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 171, 212, 168),
              ),
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          // se usa para saber que widget tiene el foco de atencion
          // con esto lo usamos para poder minimizar el teclado cuando damos click
          // a fuera del campo de texto
          // esto se puede hacer tambien en el main para toda la app
          // podemos envolver MaterialApp en un gesture detector y escribir en el
          // onTap: para que sea global pero el codigo seria asi:
          // dentro del onTap () { final focus = FocusScope.of(context); final focusedChild = focus.focusedChild;
          //
          // if(focusedChild !=  null && !focusedChild.hasPrimaryFocus){
          //  focusedChild.unFocus();
          //  }
          // },
          FocusScope.of(context).unfocus();
        },
        child: ListView.builder(
          // con esto escondo el teclado al hacer scroll
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemBuilder: (_, index) {
            final country = filteredList[index];
            return ListTile(
              title: Text(country.name),
            );
          },
          itemCount: filteredList.length,
        ),
      ),
    );
  }
}
