
var fs  = require("fs");
fs.readFileSync(process.argv[2]).toString().split('\n').forEach(function (line) {
if (line != "") {
  var nums = line.split('');
  console.log(find_next(nums).join(''));
}
});

function find_next(nums) {
  var can_flip = false;
  arr_len = nums.length;
  for(var i = (arr_len - 1); i > 0; i-= 1){
    if (nums[i] > nums[i-1]){
      var hold = nums[i];
      nums[i] = nums[i-1];
      nums[i-1] = hold;
      return nums;
    }
  }
  nums = nums.sort()
  if (nums[0] !== "0") {
    nums.splice(1, 0, "0");
    return nums;
  }

  for(var i = 0; i < arr_len; i += 1){
    var val = nums[i];
      if(val !== "0") {
        nums[i] = "0";
        nums[0] = val;
        break;
      }
  }
  return nums;
}
