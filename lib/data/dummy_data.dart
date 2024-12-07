import 'dart:collection';

import 'dummy_models.dart';


List<Movie> allMovies = [
  Movie(
    id:1,
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
    id:2,
    name: "Wicked",
    description: "Elphaba, a misunderstood young woman because of her green skin, and Glinda, a popular girl, become friends at Shiz University in the Land of Oz. After an encounter with the Wonderful Wizard of Oz, their friendship reaches a crossroads.",
    genre: "Fantasy, Musical, Romance",
    duration:" 2h 40min",
    bigImage: "lib/assets/images/movies/wicked/wide_image.png",
    smallImage: "lib/assets/images/movies/wicked/small_image.png",
    year: 2024,
    imdbRating: "8.1",
    rottenTomatoesRating: "89",

    ),
  Movie(
    id:3,
    name: "Moana 2",
    description:"After receiving an unexpected call from her wayfinding ancestors, Moana must journey to the far seas of Oceania and into dangerous, long-lost waters for an adventure unlike anything she's ever faced.",
    genre: "Animation, Adventure, Comedy",
    duration:" 1h 40min",
    bigImage: "lib/assets/images/movies/moana 2/wide_image.png",
    smallImage: "lib/assets/images/movies/moana 2/small_image.png",
    year: 2024,
    imdbRating: "7.1",
    rottenTomatoesRating: "62",
    ),
  Movie(
    id:4,
    name: "Monsieur Aznavour",
    description: "Follows the beginnings of the iconic French-Armenian singer, songwriter and actor, Charles Aznavour, from zero to fame.",
    genre: "Biography, Drama, Music",
    duration:" 2h 13min",
    bigImage: "lib/assets/images/movies/monsieur aznavour/wide_image.png",
    smallImage: "lib/assets/images/movies/monsieur aznavour/small_image.png",
    year: 2024,
    imdbRating: "7.4",
    rottenTomatoesRating: "/",
    ),
  Movie(
    id:5,
    name: "Dr Frantz Fanon",
    imdbRating: "7.1",
    rottenTomatoesRating: "/",
    description: "The influential politician and activist Frantz Fanon works as a psychiatrist in Algeria between 1953-1956. He pioneers new social therapies to treat the psychological effects of racism during the decolonization movement.",
    genre: "Biography, Drama, History",
    duration:" 1h 30min",
    bigImage: "lib/assets/images/movies/dr frantz/wide_image.png",
    smallImage: "lib/assets/images/movies/dr frantz/small_image.png",
    year: 2024,
    ),
  Movie(
    id:6,
    name: "Smile 2",
    description: "About to embark on a world tour, global pop sensation Skye Riley begins experiencing increasingly terrifying and inexplicable events. Overwhelmed by the escalating horrors and the pressures of fame, Skye is forced to face her past.",
    genre: "Horror, Mystery, Thriller",
    duration:" 2h 7min",
    bigImage: "lib/assets/images/movies/smile 2/wide_image.png",
    smallImage: "lib/assets/images/movies/smile 2/small_image.png",
    year: 2024,
    imdbRating: "6.9",
    rottenTomatoesRating: "86",
    ),
  Movie(
    id:7,
    name: "Gladiator 2",
    description: "After his home is conquered by the tyrannical emperors who now lead Rome, Lucius is forced to enter the Colosseum and must look to his past to find strength to return the glory of Rome to its people.",
    genre: "Action, Adventure, Drama",
    duration:" 2h 30min",
    bigImage: "lib/assets/images/movies/gladiator 2/wide_image.png",
    smallImage: "lib/assets/images/movies/gladiator 2/small_image.png",
    year: 2024,
    imdbRating: "6.9",
    rottenTomatoesRating: "83",
    ),
  Movie(
    id:8,
    name: "Venom 3",
    description: "Eddie Brock and Venom must make a devastating decision as they're pursued by a mysterious military man and alien monsters from Venom's home world.",
    genre: "Action, Adventure, Sci-Fi, Thriller",
    duration: "1h 50min",
    year: 2024,
    imdbRating: "6.2",
    rottenTomatoesRating: "81",
    bigImage: "lib/assets/images/movies/venom 3/wide_image.png",
    smallImage: "lib/assets/images/movies/venom 3/small_image.png",
    ),
  Movie(
    id:9,
    name: "The Wild Robot",
    description: "After a shipwreck, an intelligent robot called Roz is stranded on an uninhabited island. To survive the harsh environment, Roz bonds with the island's animals and cares for an orphaned baby goose.",
    duration: "1h 42min",
    genre: "Animation, Adventure, Sci-Fi",
    year: 2024,
    imdbRating: "8.1",
    rottenTomatoesRating: "98",
    bigImage: "lib/assets/images/movies/the wild robot/wide_image.png",
    smallImage: "lib/assets/images/movies/the wild robot/small_image.png",
    ),
];

