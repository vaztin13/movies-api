-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2022 at 06:34 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `comment`, `user_id`, `name`, `movie_id`, `rating`) VALUES
(1, 'Me gusto mucho', 2, 'Jorge', 70, 4),
(2, 'Llore mucho', 3, 'Milagros', 3, 4),
(3, 'Mi pelicula favorita', 1, 'T!', 71, 5),
(4, 'Muy buena', 6, 'Matias', 72, 4),
(5, 'Esta bien, no es la gran cosa', 3, 'Milagros', 88, 2),
(6, 'Me hace acordar a alguien cada vez que la veo', 1, 'T!', 1, 4),
(8, 'No me gusto tanto, esta bien', 4, 'Tomas', 72, 3),
(9, 'Me rei mucho', 4, 'Tomas', 84, 4),
(10, 'No me gusto', 4, 'Tomas', 3, 1),
(11, 'Normal', 3, 'Milagros', 86, 2),
(12, 'Muy buena', 1, 'T!', 85, 5),
(13, 'No la entendi', 6, 'Matias', 2, 3),
(14, 'Un clasico', 2, 'Jorge', 9, 5),
(15, 'Excelente', 2, 'Jorge', 8, 4),
(16, 'Genial', 6, 'Matias', 92, 4),
(17, 'Muy mala', 4, 'Tomas', 89, 1),
(18, 'Mala', 4, 'Tomas', 87, 2),
(19, 'Buenisima', 2, 'Jorge', 75, 4),
(20, 'Buena', 3, 'Matias', 95, 3),
(21, 'peli put', 3, 'put', 3, 4),
(22, 'La mejor', 5, 'Juani', 79, 4),
(23, 'Excelente', 5, 'Juani', 6, 4),
(24, 'La mejor', 3, 'Milagros', 7, 4),
(25, 'Buenisima', 5, 'Juani', 78, 4),
(26, ':)', 1, 'T!', 86, 5),
(28, 'Esta bien para pasar el rato', 3, 'Milagros', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `plot` varchar(1000) NOT NULL,
  `image` varchar(45) NOT NULL,
  `genre_type_id` int(11) NOT NULL,
  `year` varchar(4) NOT NULL,
  `director` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `plot`, `image`, `genre_type_id`, `year`, `director`) VALUES
