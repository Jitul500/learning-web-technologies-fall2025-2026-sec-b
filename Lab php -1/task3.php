<?php

    $number = 45;
    $data = ['num' => $number];
    $message = "";

    if($data['num'] % 2 == 0){
        $message = "Even Number";
    } else {
        $message = "Odd Number";
    }

?>

<h3>Checking Number: <?php echo $data['num']; ?></h3>

<h2>
    Result: <?php echo $message; ?>
</h2>
