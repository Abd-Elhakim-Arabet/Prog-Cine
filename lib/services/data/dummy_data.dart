import 'dart:collection';

import '../models.dart';


List<Movie> allMovies = [
  Movie(
    id: "sd",
    name: "196 meters",
    description: "The kidnapping of a little girl creates tension and suspicion in Algiers. Only Dounia, a brilliant psychiatrist, and Sami, a police inspector, can unearth the demons of the past.",
    genre: "Mistery, Thriller",
    duration:" 1h 30min",
    bigImage: "lib/assets/images/movies/196 meters/wide_image.png",
    smallImage: "lib/assets/images/movies/196 meters/small_image.png",
    year: 2024,
    imdbRating: "8.6",
    rottenTomatoesRating: "/",
  ),
  Movie(
    id: "sd",
    name: "Wicked",
    description: "Elphaba, a misunderstood young woman because of her green skin, and Glinda, a popular girl, become friends at Shiz University in the Land of Oz. After an encounter with the Wonderful Wizard of Oz, their friendship reaches a crossroads.",
    genre: "Fantasy, Musical",
    duration:" 2h 40min",
    bigImage: "lib/assets/images/movies/wicked/wide_image.png",
    smallImage: "lib/assets/images/movies/wicked/small_image.png",
    year: 2024,
    imdbRating: "8.1",
    rottenTomatoesRating: "89",

    ),
  Movie(
    id: "sd",
    name: "Moana 2",
    description:"After receiving an unexpected call from her wayfinding ancestors, Moana must journey to the far seas of Oceania and into dangerous, long-lost waters for an adventure unlike anything she's ever faced.",
    genre: "Animation, Adventure",
    duration:" 1h 40min",
    bigImage: "lib/assets/images/movies/moana 2/wide_image.png",
    smallImage: "lib/assets/images/movies/moana 2/small_image.png",
    year: 2024,
    imdbRating: "7.1",
    rottenTomatoesRating: "62",
    ),
  Movie(
    id: "sd",
    name: "Monsieur Aznavour",
    description: "Follows the beginnings of the iconic French-Armenian singer, songwriter and actor, Charles Aznavour, from zero to fame.",
    genre: "Biography, Drama",
    duration:" 2h 13min",
    bigImage: "lib/assets/images/movies/monsieur aznavour/wide_image.png",
    smallImage: "lib/assets/images/movies/monsieur aznavour/small_image.png",
    year: 2024,
    imdbRating: "7.4",
    rottenTomatoesRating: "/",
    ),
  Movie(
    id: "sd",
    name: "Dr Frantz Fanon",
    imdbRating: "7.1",
    rottenTomatoesRating: "/",
    description: "The influential politician and activist Frantz Fanon works as a psychiatrist in Algeria between 1953-1956. He pioneers new social therapies to treat the psychological effects of racism during the decolonization movement.",
    genre: "Biography, History",
    duration:" 1h 30min",
    bigImage: "lib/assets/images/movies/dr frantz/wide_image.png",
    smallImage: "lib/assets/images/movies/dr frantz/small_image.png",
    year: 2024,
    ),
  Movie(
    id: "sd",
    name: "Smile 2",
    description: "About to embark on a world tour, global pop sensation Skye Riley begins experiencing increasingly terrifying and inexplicable events. Overwhelmed by the escalating horrors and the pressures of fame, Skye is forced to face her past.",
    genre: "Horror, Mystery",
    duration:" 2h 7min",
    bigImage: "lib/assets/images/movies/smile 2/wide_image.png",
    smallImage: "lib/assets/images/movies/smile 2/small_image.png",
    year: 2024,
    imdbRating: "6.9",
    rottenTomatoesRating: "86",
    ),
  Movie(
    id: "sd",
    name: "Gladiator 2",
    description: "After his home is conquered by the tyrannical emperors who now lead Rome, Lucius is forced to enter the Colosseum and must look to his past to find strength to return the glory of Rome to its people.",
    genre: "Action, Adventure",
    duration:" 2h 30min",
    bigImage: "lib/assets/images/movies/gladiator 2/wide_image.png",
    smallImage: "lib/assets/images/movies/gladiator 2/small_image.png",
    year: 2024,
    imdbRating: "6.9",
    rottenTomatoesRating: "83",
    ),
  Movie(
    id: "sd",
    name: "Venom 3",
    description: "Eddie Brock and Venom must make a devastating decision as they're pursued by a mysterious military man and alien monsters from Venom's home world.",
    genre: "Action, Adventure",
    duration: "1h 50min",
    year: 2024,
    imdbRating: "6.2",
    rottenTomatoesRating: "81",
    bigImage: "lib/assets/images/movies/venom 3/wide_image.png",
    smallImage: "lib/assets/images/movies/venom 3/small_image.png",
    ),
  Movie(
    id: "sd",
    name: "The Wild Robot",
    description: "After a shipwreck, an intelligent robot called Roz is stranded on an uninhabited island. To survive the harsh environment, Roz bonds with the island's animals and cares for an orphaned baby goose.",
    duration: "1h 42min",
    genre: "Animation, Sci-Fi",
    year: 2024,
    imdbRating: "8.1",
    rottenTomatoesRating: "98",
    bigImage: "lib/assets/images/movies/the wild robot/wide_image.png",
    smallImage: "lib/assets/images/movies/the wild robot/small_image.png",
    ),
];

