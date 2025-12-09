<?php

// Configuration array
$settings = [
  'rows' => 3,
  'char' => 'A'
];

?>

<table border="1" style="border-collapse: collapse; width: 80%; text-align: left;">

  <tr>

    <td style="padding: 20px; vertical-align: top;">
      <?php
      for ($i = 1; $i <= $settings['rows']; $i++) {
        for ($j = 1; $j <= $i; $j++) {
          echo "* ";
        }
        echo "<br>";
      }
      ?>
    </td>

    <td style="padding: 20px; vertical-align: top;">
      <?php
      for ($i = $settings['rows']; $i >= 1; $i--) {
        for ($j = 1; $j <= $i; $j++) {
          echo $j . " ";
        }
        echo "<br>";
      }
      ?>
    </td>

    <td style="padding: 20px; vertical-align: top;">
      <?php
      $char = $settings['char'];
      for ($i = 1; $i <= $settings['rows']; $i++) {
        for ($j = 1; $j <= $i; $j++) {
          echo $char . " ";
          $char++;
        }
        echo "<br>";
      }
      ?>
    </td>

  </tr>
</table>