(1, 'One day', 'Emma (Hathaway) y Dexter (Sturgess) se conocen el d??a de su graduaci??n universitaria, un 15 de julio. Ella es una chica idealista de clase trabajadora. ??l, en cambio, es un joven rico con ganas de comerse el mundo. Durante veinte a??os, cada 15 de julio, se muestra su vida cotidiana y lo extraordinaria que es su amistad. Por fin, un d??a se dan cuenta de que lo que hab??an estado buscando durante a??os lo ten??an ante s??.', 'imagen_one_day.jpg', 2, '2011', 'Lone Scherfig'),
(2, 'Star Wars Episode IV', 'La princesa Leia, l??der del movimiento rebelde que desea reinstaurar la Rep??blica en la galaxia en los tiempos ominosos del Imperio, es capturada por las Fuerzas Imperiales, capitaneadas por el implacable Darth Vader, el sirviente m??s fiel del Emperador. El intr??pido y joven Luke Skywalker, ayudado por Han Solo, capit??n de la nave espacial \"El Halc??n Milenario\", y los androides, R2D2 y C3PO, ser??n los encargados de luchar contra el enemigo e intentar rescatar a la princesa para volver a instaurar la justicia en el seno de la galaxia.', 'imagen_star_wars.jpg', 4, '1977', 'George Lucas'),
(3, 'Eternal Sunshine of the Spotless Mind', 'Joel (Jim Carrey) recibe un terrible golpe cuando descubre que su novia Clementine (Kate Winslet) ha hecho que borren de su memoria todos los recuerdos de su tormentosa relaci??n. Desesperado, se pone en contacto con el creador del proceso, el Dr. Howard Mierzwiak, para que borre a Clementine de su memoria. Pero cuando los recuerdos de Joel empiezan a desaparecer de pronto redescubre su amor por Clementine. Desde lo m??s profundo de su cerebro intentar?? parar el proceso.', 'imagen_esotsm.jpg', 2, '2004', 'Michel Gondry'),
(4, 'Me before you', 'Louisa ???Lou??? Clark (Emilia Clarke), una chica inestable y creativa, reside en un peque??o pueblo de la campi??a inglesa. Vive sin rumbo y va de un trabajo a otro para ayudar a su familia a llegar a fin de mes. Sin embargo, un nuevo trabajo pondr?? a prueba su habitual alegr??a. En el castillo local, se ocupa de cuidar y acompa??ar a Will Traynor (Sam Claflin), un joven y rico banquero que se qued?? paral??tico tras un accidente.', 'imagen_me_before_you.jpg', 2, '2016', 'Thea Sharrock'),
(5, 'The Notebook', 'En una residencia de ancianos, un hombre (James Garner) lee a una mujer (Gena Rowlands) una historia de amor escrita en su viejo cuaderno de notas. Es la historia de Noah Calhoun (Ryan Gosling) y Allie Hamilton (Rachel McAdams), dos j??venes adolescentes de Carolina del Norte que, a pesar de vivir en dos ambientes sociales muy diferentes, se enamoraron profundamente y pasaron juntos un verano inolvidable, antes de ser separados, primero por sus padres, y m??s tarde por la guerra.', 'imagen_the_notebook.jpg', 2, '2004', 'Nick Cassavetes'),
(6, 'Terminator II', 'Sarah Connor, la madre soltera del rebelde John Connor, est?? ingresada en un psiqui??trico. Algunos a??os antes, un viajero del tiempo le hab??a revelado que su hijo ser??a el salvador de la humanidad en un futuro dominado por las m??quinas. Se convirti?? entonces en una especie de guerrera y educ?? a su hijo John en t??cticas de supervivencia. Esta es la raz??n por la que est?? recluida en un manicomio. Cuando un nuevo androide mejorado, un T-1000, llega del futuro para asesinar a John, un viejo modelo T-800 ser?? enviado para protegerle.', 'imagen_terminator2.jpg', 5, '1991', 'James Cameron'),
(7, 'White chicks', 'Dos ambiciosos -pero con poca fortuna- agentes del FBI (Shawn y Marlon Wayans) se hacen pasar por mujeres, novatas en la alta sociedad, en el exclusivo complejo Hamptons para investigar un c??rculo de secuestros. Pero mientras preparan su actuaci??n en el mayor acontecimiento social del a??o se encuentran que irrumpir en la alta sociedad es mucho m??s duro de lo que parec??a.', 'imagen_white_chicks.jpg', 3, '2004', 'Keenen Ivory Wayans'),
(8, 'The Shining', 'Jack Torrance se traslada con su mujer y su hijo de siete a??os al impresionante hotel Overlook, en Colorado, para encargarse del mantenimiento de las instalaciones durante la temporada invernal, ??poca en la que permanece cerrado y aislado por la nieve. Su objetivo es encontrar paz y sosiego para escribir una novela. Sin embargo, poco despu??s de su llegada al hotel, al mismo tiempo que Jack empieza a padecer inquietantes trastornos de personalidad, se suceden extra??os y espeluznantes fen??menos paranormales.', 'image_shining.jpg', 6, '1980', 'Stanley Kubrick'),
(9, 'The Godfather', 'Am??rica, a??os 40. Don Vito Corleone (Marlon Brando) es el respetado y temido jefe de una de las cinco familias de la mafia de Nueva York. Tiene cuatro hijos: Connie (Talia Shire), el impulsivo Sonny (James Caan), el pusil??nime Fredo (John Cazale) y Michael (Al Pacino), que no quiere saber nada de los negocios de su padre. Cuando Corleone, en contra de los consejos de \'Il consigliere\' Tom Hagen (Robert Duvall), se niega a participar en el negocio de las drogas, el jefe de otra banda ordena su asesinato. Empieza entonces una violenta y cruenta guerra entre las familias mafiosas.', 'imagen_padrino.jpg', 7, '1972', 'Francis Ford Coppola'),
(70, 'Reservoir Dogs', 'Una banda organizada es contratada para atracar una empresa y llevarse unos diamantes. Sin embargo, antes de que suene la alarma, la polic??a ya est?? all??. Algunos miembros de la banda mueren en el enfrentamiento con las fuerzas del orden, y los dem??s se re??nen en el lugar convenido.', 'perros_calle.jpg', 7, '1992', 'Quentin Tarantino'),
(71, 'Vertigo', 'Scottie Fergusson (James Stewart) es un detective de la polic??a de San Francisco que padece de v??rtigo. Cuando un compa??ero cae al vac??o desde una cornisa mientras persiguen a un delincuente, Scottie decide retirarse. Gavin Elster (Tom Helmore), un viejo amigo del colegio, lo contrata para un caso aparentemente muy simple: que vigile a su esposa Madeleine (Kim Novak), una bella mujer que est?? obsesionada con su pasado.', 'vertigo.jpg', 7, '1958', 'Alfred Hitchcock'),
(72, 'Parasite', 'Tanto Gi Taek (Song Kang-ho) como su familia est??n sin trabajo. Cuando su hijo mayor, Gi Woo (Choi Woo-sik), empieza a dar clases particulares en casa de Park (Lee Seon-gyun), las dos familias, que tienen mucho en com??n pese a pertenecer a dos mundos totalmente distintos, comienzan una interrelaci??n de resultados imprevisibles.', 'parasite.jpg', 7, '2019', 'Bong Joon-ho'),
(73, 'Interstellar', 'Al ver que la vida en la Tierra est?? llegando a su fin, un grupo de exploradores dirigidos por el piloto Cooper (McConaughey) y la cient??fica Amelia (Hathaway) emprende una misi??n que puede ser la m??s importante de la historia de la humanidad: viajar m??s all?? de nuestra galaxia para descubrir alg??n planeta en otra que pueda garantizar el futuro de la raza humana.', 'interstellar.jpg', 7, '2014', 'Christopher Nolan'),
(74, 'The Dark Knight', 'Batman/Bruce Wayne (Christian Bale) regresa para continuar su guerra contra el crimen. Con la ayuda del teniente Jim Gordon (Gary Oldman) y del Fiscal del Distrito Harvey Dent (Aaron Eckhart), Batman se propone destruir el crimen organizado en la ciudad de Gotham. El triunvirato demuestra su eficacia, pero, de repente, aparece Joker (Heath Ledger), un nuevo criminal que desencadena el caos y tiene aterrados a los ciudadanos.', 'batman.jpg', 7, '2008', 'Christopher Nolan'),
(75, 'Nueve reinas', 'Buenos Aires. Juan y Marcos son dos estafadores de poca monta, uno joven y un veterano en el arte del timo, que casualmente se ven envueltos en un asunto que les puede hacer millonarios: tienen menos de un d??a para hacer una estafa que no puede fallar.', 'nueve_reinas.jpg', 7, '2000', 'Fabi??n Bielinsky'),
(76, 'Back to the Future. Part II', 'Aunque a Marty McFly todav??a le falta tiempo para asimilar el hecho de estar viviendo dentro de la familia perfecta gracias a su anterior viaje en el tiempo, no le queda ni espacio para respirar cuando su amigo Doc aparece de improviso con la m??quina del tiempo (mucho m??s modernizada), e insta a que le acompa??en ??l y su novia a viajar al futuro para solucionar un problema con la ley que tendr?? uno de sus futuros hijos. En la tremenda vor??gine futurista, con todo lo que ello conlleva, del Hill Valley de 2015, la presencia de tales viajeros temporales causar?? un efecto mayor que el que iban a arreglar. Un almanaque deportivo y la posesi??n del secreto de la existencia de la m??quina del tiempo por parte del siempre villano Biff Tannen, ser??n los ingredientes que conjugar??n una causa-efecto en el pasado, en el presente y en el propio futuro, que har?? que Marty y Doc se tengan que emplear a fondo para poner fin a la cat??strofe a la que les lleva el destino.', 'back_future.jpg', 4, '1989', 'Robert Zemeckis'),
(77, 'Blade Runner 2049', 'Treinta a??os despu??s de los eventos del primer film, un nuevo blade runner, K (Ryan Gosling) descubre un secreto profundamente oculto que podr??a acabar con el caos que impera en la sociedad. El descubrimiento de K le lleva a iniciar la b??squeda de Rick Deckard (Harrison Ford), un blade runner al que se le perdi?? la pista hace 30 a??os.', 'blade_runner.jpg', 4, '2017', 'Denis Villenueve'),
(78, 'Alien', 'De regreso a la Tierra, la nave de carga Nostromo interrumpe su viaje y despierta a sus siete tripulantes. El ordenador central, MADRE, ha detectado la misteriosa transmisi??n de una forma de vida desconocida, procedente de un planeta cercano aparentemente deshabitado. La nave se dirige entonces al extra??o planeta para investigar el origen de la comunicaci??n.', 'alien.jpg', 4, '1979', 'Ridley Scott'),
(79, 'The Matrix', 'Thomas Anderson es un brillante programador de una respetable compa????a de software. Pero fuera del trabajo es Neo, un hacker que un d??a recibe una misteriosa visita..', 'matrix.jpg', 4, '1999', 'Hermanas Wachowski'),
(80, 'Groundhog Day', 'Phil, el hombre del tiempo de una cadena de televisi??n, va un a??o m??s a Punxstawnwey, a cubrir la informaci??n del festival del D??a de la Marmota. En el viaje de regreso, Phil y su equipo se ven sorprendidos por una tormenta que los obliga a regresar a la peque??a ciudad. A la ma??ana siguiente, al despertarse, comprueba at??nito que comienza otra vez el D??a de la Marmota.', 'groundhog.jpg', 3, '1993', 'Harold Ramis'),
(81, 'Mrs. Doubtfire', 'Daniel Hillard es padre y esposo. Sus hijos lo consideran un padre maravilloso, pero su mujer est?? cansada de que se comporte como si tambi??n ??l fuera un ni??o. Tras un accidentado divorcio, aunque lucha con todas sus fuerzas para conseguir la custodia de los ni??os, el juez no se la concede. Decide entonces hacerse pasar por una se??ora mayor para poder ser, al menos, la canguro de sus hijos.', 'doubtfire.jpg', 3, '1993', 'Chris Columbus'),
(82, 'Dr. Strangelove, or How I Learned to Stop Worrying and Love the Bomb', 'Convencido de que los comunistas est??n contaminando los Estados Unidos, un general ordena, en un acceso de locura, un ataque a??reo nuclear sorpresa contra la Uni??n Sovi??tica. Su ayudante, el capit??n Mandrake, trata de encontrar la f??rmula para impedir el bombardeo. Por su parte, el Presidente de los EE.UU. se pone en contacto con Mosc?? para convencer al gobierno sovi??tico de que el ataque no es m??s que un est??pido error. Mientras tanto, el asesor del Presidente, un antiguo cient??fico nazi, el doctor Strangelove, confirma la existencia de la ???M??quina del Juicio Final???, un dispositivo de represalia sovi??tico capaz de acabar con la humanidad para siempre.', 'strangelove.jpg', 3, '1964', 'Stanley Kubrick'),
(83, 'Ferris Bueller\'s Day Off', 'Un joven de 17 a??os decide disfrutar de unas vacaciones anticipadas aprovechando la ausencia de sus padres. Prepara minuciosamente un d??a dedicado enteramente a hacer todo lo que normalmente no puede hacer. Para ello contar??, por supuesto, con la compa????a de su mejor amigo y de su novia.', 'ferris.jpg', 3, '1986', 'John Hughes'),
(84, 'Borat', 'Sacha Baron Cohen, el peculiar protagonista de \"Ali G anda suelto\", interpreta a Borat, un reportero de Kazajist??n. Por orden de su gobierno, el periodista va a Estados Unidos para rodar un documental pedag??gico, que debe recoger las mejores ense??anzas de los USA para que su pa??s las aproveche. Pero el trabajo no ser?? tan f??cil como parece...', 'borat.jpg', 3, '2006', 'Larry Charles'),
(85, 'Casablanca', 'A??os 40. A consecuencia de la Segunda Guerra Mundial, Casablanca era una ciudad a la que llegaban huyendo del nazismo gente de todas partes: llegar era f??cil, pero salir era casi imposible, especialmente si el nombre del fugitivo figuraba en las listas de la Gestapo, que presionaba a la autoridades francesas al mando del corrupto inspector Renault. En este caso, el objetivo de la polic??a secreta alemana es el l??der checo y h??roe de la resistencia Victor Laszlo, cuya ??nica esperanza es Rick Blaine, propietario del \'Rick???s Caf??\' y antiguo amante de su mujer, Ilsa Lund. Rick e Ilsa se hab??an conocido en Par??s, pero la entrada de las tropas alemanas en la capital francesa les separ??.', 'casablanca.jpg', 2, '1942', 'Michael Curtiz'),
(86, 'When Harry Met Sally', 'Harry Burns (Billy Cristal) y Sally Albright (Meg Ryan) son dos estudiantes universitarios que se conocen por casualidad, cuando ella se ofrece a llevar Harry en su coche. Durante el viaje hablan sobre la amistad entre personas de diferente sexo y sus opiniones son absolutamente divergentes: mientras que Harry est?? convencido de que la amistad entre un hombre y una mujer es imposible, Sally cree lo contrario. A pesar de ello, pasan los a??os y su relaci??n contin??a. ', 'harry_met.jpg', 2, '1989', 'Rob Reiner'),
(87, 'About Time', 'Tim Lake (Domhnall Gleeson) es un joven de 21 a??os que descubre que puede viajar en el tiempo. Su padre (Bill Nighy) le cuenta que todos los hombres de la familia han tenido desde siempre ese don, el de regresar en el tiempo a un momento determinado, una y otra vez, hasta conseguir hacer \"lo correcto\". As?? pues, Tim decide volver al pasado para intentar conquistar a Mary (Rachel McAdams), la chica de sus sue??os.', 'about_time.jpg', 2, '2013', 'Richard Curtis'),
(88, '(500) Days of Summer', 'Tom a??n sigue creyendo, incluso en este c??nico mundo moderno, en la noci??n de un amor transformador, predestinado por el cosmos y que golpea como un rayo s??lo una vez. Summer no cree lo mismo, para nada. La mecha se enciende desde el primer d??a, cuando Tom, un arquitecto en ciernes convertido en un sensiblero escritor de tarjetas de felicitaci??n, se encuentra con Summer, la bella y fresca nueva secretaria de su jefe. Aunque aparentemente est?? fuera de su alcance, Tom pronto descubre que tienen un mont??n de cosas en com??n. La historia de Tom y Summer cubre desde el enamoramiento, las citas y el sexo hasta la separaci??n, las recriminaciones y la redenci??n, todo lo cual se suma al caleidosc??pico retrato del porqu?? y el c??mo seguimos esforz??ndonos de modo tan risible y rastrero para encontrar sentido al amor??? y esperar convertirlo en realidad.', '500_days.jpg', 2, '2009', 'Marc Webb'),
(89, 'Psycho', 'Marion Crane, una joven secretaria, tras cometer el robo de un dinero en su empresa, huye de la ciudad y, despu??s de conducir durante horas, decide descansar en un peque??o y apartado motel de carretera regentado por un t??mido joven, Norman Bates, que vive en la casa de al lado con su madre.', 'psycho.jpg', 6, '1960', 'Alfred Hitchcock'),
(90, 'The Sixth Sense', 'El doctor Malcom Crowe es un conocido psic??logo infantil de Philadelphia que vive obsesionado por el doloroso recuerdo de un joven paciente desequilibrado al que fue incapaz de ayudar. Cuando conoce a Cole Sear, un aterrorizado y confuso ni??o de ocho a??os que necesita tratamiento, ve que se le presenta la oportunidad de redimirse haciendo todo lo posible por ayudarlo. Sin embargo, el doctor Crowe no est?? preparado para conocer la terrible verdad acerca del don sobrenatural de su paciente: recibe visitas no deseadas de esp??ritus atormentados.', 'sixth_sense.jpg', 6, '1999', 'M. Night Shyamalan'),
(91, 'Misery', 'Un escritor llamado Paul Sheldon (James Caan) lleva a??os malgastando su talento con unas rom??nticas historias, de gran ??xito comercial, cuya protagonista es una mujer llamada Misery. Decidido a acabar con esta situaci??n, mata al personaje y se refugia en Colorado para escribir una novela seria. Terminado su trabajo, emprende el regreso, pero en una carretera de monta??a, pierde el control de su coche y sufre un grave accidente. Annie Wilkes (Kathy Bates), una brusca e impetuosa mujer, gran admiradora suya, lo rescata, se lo lleva a su casa y lo cuida con esmero. Obsesionada con el personaje de Misery, retiene a Sheldon para obligarlo a escribir una nueva historia en la que resucite al personaje. ', 'misery.jpg', 6, '1990', 'Rob Reiner'),
(92, 'John Wick', 'En Nueva York, John Wick, un asesino a sueldo retirado, vuelve otra vez a la acci??n para vengarse de los g??ngsters que le quitaron todo.', 'john_wick.jpg', 5, '2014', 'Chad Stahelski, David Leitch'),
(93, 'Mad Max: Fury Road', 'Perseguido por su turbulento pasado, Mad Max cree que la mejor forma de sobrevivir es ir solo por el mundo. Sin embargo, se ve arrastrado a formar parte de un grupo que huye a trav??s del desierto en un War Rig conducido por una Emperatriz de ??lite: Furiosa. Escapan de una Ciudadela tiranizada por Immortan Joe, a quien han arrebatado algo irreemplazable. Enfurecido, el Se??or de la Guerra moviliza a todas sus bandas y persigue implacablemente a los rebeldes en una \"guerra de la carretera\" de altas revoluciones... Cuarta entrega de la saga post-apocal??ptica que resucita la trilog??a que a principios de los ochenta protagoniz?? Mel Gibson.', 'mad_max.jpg', 5, '2015', 'George Miller'),
(94, 'Top Gun: Maverick', 'Despu??s de m??s de treinta a??os de servicio como uno de los mejores aviadores de la Armada, Pete \"Mavericks\" Mitchel (Tom Cruise) se encuentra donde siempre quiso estar: superando los l??mites como un valiente piloto de pruebas y esquivando el ascenso de rango, que no le dejar??a volar emplaz??ndolo en tierra. Cuando es destinado a la academia de Top Gun con el objetivo de entrenar a los pilotos de ??lite para realizar una peligrosa misi??n en territorio enemigo, Maverick se encuentra all?? con el joven teniente Bradley Bradshaw (Miles Teller), el hijo de su difunto amigo \"Goose\".', 'top_gun.jpg', 5, '2022', 'Joseph Kosinski'),
(95, 'Kill Bill: Volume 1', 'El d??a de su boda, una asesina profesional (Thurman) sufre el ataque de algunos miembros de su propia banda, que obedecen las ??rdenes de Bill (David Carradine), el jefe de la organizaci??n criminal. Logra sobrevivir al ataque, aunque queda en coma. Cuatro a??os despu??s despierta dominada por un gran deseo de venganza.', 'kill_bill.jpg', 5, '2003', 'Quentin Tarantino');

