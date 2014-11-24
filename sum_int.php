<?php
$file = fopen($argv[1], "r");
$sum = 0;
while (true){
  $line = str_replace(array("\r\n", "\r", "\n"), "", fgets($file));
  if ($line == "") {
    break;
  }
  $sum += (int)$line;

}
echo $sum;
?>
