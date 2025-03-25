CREATE TABLE IF NOT EXISTS cities (
id INT AUTO_INCREMENT PRIMARY KEY,
state_abbr VARCHAR(2),
name VARCHAR(100),
population INT,
FOREIGN KEY (state_abbr) REFERENCES states(abbreviation)
);

INSERT INTO cities (state_abbr, name, population) VALUES
('AL', 'Huntsville', 215006),
('AL', 'Birmingham', 197575),
('AL', 'Montgomery', 200603),
('AL', 'Mobile', 187041),
('AL', 'Tuscaloosa', 101129),
('AK', 'Anchorage', 291247),
('AK', 'Fairbanks', 32325),
('AK', 'Juneau', 31784),
('AK', 'Sitka', 8497),
('AK', 'Ketchikan', 8225),
('AZ', 'Phoenix', 1680992),
('AZ', 'Tucson', 542629),
('AZ', 'Mesa', 504258),
('AZ', 'Chandler', 275987),
('AZ', 'Scottsdale', 268839),
('AR', 'Little Rock', 201998),
('AR', 'Fort Smith', 89142),
('AR', 'Fayetteville', 93512),
('AR', 'Springdale', 84455),
('AR', 'Jonesboro', 79552),
('CA', 'Los Angeles', 3898747),
('CA', 'San Diego', 1386932),
('CA', 'San Jose', 1021795),
('CA', 'San Francisco', 815201),
('CA', 'Fresno', 542107),
('CO', 'Denver', 711463),
('CO', 'Colorado Springs', 489529),
('CO', 'Aurora', 398254),
('CO', 'Fort Collins', 170243),
('CO', 'Lakewood', 157429),
('CT', 'Bridgeport', 148654),
('CT', 'New Haven', 134023),
('CT', 'Stamford', 135470),
('CT', 'Hartford', 121054),
('CT', 'Waterbury', 114403),
('DE', 'Wilmington', 70935),
('DE', 'Dover', 39438),
('DE', 'Newark', 33147),
('DE', 'Middletown', 23982),
('DE', 'Smyrna', 12583),
('FL', 'Jacksonville', 954614),
('FL', 'Miami', 449514),
('FL', 'Tampa', 403364),
('FL', 'Orlando', 316081),
('FL', 'St. Petersburg', 261256),
('GA', 'Atlanta', 499127),
('GA', 'Columbus', 206922),
('GA', 'Augusta', 202081),
('GA', 'Macon', 157346),
('GA', 'Savannah', 147088),
('HI', 'Honolulu', 345510),
('HI', 'East Honolulu', 50000),
('HI', 'Pearl City', 45000),
('HI', 'Hilo', 44000),
('HI', 'Kailua', 38000),
('ID', 'Boise', 237446),
('ID', 'Meridian', 129000),
('ID', 'Nampa', 108000),
('ID', 'Idaho Falls', 67000),
('ID', 'Pocatello', 56000),
('IL', 'Chicago', 2670405),
('IL', 'Aurora', 179266),
('IL', 'Naperville', 149104),
('IL', 'Joliet', 147344),
('IL', 'Rockford', 146491),
('IN', 'Indianapolis', 882039),
('IN', 'Fort Wayne', 270402),
('IN', 'Evansville', 117298),
('IN', 'South Bend', 103353),
('IN', 'Carmel', 102020),
('IA', 'Des Moines', 214133),
('IA', 'Cedar Rapids', 137710),
('IA', 'Davenport', 101724),
('IA', 'Sioux City', 82462),
('IA', 'Iowa City', 75994),
('KS', 'Wichita', 395699),
('KS', 'Overland Park', 200000),
('KS', 'Kansas City', 154000),
('KS', 'Olathe', 143000),
('KS', 'Topeka', 126000),
('KY', 'Louisville', 617638),
('KY', 'Lexington', 322570),
('KY', 'Bowling Green', 74000),
('KY', 'Owensboro', 60000),
('KY', 'Covington', 41000),
('LA', 'New Orleans', 376971),
('LA', 'Baton Rouge', 222000),
('LA', 'Shreveport', 187000),
('LA', 'Lafayette', 122000),
('LA', 'Lake Charles', 83000),
('ME', 'Portland', 68109),
('ME', 'Lewiston', 36492),
('ME', 'Bangor', 31792),
('ME', 'South Portland', 25880),
('ME', 'Auburn', 23314),
('MD', 'Baltimore', 576498),
('MD', 'Columbia', 104000),
('MD', 'Germantown', 91000),
('MD', 'Silver Spring', 82000),
('MD', 'Waldorf', 81000),
('MA', 'Boston', 692600),
('MA', 'Worcester', 206000),
('MA', 'Springfield', 154000),
('MA', 'Lowell', 115000),
('MA', 'Cambridge', 117000),
('MI', 'Detroit', 620376),
('MI', 'Grand Rapids', 202000),
('MI', 'Warren', 139000),
('MI', 'Sterling Heights', 135000),
('MI', 'Ann Arbor', 124000),
('MN', 'Minneapolis', 429606),
('MN', 'St. Paul', 311000),
('MN', 'Rochester', 122000),
('MN', 'Duluth', 86000),
('MN', 'Bloomington', 86000),
('MS', 'Jackson', 149761),
('MS', 'Gulfport', 73000),
('MS', 'Southaven', 56000),
('MS', 'Biloxi', 49000),
('MS', 'Hattiesburg', 47000),
('MO', 'Kansas City', 508394),
('MO', 'St. Louis', 300000),
('MO', 'Springfield', 170000),
('MO', 'Columbia', 128000),
('MO', 'Independence', 123000),
('MT', 'Billings', 119960),
('MT', 'Missoula', 76000),
('MT', 'Great Falls', 58000),
('MT', 'Bozeman', 54000),
('MT', 'Butte', 34000),
('NE', 'Omaha', 486051),
('NE', 'Lincoln', 293000),
('NE', 'Bellevue', 64000),
('NE', 'Grand Island', 51000),
('NE', 'Kearney', 34000),
('NV', 'Las Vegas', 646790),
('NV', 'Henderson', 329000),
('NV', 'Reno', 264000),
('NV', 'North Las Vegas', 265000),
('NV', 'Sparks', 108000),
('NH', 'Manchester', 115644),
('NH', 'Nashua', 89000),
('NH', 'Concord', 44000),
('NH', 'Dover', 32000),
('NH', 'Rochester', 31000),
('NJ', 'Newark', 311549),
('NJ', 'Jersey City', 292000),
('NJ', 'Paterson', 159000),
('NJ', 'Elizabeth', 137000),
('NJ', 'Lakewood', 135000),
('NM', 'Albuquerque', 562599),
('NM', 'Las Cruces', 111000),
('NM', 'Rio Rancho', 104000),
('NM', 'Santa Fe', 88000),
('NM', 'Roswell', 48000),
('NY', 'New York', 8336817),
('NY', 'Buffalo', 276807),
('NY', 'Rochester', 211328),
('NY', 'Yonkers', 211259),
('NY', 'Syracuse', 146555),
('NC', 'Charlotte', 897720),
('NC', 'Raleigh', 474000),
('NC', 'Greensboro', 299000),
('NC', 'Durham', 285000),
('NC', 'Winston-Salem', 252000),
('ND', 'Fargo', 132491),
('ND', 'Bismarck', 75000),
('ND', 'Grand Forks', 58000),
('ND', 'Minot', 48000),
('ND', 'West Fargo', 39000),
('OH', 'Columbus', 913921),
('OH', 'Cleveland', 372000),
('OH', 'Cincinnati', 309000),
('OH', 'Toledo', 267000),
('OH', 'Akron', 189000),
('OK', 'Oklahoma City', 687725),
('OK', 'Tulsa', 412000),
('OK', 'Norman', 132000),
('OK', 'Broken Arrow', 113000),
('OK', 'Lawton', 92000),
('OR', 'Portland', 635067),
('OR', 'Eugene', 178000),
('OR', 'Salem', 177000),
('OR', 'Gresham', 114000),
('OR', 'Hillsboro', 107000),
('PA', 'Philadelphia', 1584064),
('PA', 'Pittsburgh', 302000),
('PA', 'Allentown', 125000),
('PA', 'Erie', 94000),
('PA', 'Reading', 94000),
('RI', 'Providence', 189697),
('RI', 'Cranston', 82000),
('RI', 'Warwick', 81000),
('RI', 'Pawtucket', 72000),
('RI', 'East Providence', 47000),
('SC', 'Columbia', 137000),
('SC', 'Charleston', 153000),
('SC', 'North Charleston', 117000),
('SC', 'Mount Pleasant', 95000),
('SC', 'Rock Hill', 75000),
('SD', 'Sioux Falls', 202078),
('SD', 'Rapid City', 77000),
('SD', 'Aberdeen', 29000),
('SD', 'Brookings', 24000),
('SD', 'Watertown', 22000),
('TN', 'Nashville', 715891),
('TN', 'Memphis', 633000),
('TN', 'Knoxville', 192000),
('TN', 'Chattanooga', 182000),
('TN', 'Clarksville', 170000),
('TX', 'Houston', 2304580),
('TX', 'San Antonio', 1469845),
('TX', 'Dallas', 1297907),
('TX', 'Austin', 1016343),
('TX', 'Fort Worth', 956709),
('UT', 'Salt Lake City', 204657),
('UT', 'West Valley City', 140000),
('UT', 'Provo', 114000),
('UT', 'West Jordan', 116000),
('UT', 'Orem', 97000),
('VT', 'Burlington', 44595),
('VT', 'South Burlington', 20000),
('VT', 'Rutland', 16000),
('VT', 'Barre', 9000),
('VT', 'Montpelier', 8000),
('VA', 'Virginia Beach', 456014),
('VA', 'Chesapeake', 252000),
('VA', 'Arlington', 238000),
('VA', 'Norfolk', 233000),
('VA', 'Richmond', 229000),
('WA', 'Seattle', 737015),
('WA', 'Spokane', 229000),
('WA', 'Tacoma', 223000),
('WA', 'Vancouver', 192000),
('WA', 'Bellevue', 150000),
('WV', 'Charleston', 48364),
('WV', 'Huntington', 46000),
('WV', 'Morgantown', 31000),
('WV', 'Parkersburg', 30000),
('WV', 'Wheeling', 27000),
('WI', 'Milwaukee', 563305),
('WI', 'Madison', 273000),
('WI', 'Green Bay', 107000),
('WI', 'Kenosha', 100000),
('WI', 'Racine', 77000),
('WY', 'Cheyenne', 65332),
('WY', 'Casper', 59000),
('WY', 'Laramie', 32000),
('WY', 'Gillette', 31000),
('WY', 'Rock Springs', 23000);