-- --------------------------------------------------------

--
-- Table structure for table `movie_type`
--

CREATE TABLE `movie_type` (
  `id` int(11) NOT NULL,
  `genre` varchar(45) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie_type`
--

INSERT INTO `movie_type` (`id`, `genre`, `description`) VALUES
(2, 'Romance', 'romance description'),
(3, 'Comedy', 'comedy description'),
(4, 'Science Fiction', 'Science Fiction description'),
(5, 'Action', 'action description'),
(6, 'Horror', 'horror description'),
(7, 'Drama', 'drama description');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(320) NOT NULL,
  `password` varchar(320) NOT NULL,
  `role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `role`) VALUES
(1, 'admin@admin.com', '$2a$12$zg3pXtfpPbFZP81lZ4j8SO275Iv0HRiSJ/l/nsjpkkdsxq3cUYdKW', 'ADMIN'),
(2, 'user1@gmail.com', '$2a$12$zg3pXtfpPbFZP81lZ4j8SO275Iv0HRiSJ/l/nsjpkkdsxq3cUYdKW', 'USER'),
(3, 'user2@gmail.com', '$2a$12$zg3pXtfpPbFZP81lZ4j8SO275Iv0HRiSJ/l/nsjpkkdsxq3cUYdKW', 'USER'),
(4, 'user3@gmail.com', '$2a$12$zg3pXtfpPbFZP81lZ4j8SO275Iv0HRiSJ/l/nsjpkkdsxq3cUYdKW', 'USER'),
(5, 'user4@gmail.com', '$2a$12$zg3pXtfpPbFZP81lZ4j8SO275Iv0HRiSJ/l/nsjpkkdsxq3cUYdKW', 'USER'),
(6, 'user5@gmail.com', '$2a$12$zg3pXtfpPbFZP81lZ4j8SO275Iv0HRiSJ/l/nsjpkkdsxq3cUYdKW', 'USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id_fk` (`movie_id`),
  ADD KEY `user_id_fk` (`user_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_movies_movie_type_id` (`genre_type_id`);

--
-- Indexes for table `movie_type`
--
ALTER TABLE `movie_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `movie_type`
--
ALTER TABLE `movie_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `movie_id_fk` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `fk_movies_movie_type_id` FOREIGN KEY (`genre_type_id`) REFERENCES `movie_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
