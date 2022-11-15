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
(1, 'One day', 'Emma (Hathaway) y Dexter (Sturgess) se conocen el día de su graduación universitaria, un 15 de julio. Ella es una chica idealista de clase trabajadora. Él, en cambio, es un joven rico con ganas de comerse el mundo. Durante veinte años, cada 15 de julio, se muestra su vida cotidiana y lo extraordinaria que es su amistad. Por fin, un día se dan cuenta de que lo que habían estado buscando durante años lo tenían ante sí.', 'imagen_one_day.jpg', 2, '2011', 'Lone Scherfig'),
(2, 'Star Wars Episode IV', 'La princesa Leia, líder del movimiento rebelde que desea reinstaurar la República en la galaxia en los tiempos ominosos del Imperio, es capturada por las Fuerzas Imperiales, capitaneadas por el implacable Darth Vader, el sirviente más fiel del Emperador. El intrépido y joven Luke Skywalker, ayudado por Han Solo, capitán de la nave espacial \"El Halcón Milenario\", y los androides, R2D2 y C3PO, serán los encargados de luchar contra el enemigo e intentar rescatar a la princesa para volver a instaurar la justicia en el seno de la galaxia.', 'imagen_star_wars.jpg', 4, '1977', 'George Lucas'),
(3, 'Eternal Sunshine of the Spotless Mind', 'Joel (Jim Carrey) recibe un terrible golpe cuando descubre que su novia Clementine (Kate Winslet) ha hecho que borren de su memoria todos los recuerdos de su tormentosa relación. Desesperado, se pone en contacto con el creador del proceso, el Dr. Howard Mierzwiak, para que borre a Clementine de su memoria. Pero cuando los recuerdos de Joel empiezan a desaparecer de pronto redescubre su amor por Clementine. Desde lo más profundo de su cerebro intentará parar el proceso.', 'imagen_esotsm.jpg', 2, '2004', 'Michel Gondry'),
(4, 'Me before you', 'Louisa “Lou” Clark (Emilia Clarke), una chica inestable y creativa, reside en un pequeño pueblo de la campiña inglesa. Vive sin rumbo y va de un trabajo a otro para ayudar a su familia a llegar a fin de mes. Sin embargo, un nuevo trabajo pondrá a prueba su habitual alegría. En el castillo local, se ocupa de cuidar y acompañar a Will Traynor (Sam Claflin), un joven y rico banquero que se quedó paralítico tras un accidente.', 'imagen_me_before_you.jpg', 2, '2016', 'Thea Sharrock'),
(5, 'The Notebook', 'En una residencia de ancianos, un hombre (James Garner) lee a una mujer (Gena Rowlands) una historia de amor escrita en su viejo cuaderno de notas. Es la historia de Noah Calhoun (Ryan Gosling) y Allie Hamilton (Rachel McAdams), dos jóvenes adolescentes de Carolina del Norte que, a pesar de vivir en dos ambientes sociales muy diferentes, se enamoraron profundamente y pasaron juntos un verano inolvidable, antes de ser separados, primero por sus padres, y más tarde por la guerra.', 'imagen_the_notebook.jpg', 2, '2004', 'Nick Cassavetes'),
(6, 'Terminator II', 'Sarah Connor, la madre soltera del rebelde John Connor, está ingresada en un psiquiátrico. Algunos años antes, un viajero del tiempo le había revelado que su hijo sería el salvador de la humanidad en un futuro dominado por las máquinas. Se convirtió entonces en una especie de guerrera y educó a su hijo John en tácticas de supervivencia. Esta es la razón por la que está recluida en un manicomio. Cuando un nuevo androide mejorado, un T-1000, llega del futuro para asesinar a John, un viejo modelo T-800 será enviado para protegerle.', 'imagen_terminator2.jpg', 5, '1991', 'James Cameron'),
(7, 'White chicks', 'Dos ambiciosos -pero con poca fortuna- agentes del FBI (Shawn y Marlon Wayans) se hacen pasar por mujeres, novatas en la alta sociedad, en el exclusivo complejo Hamptons para investigar un círculo de secuestros. Pero mientras preparan su actuación en el mayor acontecimiento social del año se encuentran que irrumpir en la alta sociedad es mucho más duro de lo que parecía.', 'imagen_white_chicks.jpg', 3, '2004', 'Keenen Ivory Wayans'),
(8, 'The Shining', 'Jack Torrance se traslada con su mujer y su hijo de siete años al impresionante hotel Overlook, en Colorado, para encargarse del mantenimiento de las instalaciones durante la temporada invernal, época en la que permanece cerrado y aislado por la nieve. Su objetivo es encontrar paz y sosiego para escribir una novela. Sin embargo, poco después de su llegada al hotel, al mismo tiempo que Jack empieza a padecer inquietantes trastornos de personalidad, se suceden extraños y espeluznantes fenómenos paranormales.', 'image_shining.jpg', 6, '1980', 'Stanley Kubrick'),
(9, 'The Godfather', 'América, años 40. Don Vito Corleone (Marlon Brando) es el respetado y temido jefe de una de las cinco familias de la mafia de Nueva York. Tiene cuatro hijos: Connie (Talia Shire), el impulsivo Sonny (James Caan), el pusilánime Fredo (John Cazale) y Michael (Al Pacino), que no quiere saber nada de los negocios de su padre. Cuando Corleone, en contra de los consejos de \'Il consigliere\' Tom Hagen (Robert Duvall), se niega a participar en el negocio de las drogas, el jefe de otra banda ordena su asesinato. Empieza entonces una violenta y cruenta guerra entre las familias mafiosas.', 'imagen_padrino.jpg', 7, '1972', 'Francis Ford Coppola'),
(70, 'Reservoir Dogs', 'Una banda organizada es contratada para atracar una empresa y llevarse unos diamantes. Sin embargo, antes de que suene la alarma, la policía ya está allí. Algunos miembros de la banda mueren en el enfrentamiento con las fuerzas del orden, y los demás se reúnen en el lugar convenido.', 'perros_calle.jpg', 7, '1992', 'Quentin Tarantino'),
(71, 'Vertigo', 'Scottie Fergusson (James Stewart) es un detective de la policía de San Francisco que padece de vértigo. Cuando un compañero cae al vacío desde una cornisa mientras persiguen a un delincuente, Scottie decide retirarse. Gavin Elster (Tom Helmore), un viejo amigo del colegio, lo contrata para un caso aparentemente muy simple: que vigile a su esposa Madeleine (Kim Novak), una bella mujer que está obsesionada con su pasado.', 'vertigo.jpg', 7, '1958', 'Alfred Hitchcock'),
(72, 'Parasite', 'Tanto Gi Taek (Song Kang-ho) como su familia están sin trabajo. Cuando su hijo mayor, Gi Woo (Choi Woo-sik), empieza a dar clases particulares en casa de Park (Lee Seon-gyun), las dos familias, que tienen mucho en común pese a pertenecer a dos mundos totalmente distintos, comienzan una interrelación de resultados imprevisibles.', 'parasite.jpg', 7, '2019', 'Bong Joon-ho'),
(73, 'Interstellar', 'Al ver que la vida en la Tierra está llegando a su fin, un grupo de exploradores dirigidos por el piloto Cooper (McConaughey) y la científica Amelia (Hathaway) emprende una misión que puede ser la más importante de la historia de la humanidad: viajar más allá de nuestra galaxia para descubrir algún planeta en otra que pueda garantizar el futuro de la raza humana.', 'interstellar.jpg', 7, '2014', 'Christopher Nolan'),
(74, 'The Dark Knight', 'Batman/Bruce Wayne (Christian Bale) regresa para continuar su guerra contra el crimen. Con la ayuda del teniente Jim Gordon (Gary Oldman) y del Fiscal del Distrito Harvey Dent (Aaron Eckhart), Batman se propone destruir el crimen organizado en la ciudad de Gotham. El triunvirato demuestra su eficacia, pero, de repente, aparece Joker (Heath Ledger), un nuevo criminal que desencadena el caos y tiene aterrados a los ciudadanos.', 'batman.jpg', 7, '2008', 'Christopher Nolan'),
(75, 'Nueve reinas', 'Buenos Aires. Juan y Marcos son dos estafadores de poca monta, uno joven y un veterano en el arte del timo, que casualmente se ven envueltos en un asunto que les puede hacer millonarios: tienen menos de un día para hacer una estafa que no puede fallar.', 'nueve_reinas.jpg', 7, '2000', 'Fabián Bielinsky'),
(76, 'Back to the Future. Part II', 'Aunque a Marty McFly todavía le falta tiempo para asimilar el hecho de estar viviendo dentro de la familia perfecta gracias a su anterior viaje en el tiempo, no le queda ni espacio para respirar cuando su amigo Doc aparece de improviso con la máquina del tiempo (mucho más modernizada), e insta a que le acompañen él y su novia a viajar al futuro para solucionar un problema con la ley que tendrá uno de sus futuros hijos. En la tremenda vorágine futurista, con todo lo que ello conlleva, del Hill Valley de 2015, la presencia de tales viajeros temporales causará un efecto mayor que el que iban a arreglar. Un almanaque deportivo y la posesión del secreto de la existencia de la máquina del tiempo por parte del siempre villano Biff Tannen, serán los ingredientes que conjugarán una causa-efecto en el pasado, en el presente y en el propio futuro, que hará que Marty y Doc se tengan que emplear a fondo para poner fin a la catástrofe a la que les lleva el destino.', 'back_future.jpg', 4, '1989', 'Robert Zemeckis'),
(77, 'Blade Runner 2049', 'Treinta años después de los eventos del primer film, un nuevo blade runner, K (Ryan Gosling) descubre un secreto profundamente oculto que podría acabar con el caos que impera en la sociedad. El descubrimiento de K le lleva a iniciar la búsqueda de Rick Deckard (Harrison Ford), un blade runner al que se le perdió la pista hace 30 años.', 'blade_runner.jpg', 4, '2017', 'Denis Villenueve'),
(78, 'Alien', 'De regreso a la Tierra, la nave de carga Nostromo interrumpe su viaje y despierta a sus siete tripulantes. El ordenador central, MADRE, ha detectado la misteriosa transmisión de una forma de vida desconocida, procedente de un planeta cercano aparentemente deshabitado. La nave se dirige entonces al extraño planeta para investigar el origen de la comunicación.', 'alien.jpg', 4, '1979', 'Ridley Scott'),
(79, 'The Matrix', 'Thomas Anderson es un brillante programador de una respetable compañía de software. Pero fuera del trabajo es Neo, un hacker que un día recibe una misteriosa visita..', 'matrix.jpg', 4, '1999', 'Hermanas Wachowski'),
(80, 'Groundhog Day', 'Phil, el hombre del tiempo de una cadena de televisión, va un año más a Punxstawnwey, a cubrir la información del festival del Día de la Marmota. En el viaje de regreso, Phil y su equipo se ven sorprendidos por una tormenta que los obliga a regresar a la pequeña ciudad. A la mañana siguiente, al despertarse, comprueba atónito que comienza otra vez el Día de la Marmota.', 'groundhog.jpg', 3, '1993', 'Harold Ramis'),
(81, 'Mrs. Doubtfire', 'Daniel Hillard es padre y esposo. Sus hijos lo consideran un padre maravilloso, pero su mujer está cansada de que se comporte como si también él fuera un niño. Tras un accidentado divorcio, aunque lucha con todas sus fuerzas para conseguir la custodia de los niños, el juez no se la concede. Decide entonces hacerse pasar por una señora mayor para poder ser, al menos, la canguro de sus hijos.', 'doubtfire.jpg', 3, '1993', 'Chris Columbus'),
(82, 'Dr. Strangelove, or How I Learned to Stop Worrying and Love the Bomb', 'Convencido de que los comunistas están contaminando los Estados Unidos, un general ordena, en un acceso de locura, un ataque aéreo nuclear sorpresa contra la Unión Soviética. Su ayudante, el capitán Mandrake, trata de encontrar la fórmula para impedir el bombardeo. Por su parte, el Presidente de los EE.UU. se pone en contacto con Moscú para convencer al gobierno soviético de que el ataque no es más que un estúpido error. Mientras tanto, el asesor del Presidente, un antiguo científico nazi, el doctor Strangelove, confirma la existencia de la “Máquina del Juicio Final”, un dispositivo de represalia soviético capaz de acabar con la humanidad para siempre.', 'strangelove.jpg', 3, '1964', 'Stanley Kubrick'),
(83, 'Ferris Bueller\'s Day Off', 'Un joven de 17 años decide disfrutar de unas vacaciones anticipadas aprovechando la ausencia de sus padres. Prepara minuciosamente un día dedicado enteramente a hacer todo lo que normalmente no puede hacer. Para ello contará, por supuesto, con la compañía de su mejor amigo y de su novia.', 'ferris.jpg', 3, '1986', 'John Hughes'),
(84, 'Borat', 'Sacha Baron Cohen, el peculiar protagonista de \"Ali G anda suelto\", interpreta a Borat, un reportero de Kazajistán. Por orden de su gobierno, el periodista va a Estados Unidos para rodar un documental pedagógico, que debe recoger las mejores enseñanzas de los USA para que su país las aproveche. Pero el trabajo no será tan fácil como parece...', 'borat.jpg', 3, '2006', 'Larry Charles'),
(85, 'Casablanca', 'Años 40. A consecuencia de la Segunda Guerra Mundial, Casablanca era una ciudad a la que llegaban huyendo del nazismo gente de todas partes: llegar era fácil, pero salir era casi imposible, especialmente si el nombre del fugitivo figuraba en las listas de la Gestapo, que presionaba a la autoridades francesas al mando del corrupto inspector Renault. En este caso, el objetivo de la policía secreta alemana es el líder checo y héroe de la resistencia Victor Laszlo, cuya única esperanza es Rick Blaine, propietario del \'Rick’s Café\' y antiguo amante de su mujer, Ilsa Lund. Rick e Ilsa se habían conocido en París, pero la entrada de las tropas alemanas en la capital francesa les separó.', 'casablanca.jpg', 2, '1942', 'Michael Curtiz'),
(86, 'When Harry Met Sally', 'Harry Burns (Billy Cristal) y Sally Albright (Meg Ryan) son dos estudiantes universitarios que se conocen por casualidad, cuando ella se ofrece a llevar Harry en su coche. Durante el viaje hablan sobre la amistad entre personas de diferente sexo y sus opiniones son absolutamente divergentes: mientras que Harry está convencido de que la amistad entre un hombre y una mujer es imposible, Sally cree lo contrario. A pesar de ello, pasan los años y su relación continúa. ', 'harry_met.jpg', 2, '1989', 'Rob Reiner'),
(87, 'About Time', 'Tim Lake (Domhnall Gleeson) es un joven de 21 años que descubre que puede viajar en el tiempo. Su padre (Bill Nighy) le cuenta que todos los hombres de la familia han tenido desde siempre ese don, el de regresar en el tiempo a un momento determinado, una y otra vez, hasta conseguir hacer \"lo correcto\". Así pues, Tim decide volver al pasado para intentar conquistar a Mary (Rachel McAdams), la chica de sus sueños.', 'about_time.jpg', 2, '2013', 'Richard Curtis'),
(88, '(500) Days of Summer', 'Tom aún sigue creyendo, incluso en este cínico mundo moderno, en la noción de un amor transformador, predestinado por el cosmos y que golpea como un rayo sólo una vez. Summer no cree lo mismo, para nada. La mecha se enciende desde el primer día, cuando Tom, un arquitecto en ciernes convertido en un sensiblero escritor de tarjetas de felicitación, se encuentra con Summer, la bella y fresca nueva secretaria de su jefe. Aunque aparentemente está fuera de su alcance, Tom pronto descubre que tienen un montón de cosas en común. La historia de Tom y Summer cubre desde el enamoramiento, las citas y el sexo hasta la separación, las recriminaciones y la redención, todo lo cual se suma al caleidoscópico retrato del porqué y el cómo seguimos esforzándonos de modo tan risible y rastrero para encontrar sentido al amor… y esperar convertirlo en realidad.', '500_days.jpg', 2, '2009', 'Marc Webb'),
(89, 'Psycho', 'Marion Crane, una joven secretaria, tras cometer el robo de un dinero en su empresa, huye de la ciudad y, después de conducir durante horas, decide descansar en un pequeño y apartado motel de carretera regentado por un tímido joven, Norman Bates, que vive en la casa de al lado con su madre.', 'psycho.jpg', 6, '1960', 'Alfred Hitchcock'),
(90, 'The Sixth Sense', 'El doctor Malcom Crowe es un conocido psicólogo infantil de Philadelphia que vive obsesionado por el doloroso recuerdo de un joven paciente desequilibrado al que fue incapaz de ayudar. Cuando conoce a Cole Sear, un aterrorizado y confuso niño de ocho años que necesita tratamiento, ve que se le presenta la oportunidad de redimirse haciendo todo lo posible por ayudarlo. Sin embargo, el doctor Crowe no está preparado para conocer la terrible verdad acerca del don sobrenatural de su paciente: recibe visitas no deseadas de espíritus atormentados.', 'sixth_sense.jpg', 6, '1999', 'M. Night Shyamalan'),
(91, 'Misery', 'Un escritor llamado Paul Sheldon (James Caan) lleva años malgastando su talento con unas románticas historias, de gran éxito comercial, cuya protagonista es una mujer llamada Misery. Decidido a acabar con esta situación, mata al personaje y se refugia en Colorado para escribir una novela seria. Terminado su trabajo, emprende el regreso, pero en una carretera de montaña, pierde el control de su coche y sufre un grave accidente. Annie Wilkes (Kathy Bates), una brusca e impetuosa mujer, gran admiradora suya, lo rescata, se lo lleva a su casa y lo cuida con esmero. Obsesionada con el personaje de Misery, retiene a Sheldon para obligarlo a escribir una nueva historia en la que resucite al personaje. ', 'misery.jpg', 6, '1990', 'Rob Reiner'),
(92, 'John Wick', 'En Nueva York, John Wick, un asesino a sueldo retirado, vuelve otra vez a la acción para vengarse de los gángsters que le quitaron todo.', 'john_wick.jpg', 5, '2014', 'Chad Stahelski, David Leitch'),
(93, 'Mad Max: Fury Road', 'Perseguido por su turbulento pasado, Mad Max cree que la mejor forma de sobrevivir es ir solo por el mundo. Sin embargo, se ve arrastrado a formar parte de un grupo que huye a través del desierto en un War Rig conducido por una Emperatriz de élite: Furiosa. Escapan de una Ciudadela tiranizada por Immortan Joe, a quien han arrebatado algo irreemplazable. Enfurecido, el Señor de la Guerra moviliza a todas sus bandas y persigue implacablemente a los rebeldes en una \"guerra de la carretera\" de altas revoluciones... Cuarta entrega de la saga post-apocalíptica que resucita la trilogía que a principios de los ochenta protagonizó Mel Gibson.', 'mad_max.jpg', 5, '2015', 'George Miller'),
(94, 'Top Gun: Maverick', 'Después de más de treinta años de servicio como uno de los mejores aviadores de la Armada, Pete \"Mavericks\" Mitchel (Tom Cruise) se encuentra donde siempre quiso estar: superando los límites como un valiente piloto de pruebas y esquivando el ascenso de rango, que no le dejaría volar emplazándolo en tierra. Cuando es destinado a la academia de Top Gun con el objetivo de entrenar a los pilotos de élite para realizar una peligrosa misión en territorio enemigo, Maverick se encuentra allí con el joven teniente Bradley Bradshaw (Miles Teller), el hijo de su difunto amigo \"Goose\".', 'top_gun.jpg', 5, '2022', 'Joseph Kosinski'),
(95, 'Kill Bill: Volume 1', 'El día de su boda, una asesina profesional (Thurman) sufre el ataque de algunos miembros de su propia banda, que obedecen las órdenes de Bill (David Carradine), el jefe de la organización criminal. Logra sobrevivir al ataque, aunque queda en coma. Cuatro años después despierta dominada por un gran deseo de venganza.', 'kill_bill.jpg', 5, '2003', 'Quentin Tarantino');

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
