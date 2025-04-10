class Filmes {
  late String title;
  late String year;
  late String released;
  late String runtime;
  late String genre;
  late String director;
  late String actors;
  late String writer;
  late String plot;

  Filmes()  {
    title = "";
    year = ""; 
    released = "";
    runtime = "";
    genre = "";
    director = "";
    actors = "";
    writer= ""; 
    plot = "";
  }

  Filmes.v(
  this.title,
  this.year, 
  this.released, 
  this.runtime, 
  this.genre, 
  this.director, 
  this.actors, 
  this.writer , 
  this.plot
  );

 Filmes.fromJson(Map<String, dynamic> json)
      : title = json['Title'] as String,
        year = json['Year'] as String,
        released= json['Released'] as String,
        runtime= json['Runtime'] as String,
        genre = json['Genre'] as String,
        director = json['Director'] as String,
        actors= json['Actors'] as String,
        writer= json['Writer'] as String,
        plot= json['Plot'] as String;

        Map<String, dynamic> toJson() => {
        'Title': title,
        'Year': year,
        'Released': released,
        'Runtime': runtime,
        'Genre': genre,
        'Director': director,
        'Actors': actors,
        'Writer': writer,
        'Plot': plot,
        };
}