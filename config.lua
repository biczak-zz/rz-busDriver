Config = {}

Config.jobName = 'busDriver'
Config.menuTitle = 'Bus Driver'
Config.menuSubtitle = 'Select a shift option'

Config.locationMarker = {
  id = 1,
  color = { red = 112, green = 62, blue = 188, alpha = 255 },
  radius = 1.0,
  isRotating = false,
}

Config.vehicleSpawnMarker = {
	id = 1,
	color = { red = 112, green = 62, blue = 188, alpha = 255 },
	radius = 2.0,
	isRotating = false
}

Config.jobLocation = {
  x = 455.62915039063,
  y = -597.40563964844,
  z = 28.535717103149,
  heading = 71.303779602051,
  name = 'Dashound Bus Center',
}

Config.shifts = {
  {
    id = 0,
    name = 'Cancel Current Shift',
    payment = 0,
  },
  {
    id = 1,
    name = 'Los Santos Transit',
    vehicleModel = 'bus',
    stops = 17,
    payment = 650,
  },
  {
    id = 2,
    name = 'Dashound',
    vehicleModel = 'coach',
    stops = 19,
    payment = 650,
  },
  {
    id = 3,
    name = 'Vinewood Tours',
    vehicleModel = 'tourbus',
    stops = 32,
    payment = 650,
  },
	{
		id = 4,
		name = 'Complete Shift'
	}
}

Config.vehicleSpawnLocation = {
  x = 472.31762695313,
  y = -588.77465820313,
  z = 28.499626159668,
  heading = 172.83491516113,
	radius = 5.0
}

