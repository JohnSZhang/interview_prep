function turn(vehicles,peoples,buildings){
  for (var j = 0 ; j < vehicles.length; j++) {
    var vehicle = vehicles[j]
    if (!vehicle.dest) {
      vehicle.dest = [];
    }
    if (vehicle.dest.length < 1) {
      findNearestPickUp(vehicle, peoples, buildings);
    };
    action(vehicle, peoples, buildings);
  }
};

function getQueue(peoples) {
  return peoples.filter(function(person){
    return !person.hasOwnProperty("waitting")
  })
}

function findNearestPickUp(vehicle, peoples, buildings) {
  var shortest = 1000;
  var nearest_person = null;
  var queue = getQueue(peoples);

  for (var i = 0; i < queue.length; i++) {
    var person = queue[i];
    var d_pickup = distance(vehicle, person);
    var d_trip = tripDistance(person, buildings)
    var d_total = d_pickup + d_trip;
    var deadline = person.time - d_trip * 2;

    if (deadline > d_pickup
         && d_total < shortest) {
      nearest_person = person;
      shortest = total_distance;
    };
  };

  if (nearest_person) {
    nearest_person.waitting = true;
    var dest_building = findBuilding(nearest_person.destination, buildings);
    vehicle.dest.push(nearest_person);
    vehicle.dest.push(dest_building);
  };

};

function distance(ob1, ob2) {
  return Math.abs(ob1.x - ob2.x) + Math.abs(ob1.y - ob2.y);
};

function tripDistance(person, buildings) {
  var b_pickup = findBuilding(person.origin, buildings);
  var b_dropoff = findBuilding(person.destination, buildings);
  return distance(b_pickup, b_dropoff);
};

function action(vehicle, peoples, buildings) {
  if (distance(vehicle, vehicle.dest[0]) === 0 ) {
    if(vehicle.dest[0].hasOwnProperty("destination")) {
      vehicle.pick(vehicle.dest[0]);
    }
    vehicle.dest = vehicle.dest.slice(1);
  } else {
    vehicle.moveTo(vehicle.dest[0]);
  }
};

function findBuilding(name, buildings) {
  for (var i = 0; i < buildings.length; i++) {
    if(buildings[i].name === name) {
      return buildings[i];
    }
  }
};
