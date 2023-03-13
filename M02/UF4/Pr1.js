var Peli1 = {
title : "Fight Club",
writer : { name : "Chuck Palahniuk", age : 57, children : 0, hometown : "Burbank" },
year : 1999,
rating : 9,
actors : [
    { name : "Brad Pitt", age : 55, children : 6, hometown : "Springfield" },
    { name : "Edward Norton", age : 49, children : 1, hometown : "Columbia" }
]
};

var Peli2 ={

title : "Pulp Fiction",
writer : { name : "Quentin Tarantino", age : 56, children : 0, hometown : "Knoxville" },
year : 1994,
rating : 9,
actors : [
    { name : "John Travolta", age : 65, children : 3, hometown : "Los Angeles" },
    { name : "Uma Thurman", age : 48, children : 3, hometown : "Boston" }
]
};

var Peli3 = {

title : "Inglorious Basterds",
writer : { name : "Quentin Tarantino", age : 56, children : 0, hometown : "Knoxville" },
year : 2009,
rating : 8,
actors : [
    { name : "Brad Pitt", age : 55, children : 6, hometown : "Springfield" },
    { name : "Diane Kruger", age : 42, children : 1, hometown : "New York" },
    { name : "Eli Roth", age : 46, children : 0, hometown : "Newton" }
]
};

var Peli4 = {
title : "The Hobbit: An Unexpected Journey",
writer : { name : "J.R.R. Tolkein", age : 81, children : 4, hometown : "Bloemfontein" },
year : 2012,
rating : 7,
franchise : "The Hobbit"
};

var Peli5 = {
title : "The Hobbit: The Desolation of Smaug",
writer : { name : "J.R.R. Tolkein", age : 81, children : 4, hometown : "Bloemfontein" },
year : 2013,
rating : 6,
franchise : "The Hobbit"
};

var Peli6 = {
title : "The Hobbit: The Battle of the Five Armies",
writer : { name : "J.R.R. Tolkein", age : 81, children : 4, hometown : "Bloemfontein" },
year : 2014,
rating : 6,
franchise : "The Hobbit",
synopsis : "Bilbo and Company are forced to engage in a war against an array of combatants and keep the Lonely Mountain from falling into the hands of a rising darkness."
};

db.movies.insert( [ Peli1, Peli2, Peli3, Peli4, Peli5, Peli6 ] );


---------------------------------

db.movies.find();

---------------------------------

db.movies.find().sort( { year : -1 } );

---------------------------------

db.movies.find().sort( { title : 1 } );

---------------------------------

db.movies.find().limit(4);

---------------------------------

db.movies.find().skip(3);

---------------------------------


db.movies.find().skip(3).limit(2);

---------------------------------

db.movies.find( { "writer.name" : "Quentin Tarantino" } );

---------------------------------

db.movies.find().count();

--------------------------------

db.movies.find( { "writer.name" : "Quentin Tarantino" } ).count();

--------------------------------

db.movies.find( { franchise : "The Hobbit" } );

------------------------------- 

db.movies.findOne( { franchise : "The Hobbit" } );

-------------------------------

db.movies.find( { "writer.name" : "Quentin Tarantino", year : 1994 } );

------------------------------

db.movies.find( { "writer.name" : { $ne : "Quentin Tarantino" } } );

------------------------------

db.movies.find().limit(3).sort( { rating : -1 } );

------------------------------

db.movies.find( { rating : { $gte : 7 , $lte : 9 } } );

------------------------------

db.movies.find( { year : { $gte : 1990 , $lte : 1999 } } 

------------------------------

db.movies.find( { year : { $gte : 2000 , $lte : 2010 } } );

===================================================================================================================================================

db.movies.update( 
	{ 
		title : "The Hobbit: An Unexpected Journey"
	}, 
	{ // Objeto JSON donde se especifican las modificaciones
		$set : {
			synopsis :  "A reluctant hobbit, Bilbo Baggins, sets out to the Lonely Mountain with a spirited group of dwarves to reclaim their mountain home - and the gold within it - from the dragon Smaug."
		}
	}
)

--------------------------------

db.movies.update( 
	{ 
		title : "The Hobbit: The Desolation of Smaug"
	}, 
	{ // Objeto JSON donde se especifican las modificaciones
		$set : {
			synopsis :  "The dwarves, along with Bilbo Baggins and Gandalf the Grey, continue their quest to reclaim Erebor, their homeland, from Smaug. Bilbo Baggins is in possession of a mysterious and magical ring."
		}
	}
)

--------------------------------

db.movies.update( 
	{ 
		title : "Pulp Fiction"
	}, 
	{ // Objeto JSON donde se especifican las modificaciones
		$push : {
			actors :  { name : "Samuel L. Jackson", age : 70.0, children : 1.0, hometown : "Los Angeles"} 
		}
	}
)

---------------------------------

db.movies.update( 
	{ 
		title : "Fight Club"
	}, 
	{ // Objeto JSON donde se especifican las modificaciones
		$push : {
			actors :  {
                $each : [ { name : "Helena Bonham Carter", age : 52, children : 2, hometown : "Hampstead" } ],
                $position : 1
            }
        }
	}
)

------------------------------

var Peli7 = {
title : "Pee Wee Herman's Big Adventure",
writer : { name : "	Tim Burton", age : 62, children : 2, hometown : "Burbank" },
year : 1985,
rating : 6,
actors : []
};

var Peli8 = {
title : "Avatar",
writer : { name : "James Francis Cameron", age : 66, children : 4, hometown : "Kapuskasing" },
year : 2009,
rating : 7,
actors : []
}

db.alumnes.insert( [Peli7],[Peli8] )

---------------------------------

db.movies.update( 
	{ 
		"actors.name" : "Brad Pitt"
	}, 
	{
		$set : { rating : 10}
	},
	{
        multi : true
    }
)

--------------------------------

db.movies.update( 
	{ 
		title : "Inglorious Basterds"
	},
	{ // Objeto JSON donde se especifican las modificaciones
		$push : {
			actors :{
                $each : [ ],
                $sort : -1
            }
		}
	}
)
    

-------------------------------

db.movies.update( 
	{ 
		title : "Pee Wee Herman's Big Adventure"
	}, 
	{ // Objeto JSON donde se especifican las modificaciones
		$push : {
			actors : { 		[  { name : "E. G. Daily", age : 59, children : 2, hometown : "Los Angeles" },  { name : "Mark Holton", age : 63, children : 2, hometown : "Oklahoma City" }	]
			}
		}
	}
)
db.movies.update( 
	{ 
		title : "Avatar"
	}, 
	{ // Objeto JSON donde se especifican las modificaciones
		$set : {
			actors : [
    { name : "Sam Worthington", age : 44, children : 3, hometown : "Godalming" },
    { name : "Zoe Saldana", age : 42, children : 3, hometown : "Passaic" }
			]
		}
	}
)