TheaterDay CosmosB_friday = 
  TheaterDay(
    date: DateTime(2024, 12,6),
    schedules: [
      Schedule(
        id: 1,
        movieId: 1,
        startTime: DateTime(2024, 12,6, 11, 00),
      ),
      Schedule(
        id: 2,
        movieId: 2,
        startTime: DateTime(2024, 12,6, 15, 00),
      ),
      Schedule(
        id: 2,
        movieId: 2,
        startTime: DateTime(2024, 12,6, 18, 00),
      ),
      Schedule(
        id: 2,
        movieId: 2,
        startTime: DateTime(2024, 12,6, 21, 00),
      ),
    ],
  );


TheaterDay CosmosB_saturday = 
  TheaterDay(
    date: DateTime(2024, 12, 07),
    schedules: [
      Schedule(
        id: 1,
        movieId: 1,
        startTime: DateTime(2024, 12, 7, 11, 00),
      ),
      Schedule(
        id: 2,
        movieId: 8,
        startTime: DateTime(2024, 12,7, 13, 00),
      ),
      Schedule(
        id: 2,
        movieId: 3,
        startTime: DateTime(2024, 12,7, 15, 00),
      ),
      Schedule(
        id: 2,
        movieId: 3,
        startTime: DateTime(2024, 12,7, 18, 00),
      ),
      Schedule(
        id: 2,
        movieId: 1,
        startTime: DateTime(2024, 12,7, 21, 00),
      ),
      Schedule(
        id: 2,
        movieId: 8,
        startTime: DateTime(2024, 12,7, 23, 00),
      ),
    ],
  );

TheaterDay CosmosB_sunday =
  TheaterDay(
    date: DateTime(2024, 12,08),
    schedules: [
      Schedule(
        id: 1,
        movieId: 4,
        startTime: DateTime(2024, 12,08, 11, 00),
      ),
      Schedule(
        id: 2,
        movieId: 9,
        startTime: DateTime(2024, 12,08, 13, 00),
      ),
      Schedule(
        id: 2,
        movieId: 2,
        startTime: DateTime(2024, 12,08, 15, 00),
      ),
      Schedule(
        id: 2,
        movieId: 1,
        startTime: DateTime(2024, 12,08, 18, 00),
      ),
      Schedule(
        id: 2,
        movieId: 1,
        startTime: DateTime(2024, 12,08, 21, 00),
      ),
      Schedule(
        id: 2,
        movieId: 7,
        startTime: DateTime(2024, 12,08, 23, 00),
      ),
    ],
  );

TheaterDay CosmosB_monday = 
  TheaterDay(
    date: DateTime(2024, 12,09),
    schedules: [
      Schedule(
        id: 1,
        movieId: 4,
        startTime: DateTime(2024, 12,09, 11, 00),
      ),
      Schedule(
        id: 2,
        movieId: 2,
        startTime: DateTime(2024, 12,09, 15, 00),
      ),
      Schedule(
        id: 2,
        movieId: 5,
        startTime: DateTime(2024, 12,09, 18, 00),
      ),
      Schedule(
        id: 2,
        movieId: 1,
        startTime: DateTime(2024, 12,09, 21, 00),
      ),
      Schedule(
        id: 2,
        movieId: 5,
        startTime: DateTime(2024, 12,09, 23, 00),
      ),
    ]
  );

List<TheaterDay> CosmosB_days = [
  CosmosB_friday,
  CosmosB_saturday,
  CosmosB_sunday,
  CosmosB_monday,
];

Theater CosmosB = 
  Theater(
    id: 1,
    name: "Cosmos Beta",
    location: "Algiers, Algeria",
    firstMovieTime: "11:00 am",
    lastMovieTime: "22:00 pm",
    image: "lib/assets/images/theaters/cosmos_beta.png",
    days: CosmosB_days,
  );
 
// all theaters have the same day schedule

Theater CosmosAlpha = 
  Theater(
    id: 2,
    name: "Cosmos Alpha",
    location: "Algiers, Algeria",
    firstMovieTime: "11:00 am",
    lastMovieTime: "22:00 pm",
    image: "lib/assets/images/theaters/cosmos_alpha.png",
    days: CosmosB_days,
  );

Theater Ibnzaydun = 
  Theater(
    id: 3,
    name: "Ibn Zaydun",
    location: "Algiers, Algeria",
    firstMovieTime: "11:00 am",
    lastMovieTime: "22:00 pm",
    image: "lib/assets/images/theaters/ibn_zaydun.png",
    days: CosmosB_days,
  );

Theater IbnKhaldoun = 
  Theater(
    id: 4,
    name: "Ibn Khaldoun",
    location: "Algiers, Algeria",
    firstMovieTime: "11:00 am",
    lastMovieTime: "22:00 pm",
    image: "lib/assets/images/theaters/ibn_khaldoun.png",
    days: CosmosB_days,
  );

Theater AhmedBey = 
  Theater(
    id: 5,
    name: "Ahmed Bey",
    location: "Constantine, Algeria",
    firstMovieTime: "11:00 am",
    lastMovieTime: "22:00 pm",
    image: "lib/assets/images/theaters/ahmed_bey.png",
    days: CosmosB_days,
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
