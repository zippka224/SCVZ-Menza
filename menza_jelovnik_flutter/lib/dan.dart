class Dan {
  var dan;
  Dan({this.dan});

  danUTjednu(dan) {
    switch (dan) {
      case 1:
        {
          return dan = "Ponedjeljak";
        }
      case 2:
        {
          return dan = "Utorak";
        }
      case 3:
        {
          return dan = "Srijeda";
        }
      case 4:
        {
          return dan = "Četvrtak";
        }
      case 5:
        {
          return dan = "Petak";
        }
      case 6:
        {
          return dan = "Subota";
        }
      case 7:
        {
          return dan = "Nedjelja";
        }
        break;
    }
    return dan;
  }
}