Config.routes = {
  {  
			{x = 472.317, y = -588.774, z = 28.499, heading = 172.834, offset = 6.0, name = 'Dashound Bus Center'},
			{x = 303.9272, y = -765.2411, z = 28.31524, heading = 252.86979675293, offset = 4.0, name = 'TBD'},
			{x = 115.4828 , y = -781.3399, z = 30.41903, heading = 162.92973327637, offset = 4.0, name = 'TBD2'},
			{x = -227.3274, y = -955.932, z = 28.28205, heading = 249.01657104492, offset = 5.0, name = 'Job Center'},
			{x = -49.0793, y = -1152.546, z = 25.19753, heading = 0.92064827680588, offset = 5.0, name = 'Car Dealership'},
			{x = 200.4622, y = -785.5944, z = 30.8866, heading = 66.716766357422, offset = 4.5, name = 'Los Santos Garage'},
			{x = 924.6992, y = -201.0683, z = 71.84038, heading = 55.639675140381, offset = 4.75, name = 'Cab & Co.'},
			{x = 901.7848, y = 58.12351, z = 78.06438, heading = 52.115531921387, offset = 4.5, name = 'Casino'},
			{x = -575.6408, y = 272.3412, z = 81.78271, heading = 172.64984130859, offset = 5.0, name = 'Tequi-La-La'},
			{x = -697.1044, y = -1.262863, z = 37.2245, heading = 203.22378540039, offset = 7.5, name = 'TBD3'},
			{x = -931.6797, y = -119.6908, z = 36.74755, heading = 207.41058349609, offset = 6.05, name = 'TBD4'},
			{x = -680.8071, y = -379.7021, z = 33.31029, heading = 158.98327636719, offset = -4.2, name = 'TBD5'},
			{x = -504.9902, y = -671.2888, z = 32.01988, heading = 2.1320254802704, offset = 4.5, name = 'TBD6'},
			{x = -248.3311, y = -713.4299, z = 32.54533, heading = 249.43812561035, offset = 4.0, name = 'TBD7'},
			{x = -250.1679, y = -887.0839, z = 29.62664, heading = 337.79379272461, offset = 5.0, name = 'TBD8'},
			{x = 356.2621, y = -1067.56, z = 28.58049, heading = 0.8120431303978, offset = 3.75, name = 'TBD9'},
			{x = 451.4534, y = -651.7766, z = 27.3969, heading = 242.4568939209, offset = 6.0, name = 'Dashound Bus Center'},
	},
	{
			{x = 472.317, y = -588.774, z = 28.499, heading = 172.834, offset = 6.0, name = 'Dashound Bus Center'},
			{x = -999.6892, y = -2749.584, z = 19.09303, heading = 344.55453491211, offset = 4.5, name = 'Terminal B'},
			{x = -2985.644, y = 136.7129, z = 13.75124, heading = 132.40238952637, offset = 6.0, name = 'Yacht Club'},
			{x = -2221.552, y = 4267.615, z = 45.82962, heading = 57.98067855835, offset = 5.0, name = 'Hookies Seafood Diner'},
			{x = -731.4949, y = 5502.73, z = 35.05854, heading = 30.681102752686, offset = 5.0, name = 'Mount Chiliad Valley Station'},
			{x = -1511.427, y = 4975.387, z = 61.48891, heading = 50.573246002197, offset = 5.5, name = 'Nature Reserve'},
			{x = -148.1292, y = 6211.105, z = 30.30679, heading = 233.50317382813, offset = -4.0, name = 'TBD10'},
			{x = 173.3953, y = 6524.402, z = 30.73565, heading = 32.284603118896, offset = 6.0, name = 'Central Garage'},
			{x = 2483.302, y = 4091.067, z = 36.92951, heading = 244.80850219727, offset = 4.0, name = 'TBD11'},
			{x = 1812.405, y = 3654.703, z = 33.18685, heading = 118.00534820557, offset = 4.0, name = 'TBD12'},
			{x = 1886.677, y = 3734.789, z = 31.5855, heading = 32.247814178467, offset = 5.5, name = 'TBD13'},
			{x = 2510.637, y = 4115.071, z = 37.29654, heading = 63.437324523926, offset = 4.0, name = 'TBD14'},
			{x = 183.4333, y = 6565.243, z = 30.90689, heading = 201.97204589844, offset = 4.0, name = 'Central Garage'},
			{x = -218.2748, y = 6175.224, z = 30.26555, heading = 47.580490112305, offset = -5.0, name = 'TBD15'},
			{x = -759.2289, y = 5515.425, z = 34.43407, heading = 205.84194946289, offset = 5.5, name = 'Mount Chiliad Valley Station'},
			{x = -1529.171, y = 4997.368, z = 61.18617, heading = 229.66108703613, offset = 5.0, name = 'Nature Reserve'},
			{x = -2260.906, y = 4276.71, z = 45.01217, heading = 239.60871887207, offset = 5.0, name = 'Hookies Seafood Diner'},
			{x = -2996.009, y = 109.1385, z = 13.36981, heading = 322.93377685547, offset = 6.0, name = 'Yacht Club'},
			{x = 456.4314, y = -601.8715, z = 27.52023, heading = 242.4568939209, offset = 6.0, name = 'Dashound Bus Center'},
	},
	{
			{x = 472.317, y = -588.774, z = 28.499, heading = 172.834, offset = 6.0, name = 'Dashound Bus Center'},
			{x = 1299.4888916016, y = -678.6298828125, z = 65.605239868164, heading = 350.61743164063, offset = 6.0, name = 'Skatepark - East Vinewood'},
			{x = 1161.9625244141, y = -481.69641113281, z = 65.558212280273, heading = 255.50466918945, offset = 4.5, name = 'Mirror Park'},
			{x = 924.66583251953, y = 49.583042144775, z = 80.523971557617, heading = 329.60534667969, offset = 6.0, name = 'Casino'},
			{x = 1035.9779052734, y = 193.86640930176, z = 80.614845275879, heading = 326.25497436523, offset = 5.0, name = 'Horse Racing Track'},
			{x = 814.3154296875, y = 562.30718994141, z = 125.53918457031, heading = 222.52494812012, offset = 5.0, name = 'Amphitheater'},
			{x = 271.28295898438, y = 181.60726928711, z = 104.327293396, heading = 68.229026794434, offset = 5.5, name = 'Vinewood Boulevard'},
			{x = -403.60028076172, y = 252.73724365234, z = 82.996437072754, heading = 87.331268310547, offset = -4.0, name = 'Split Sides & Last Train'},
			{x = -78.128211975098, y = 901.35375976563, z = 235.31237792969, heading = 34.667922973633, offset = 6.0, name = 'Lake Vinewood'},
			{x = 309.3879699707, y = 967.5986328125, z = 209.06031799316, heading = 174.29000854492, offset = 4.0, name = 'Vinewood Park'},
			{x = -267.56015014648, y = 725.09051513672, z = 207.11904907227, heading = 40.036693572998, offset = 4.0, name = 'Lake Vinewood (City View)'},
			{x = 259.29998779297, y = 1270.0233154297, z = 233.24110412598, heading = 29.365224838257, offset = 5.5, name = 'Sisyphus Theater'},
			{x = -393.07876586914, y = 1229.9449462891, z = 325.39935302734, heading = 72.682235717773, offset = 4.0, name = 'Galileo Observatory'},
			{x = -1567.6290283203, y = 2109.5424804688, z = 65.205940246582, heading = 350.85885620117, offset = 4.0, name = 'Tongva Valley Waterfall'},
			{x = -1498.2844238281, y = 1492.9810791016, z = 116.14374542236, heading = 167.22991943359, offset = -5.0, name = 'Tongva Valley Whitewater'},
			{x = -2296.8413085938, y = 447.89559936523, z = 174.22975158691, heading = 354.08294677734, offset = 5.5, name = 'Kortz Center'},
			{x = -1602.6295166016, y = 175.56283569336, z = 59.080543518066, heading = 25.216634750366, offset = 5.0, name = 'ULSA'},
			{x = -1379.9061279297, y = 56.762329101563, z = 53.44495010376, heading = 2.0048370361328, offset = 5.0, name = 'Los Santos Golf Club'},
			{x = -1329.3636474609, y = -646.17602539063, z = 26.486532211304, heading = 217.06756591797, offset = 6.0, name = 'Prosperity Street Promenade'},
			{x = -1608.4250488281, y = -969.93157958984, z = 12.781057357788, heading = 319.58657836914, offset = 6.0, name = 'Del Perro Pier'},
			{x = -1064.5716552734, y = -495.65048217773, z = 36.188648223877, heading = 300.08929443359, offset = 6.0, name = 'Vinewood Film Studios'},
			{x = -677.38885498047, y = -225.86756896973, z = 36.732723236084, heading = 329.91534423828, offset = 6.0, name = 'Eastbourne Way'},
			{x = -174.35740661621, y = -157.99690246582, z = 43.384960174561, heading = 251.28582763672, offset = 6.0, name = 'Rockford Plaza'},
			{x = 263.19644165039, y = -379.54888916016, z = 44.431449890137, heading = 248.88879394531, offset = 6.0, name = 'Courthouse'},
			{x = -549.50274658203, y = -646.798828125, z = 32.919410705566, heading = 88.947814941406, offset = 6.0, name = 'SAGMA'},
			{x = -1019.4143066406, y = -1087.8732910156, z = 1.6674406528473, heading = 29.924945831299, offset = 6.0, name = 'Vespucci Canals'},
			{x = -1327.8835449219, y = -1490.6940917969, z = 4.077344417572, heading = 206.95239257813, offset = 6.0, name = 'Vespucci Beach'},
			{x = -828.38458251953, y = -1216.6585693359, z = 6.6977858543396, heading = 319.06661987305, offset = 6.0, name = 'The Viceroy Hotel - La Puerta'},
			{x = -800.14385986328, y = -1333.6276855469, z = 4.7636361122131, heading = 258.9860534668, offset = 6.0, name = 'Marina - La Puerta'},
			{x = -208.22509765625, y = -1999.9128417969, z = 27.384048461914, heading = 172.53678894043, offset = 6.0, name = 'Mazebank Arena'},
			{x = 264.01416015625, y = -1217.5562744141, z = 29.204164505005, heading = 269.8083190918, offset = 6.0, name = 'Strawberry Avenue'},
			{x = 466.28979492188, y = -645.99798583984, z = 28.113885879517, heading = 354.36410522461, offset = 6.0, name = 'TBD16'},
	}
}

Config.messages = {
	['route_start'] = 'Your bus is ready! Get in, and follow the route marked on your GPS.',
	['passengers_enter'] = 'New passengers are boarding the bus.',
	['passengers_exit'] = 'Some passengers are departing at this stop.',
	['next_stop'] = 'Proceed to the next stop. It has been marked on your GPS.',
	['menu_open'] = 'Press ~INPUT_CONTEXT~ to work as a ~p~Bus Driver.',
	['menu_alternate'] = 'Press ~INPUT_CONTEXT~ to open ~p~shift options.',
	['wrong_vehicle'] = 'This is NOT your bus! Get into your assigned bus, ASAP!',
	['route_canceled'] = 'Your route has been canceled. Your bus has been returned to the garage.',
	['route_complete'] = "You've completed your shift. Return your bus back to the depot.",
	['return_vehicle'] = 'Press ~INPUT_CONTEXT~ to return your vehicle to its garage.',
	['payment_sent'] = 'A payment of $650 has been sent to your bank account'
}