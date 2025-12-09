<?php

$numbers = [10, 25, 40, 55, 70, 85, 100];
$search_key = 55;

$data = [
  'list' => $numbers,
  'target' => $search_key
];

$found = false;
$index = -1;

for ($i = 0; $i < count($data['list']); $i++) {

  if ($data['list'][$i] == $data['target']) {
    $found = true;
    $index = $i;
    break;
  }
}

?>

<h3>Array Elements:</h3>
<p>
  <?php
  for ($j = 0; $j < count($data['list']); $j++) {
    echo $data['list'][$j] . " ";
  }
  ?>
</p>

<h3>Searching for: <?php echo $data['target']; ?></h3>

<?php if ($found == true) { ?>

  <h2>
    Success: Element found at index <?php echo $index; ?>
  </h2>

<?php } else { ?>

  <h2>
    Error: Element not found!
  </h2>

<?php } ?>
