Q1 : Create a list of integers and find the longest subsequence of consecutive numbers in the list?


void main() {
  List<int> numbers = [1, 3, 5, 4, 6, 8, 9, 10, 11, 12, 13, 2, 7];
  List<int> subsequence = [];
  int maxLength = 0;
  int currLength = 1;
  
  numbers.sort(); // Sort the list to make finding consecutive numbers easier.

  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] == numbers[i - 1] + 1) {
      // If the current number is consecutive to the previous number,
      // add it to the current subsequence and increment the current length.
      currLength++;
      subsequence.add(numbers[i]);
    } else {
      // If the current number is not consecutive to the previous number,
      // check if the current subsequence is longer than the longest subsequence found so far.
      if (currLength > maxLength) {
        maxLength = currLength;
        subsequence.insert(0, numbers[i - currLength]); // Add the starting number of the subsequence to the front.
      }
      currLength = 1; // Reset the current length and subsequence.
      subsequence = [];
      }
  }

  // If the last subsequence is longer than the longest subsequence found so far,
  // update the longest subsequence and starting number.
  if (currLength > maxLength) {
    maxLength = currLength;
    subsequence.insert(0, numbers[numbers.length - currLength]);
  }

  print("Longest subsequence: $subsequence (length: $maxLength)");
}

Q2: Create a map that associates the names of cities with their latitude and longitude coordinates.
 Given a starting and ending city, find the shortest distance between them (you can assume a spherical Earth).

mport 'dart:math';

void main() {
  // Create a map of cities with their coordinates
  final cityCoords = {
    'New York': [40.7128, -74.0060],
    'Los Angeles': [34.0522, -118.2437],
    'Chicago': [41.8781, -87.6298],
    'Houston': [29.7604, -95.3698],
    'Philadelphia': [39.9526, -75.1652],
    'Phoenix': [33.4484, -112.0740],
    'San Antonio': [29.4241, -98.4936],
    'San Diego': [32.7157, -117.1611],
    'Dallas': [32.7767, -96.7970],
    'San Jose': [37.3382, -121.8863],
  };
  
  // Specify the starting and ending cities
  final startCity = 'New York';
  final endCity = 'Los Angeles';
  
  // Calculate the shortest distance between the two cities
  final distance = calculateDistance(cityCoords[startCity]!, cityCoords[endCity]!);
  print('The shortest distance between $startCity and $endCity is ${distance.toStringAsFixed(2)} km.');
}

// Calculates the distance between two points on a sphere using the Haversine formula
double calculateDistance(List<double> coord1, List<double> coord2) {
  const R = 6371; // Radius of the Earth in kilometers
  final lat1 = radians(coord1[0]);
  final lon1 = radians(coord1[1]);
  final lat2 = radians(coord2[0]);
  final lon2 = radians(coord2[1]);
  final dlat = lat2 - lat1;
  final dlon = lon2 - lon1;
  final a = sin(dlat / 2) * sin(dlat / 2) +
      cos(lat1) * cos(lat2) * sin(dlon / 2) * sin(dlon / 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));
  final d = R * c;
  return d;
}


// Converts degrees to radians
double radians(double degrees) {
  return degrees * pi / 180;
}


Q3: Create a list of maps, where each map represents a product with a name, price, and quantity. 
Sort the list by the total cost of each product (price x quantity) in descending order.

void main() {
  List<Map<String, dynamic>> products = [
    {"name": "Product 1", "price": 10.0, "quantity": 2},
    {"name": "Product 2", "price": 5.0, "quantity": 5},
    {"name": "Product 3", "price": 2.0, "quantity": 10},
    {"name": "Product 4", "price": 8.0, "quantity": 3},
    {"name": "Product 5", "price": 15.0, "quantity": 1},
  ];

  products.sort((a, b) => (b["price"] * b["quantity"]).compareTo(a["price"] * a["quantity"]));
  print(products);
}

Q3: Create a map that associates the names of countries with their population and area. 
Find the top 5 largest countries by population density (population / area).

void main() {
  Map<String, Map<String, double>> countries = {
    'China': {'population': 1439323776, 'area': 9706961},
    'India': {'population': 1380004385, 'area': 3287590},
    'United States': {'population': 331002651, 'area': 9372610},
    'Indonesia': {'population': 273523615, 'area': 1904569},
    'Pakistan': {'population': 220892340, 'area': 881912},
    // Add more countries and data here
  };
  
  // Find the top 5 largest countries by population density
  List<MapEntry<String, double>> sortedCountries = countries.entries
      .map((entry) => MapEntry(entry.key, entry.value['population'] / entry.value['area']))
      .toList()
      ..sort((a, b) => b.value.compareTo(a.value))
      ..take(5);
  
  // Print the results
  print('Top 5 largest countries by population density:');
  sortedCountries.forEach((entry) => print('${entry.key}: ${entry.value}'));
}
 

Q4: Create a list of strings and find the longest common subsequence (substring) among all the strings in the list.


void main() {
  List<String> strings = ["abcdefg", "abdeg", "abcdfgh", "abc"];

  String lcs = findLongestCommonSubsequence(strings);

  print("Longest common subsequence: $lcs");
}

String findLongestCommonSubsequence(List<String> strings) {
  int shortestStringIndex = 0;

  // Find the shortest string in the list
  for (int i = 1; i < strings.length; i++) {
    if (strings[i].length < strings[shortestStringIndex].length) {
      shortestStringIndex = i;
    }
  }

  String shortestString = strings[shortestStringIndex];
  int shortestStringLength = shortestString.length;
  String lcs = "";

  // Iterate through each character of the shortest string
  for (int i = 0; i < shortestStringLength; i++) {
    // Check if the character is present in all the strings
    bool presentInAll = true;

    for (int j = 0; j < strings.length; j++) {
      if (j == shortestStringIndex) {
        continue;
      }

      if (!strings[j].contains(shortestString[i])) {
        presentInAll = false;
        break;
      }
    }

    // If the character is present in all the strings, add it to the LCS
    if (presentInAll) {
      lcs += shortestString[i];
    }
  }

  return lcs;
}









