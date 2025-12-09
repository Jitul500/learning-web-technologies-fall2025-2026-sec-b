<?php

    $length = 20; 
    $width = 10;
    
    $rectangle = [
        'len' => $length, 
        'wid' => $width
    ];

    $area = 0;
    $perimeter = 0;
    $message = "";

    if(is_numeric($rectangle['len']) && is_numeric($rectangle['wid'])) {
        
        $area = $rectangle['len'] * $rectangle['wid'];
        $perimeter = 2 * ($rectangle['len'] + $rectangle['wid']);
        
    } else {
        $message = "Please enter valid numbers.";
    }

?>

<div>
    
    <h3>Rectangle Details</h3>
    
    <p>Length: <?php echo $rectangle['len']; ?></p>
    <p>Width: <?php echo $rectangle['wid']; ?></p>

    <?php if($message == "") { ?>
        
        <h2 onclick="alert('Formula: Length * Width')">
            Area: <?php echo $area; ?>
        </h2>

        <h2 onclick="alert('Formula: 2 * (Length + Width)')">
            Perimeter: <?php echo $perimeter; ?>
        </h2>

    <?php } else { ?>
        
        <h2> <?php echo $message; ?> </h2>
        
    <?php } ?>

</div>
