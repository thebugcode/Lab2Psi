#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      Vlad
#
# Created:     03.11.2012
# Copyright:   (c) Vlad 2012
# Licence:     <your licence>
#-------------------------------------------------------------------------------

import unittest
from JSONBuilder import JSONBuilder
from CarObject import CarObject
import socket

class CarObjectTest(unittest.TestCase):
  def testCarObject(self):
    aDictionary = { "Producator":"Mercedes","Caroserie":"Sedan","Model":"C180",
                    "AnProductie":1999,"VolumMotor":1800,"Pret":8000,
                    "Carburant":"Benzina","Link":"http://www.google.ro"}
    car = CarObject(aDictionary)
    self.assertEqual(car._AnProductie, 1999)
    self.assertEqual(car._Carburant, "Benzina")
    self.assertEqual(car._Pret, 8000)


class JSONBuilderTest(unittest.TestCase):
  def testSum(self):
    aDictionary = { "Producator":"Mercedes","Caroserie":"Sedan","Model":"C180",
                    "AnProductie":1999,"VolumMotor":1800,"Pret":8000,
                    "Carburant":"Benzina","Link":"http://www.google.ro" }
    car = CarObject(aDictionary)
    self.assertEqual(car._AnProductie, 1999)
    self.assertEqual(car._Carburant, "Benzina")

class ConnectionTest(unittest.TestCase):
  def testConnection(self):
    clientSocket = socket.socket()
    clientSocket.connect(("localhost", 2707))
    try:
      msg = clientSocket.recv(1024)
    except:
      msg = "Error"

    self.assertEqual(msg, "Welcome")

if __name__ == '__main__':
  unittest.main()