Theater CosmosB = 
  Theater(
    id: "sd",
    name: "Cosmos Beta",
    location: "Algiers, Algeria",
    firstMovieTime: "11:00 am",
    lastMovieTime: "22:00 pm",
    image: "lib/assets/images/cosmos_beta.png",
  );
 
// all theaters have the same day schedule

Theater CosmosAlpha = 
  Theater( 
    id: "sd",
    name: "Cosmos Alpha",
    location: "Algiers, Algeria",
    firstMovieTime: "11:00 am",
    lastMovieTime: "22:00 pm",
    image: "lib/assets/images/cosmos_alpha.png",
  );

Theater Ibnzaydun = 
  Theater(
    id: "sd",
    name: "Ibn Zaydun",
    location: "Algiers, Algeria",
    firstMovieTime: "11:00 am",
    lastMovieTime: "22:00 pm",
    image: "lib/assets/images/ibn_zaydun.png",
  );

Theater IbnKhaldoun = 
  Theater(
    id: "sd",
    name: "Ibn Khaldoun",
    location: "Algiers, Algeria",
    firstMovieTime: "11:00 am",
    lastMovieTime: "22:00 pm",
    image: "lib/assets/images/ibn_khaldoun.png",
   );

Theater AhmedBey = 
  Theater(
    id: "sd",
    name: "Ahmed Bey",
    location: "Constantine, Algeria",
    firstMovieTime: "11:00 am",
    lastMovieTime: "22:00 pm",
    image: "lib/assets/images/ahmed_bey.png",
 );

List<Theater> theaters = [
  CosmosB,
  CosmosAlpha,
  Ibnzaydun,
  IbnKhaldoun,
  AhmedBey,
];

List<Movie> FeaturedMovies = [
  allMovies[6],
  allMovies[7],
  allMovies[8],
];

List<Movie> PopularMovies = [
  allMovies[4],
  allMovies[6],
  allMovies[8],
];

List<Movie> inTheaters = [
  allMovies[0],
  allMovies[1],
  allMovies[2],
  allMovies[3],
  allMovies[4],
  allMovies[5],
  allMovies[6],
  allMovies[7],
  allMovies[8],
];

List <Movie> This_weekend = [
  allMovies[3],
  allMovies[4],
  allMovies[5],
  allMovies[6],
  allMovies[7],
  allMovies[8],
];
