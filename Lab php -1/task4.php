<?php

    $n1 = 15;
    $n2 = 80;
    $n3 = 45;

    $numbers = [
        'first' => $n1, 
        'second' => $n2, 
        'third' => $n3
    ];

    $largest = 0;

    if($numbers['first'] >= $numbers['second'] && $numbers['first'] >= $numbers['third']){
        $largest = $numbers['first'];
    }

    elseif($numbers['second'] >= $numbers['first'] && $numbers['second'] >= $numbers['third']){
        $largest = $numbers['second'];
    }
    
    else{
        $largest = $numbers['third'];
    }

?>

<h3>Given Numbers:</h3>
<p>
    <?php echo $numbers['first'].", ".$numbers['second'].", ".$numbers['third']; ?>
</p>

<h2>
    Largest Number: <?php echo $largest; ?>
</h2>

