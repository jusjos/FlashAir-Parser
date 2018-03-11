# FlashAir-Parser
Some handy Objective-C code that helps parse image files in Toshiba's FlashAir Wifi SD cards.



Toshiba's Flashair devices can be used as wireless hotspots and are able to stream files to mobile devices like iPhones. The Flashair iOS documentation includes some methods that return information about files on the flashair as a single string. FAParser includes code that parses this data string into a custom object ordering all images locations into an Objective-C array. Images can then be downloaded to the iOS device one by one using the image paths contained in the array.

To use:
  Add all files in FAParser. 
  Import "FAParser.h" in your project.
  Create an object of FAParser and call the relevant method.
