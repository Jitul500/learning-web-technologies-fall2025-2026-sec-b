<?php

$matrix = [
  [1, 2, 3, 'A'],
  [1, 2, 'B', 'C'],
  [1, 'D', 'E', 'F']
];

$rows = 3;
$cols = 4;

?>

<h3>
  The Array to Declare:
</h3>

<div>
  <?php

  for ($i = 0; $i < $rows; $i++) {
    for ($j = 0; $j < $cols; $j++) {
      echo $matrix[$i][$j] . " ";
    }
    echo "<br>";
  }
  ?>
</div>

<br>
<hr>
<br>

<h3>
  Shapes to Print:
</h3>

<table border="1" cellpadding="15" style="border-collapse: collapse;">
  <tr>
    <td valign="top">
      <?php

      for ($i = 0; $i < $rows; $i++) {

        $limit = ($cols - 1) - $i;

        for ($j = 0; $j < $limit; $j++) {
          echo $matrix[$i][$j] . " ";
        }
        echo "<br>";
      }
      ?>
    </td>

    <td valign="top">
      <?php

      for ($i = 0; $i < $rows; $i++) {

        $start_index = ($cols - 1) - $i;

        for ($j = $start_index; $j < $cols; $j++) {
          echo $matrix[$i][$j] . " ";
        }
        echo "<br>";
      }
      ?>
    </td>
  </tr>
</table>