db.movies.find(
    {},
    {
        "_id" : true,
        "title" : true
    }
)

---------------------------------

db.movies.find(
    {
    	"writer.name" : "Quentin Tarantino"
    },
    {
        "title" : true,
        "year"	: true
    }
)

------------------------------

db.movies.find(
    {
    	year	: {
            $gte: 1989,
            $lte : 1999
        }
    },
    {
        "title" : true,
        "writer.name" : true
    }
)

-------------------------------

db.movies.find(
    {
    	year	: {
            $gte: 2000,
            $lte : 2010
        }
    },
    {
        _id : false,
        "actors.name" : true,
        "actors.hometown" : true
    }
)

-------------------------------

db.movies.find(
    {
    	synopsis : /Bilbo/
    },
    {
        "_id" : false,
    }
)

------------------------------

db.movies.find(
    {
    	$or : [
            { synopsis : /dwarves/},
            { synopsis : /hobbit/ }
        ]
    },
    {    
    }
)

------------------------------

db.movies.find(
    {
    	$and : [
            { synopsis : /gold/},
            { synopsis : /dragon/ }
        ]
    },
    {    
    }
)

-------------------------------

db.movies.find(
    {
        "actors.name" : "Brad Pitt"
    },
    {
        
    }
)

-----------------------------

db.movies.find(
    {
        "actors.age" : { $gt: 60}
    },
    {
        
    }
)

-----------------------------

db.movies.find(
    {
        "actors.children" : { $lt: 3},
        "actors.hometown" : "Los Angeles"
    },
    {
        
    }
)

-----------------------------

db.movies.find(
    { 
        "actors.children" : 0,
    }, 
    { 
        _id : false, 
        title : true,
        actors : { 
            $elemMatch : { 
                children : { $gte : 4}
            } 
        } 
    } 
) 

-----------------------------

db.movies.find(
    { "actors.hometown" : "Los Angeles"},
    { 
        _id : false,
        "actors.$": true,
   
    } 
) 

----------------------------


db.movies.find(
    { "actors.name" : "Brad Pitt"},
    { 
        _id : false,
        actors : { 
            $elemMatch : { 
                name : "Diane Kruger"
            } 
        } 
    } 
) 

----------------------------

db.movies.update( 
    { 
        "actors.hometown" : "Newton"
    }, 
    { 
        $set : { 
            "actors.$.hometown":  "Copernic" 
        } 
    },
    {
        multi : true
    } 
)

----------------------------

db.movies.update( 
    { 
        "actors.hometown" : "Brad Pitt"
    }, 
    { 
        $set : { 
            "actors.$.age":  56 
        } 
    },
    {
        multi : true
    } 
)

----------------------------

db.movies.createIndex( { "actors.name" : 1 } )

---------------------------