/*

100 % dart. Logicas simples de la app.

*/

String tittleQuadrant (quadrantNumber){

  String titulo;

  switch (quadrantNumber) {
    case 1: titulo = "Urgente e importante";
    case 2: titulo = "Importante pero no es urgente.";
    case 3: titulo = "Urgente pero no es importante.";
    case 4: titulo = "No es urgente ni importante.";
      break;
    default: titulo = "error";
  }

  return titulo;

}

