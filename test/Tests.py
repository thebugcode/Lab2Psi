__author__ = 'Dan'
import unittest
import JSONBuilder
import DatabaseManager
import CarObject

###
"""Unit test, test the Json class functionality.If we try to build an object with the some values it should give us the Json form"""
class TestJson(unittest.TestCase):
    def test_JSON(self):
        json=JSONBuilder.JSONBuilder()
        object = json.buildJSON([1,5999])
        print object
        self.assertItemsEqual("{\"Pret\": 5999, \"ID\": 1}",object)
#test the CarObjectClass
"""The CarObjectClass returns an object with a reference to a dictionary, given a dictionary in the constructor.It might seem redundant but the copying
is done by value and future changes might completely change the way this class works"""
class TestObject(unittest.TestCase):
    def test_OBJECT(self):
        dictionary = {"Producator":"Mercedes","Caroserie":"Sedan","Model":"C180","AnProductie":1999,"VolumMotor":1800,
                      "Pret":8000,"Carburant":"Benzina","Link":"http://www.google.ro"}
        object = CarObject.carObject(dictionary)

        self.assertItemsEqual(dictionary.values(),[object._Producator,object._Caroserie,
                                                   object._Model,object._AnProductie,object._VolumMotor
                                                    ,object._Pret,object._Carburant,object._Link])
"""Given a request comes from the user it will be parsed by the database. The expected results is an SQL interpretation of the REST querry."""
class TestDB(unittest.TestCase):
    def test_DB(self):
        try:
            manager = DatabaseManager.DatabaseManager()
            request= DatabaseManager.DatabaseManager.getSQLqueryFromREST('GET /AutomobileVanzare?Producator=Mercedes&Model=C200&Caroserie=hatchback')
            list = manager.SelectFromDatabase(request)
            print request
            test = 'SELECT * FROM AutomobileVanzare WHERE Producator=\'Mercedes\' AND Model=\'C200\' AND Caroserie=\'hatchback\' '
            self.assertMultiLineEqual(request,test)

            print "Cererea este",request

        except:
            self.assertFalse(True)



class Request(unittest.TestCase):
    def test_request(self):
        request = 'GET /AutomobileVanzare?Pret=1000:5000&Caroserie="Alo"'
        try:
            [theRequest,arguments]=  DatabaseManager.DatabaseManager.split(request,["?"])
        except:
            self.assertFalse(True)
        try:
            [verb,database]=DatabaseManager.DatabaseManager.split(theRequest,["/"])
        except:
            self.assertFalse(True)
""" If the client connects to the server and enters this specific request he should receive only one object in response"""
class testClient(unittest.TestCase):
    def test_client(self):
        request = 'GET /AutomobileVanzare?Producator=Mercedes&Model=C180&Caroserie=hatchback'
        db = DatabaseManager('localhost')

        # Get SQL Query from REST
        sqlQuery = DatabaseManager.getSQLqueryFromREST(restQuery)

        # Get the result from SQL Server
        carObjects = db.SelectFromDatabase(sqlQuery)

        #the object which i expect to receive is
        dictionary = {"Producator":"Mercedes","Caroserie":"Sedan","Model":"C180","AnProductie":1999,"VolumMotor":1800,
                     "Pret":8000,"Carburant":"Benzina","Link":"http://www.google.ro"}
        object = CarObject.carObject(dictionary)
        self.assertEqual(dictionary.values(),carObjects[0].values())

if __name__ == '__main__':
    unittest.main()

