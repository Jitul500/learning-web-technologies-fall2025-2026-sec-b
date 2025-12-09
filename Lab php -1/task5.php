<?php

$start = 10;
$end = 100;

$range = ['min' => $start, 'max' => $end];

?>

<h3>Odd Numbers from <?php echo $range['min']; ?> to <?php echo $range['max']; ?>:</h3>

<div>
  <?php
  for ($i = $range['min']; $i <= $range['max']; $i++) {
    if ($i % 2 != 0) {
      echo "<span>" . $i . ", </span>";
    }
  }
  ?>
</div>

