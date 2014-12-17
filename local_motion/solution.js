function turn(vehicles,peoples,buildings){
  // for (var j = 0 ; j < vehicles.length; j++) {
  //   var vehicle = vehicles[j]
  //   if (!vehicle.dest) {
  //     findNearestPickUp(vehicle, peoples, buildings);
  //   };
  //   if (vehicle.dest) {
  //     action(vehicle, peoples, buildings);
  //   };
  // }
    var vehicle = vehicles[0]
    if (!vehicle.dest) {
      vehicle.dest = [];
    }
    if (vehicle.dest.length < 1) {
      findNearestPickUp(vehicle, peoples, buildings);
    };
    if (vehicle.dest.length > 0) {
      action(vehicle, peoples, buildings);
    };
};



function findNearestPickUp(vehicle, peoples, buildings) {
  var shortest = 1000;
  var nearest_person = null;
  var queue = peoples.filter(function(person){
      return !person.hasOwnProperty("waitting")
  })
  for (var i = 0; i < queue.length; i++) {
    var person = queue[i];
    var d_pickup = distance(vehicle, person);
    var d_trip = tripDistance(person, buildings)
    var total_distance = d_pickup + d_trip * 3;
    if (person.time > total_distance
         && total_distance < shortest) {
      nearest_person = person;
      shortest = total_distance
    };
  };
  if (nearest_person) {

    console.log('found new passenger')

    nearest_person.waitting = true;
    vehicle.dest.push(nearest_person);
    vehicle.pickup = true;
    console.log(nearest_person)
    console.log(vehicle)
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
    if(vehicle.pickup) {
      var passenger = vehicle.dest[0]
      vehicle.dest[0] = findBuilding(passenger.destination, buildings);
      vehicle.pick(passenger);
      vehicle.pickup = false;
      // recalculatePath(vehicle, peoples, buildings);
    } else {
      vehicle.dest = vehicle.dest.slice(1);
    }
  } else {
    vehicle.moveTo(vehicle.dest[0]);
  }
};

// function recalculatePath(vehicle, peoples, buildings) {
//   var queue = peoples.filter(function(person){
//     return !person.hasOwnProperty("waitting")
//   })
//
//   for (var i = 0; i < queue.length; i++) {
//
//   }
// }

function findBuilding(name, buildings) {
  for (var i = 0; i < buildings.length; i++) {
    if(buildings[i].name === name) {
      return buildings[i];
    }
  }
};
