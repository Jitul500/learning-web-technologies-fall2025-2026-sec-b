<?php

    $amount = 1000; 
    $vat_rate = 15;

    $bill = [
        'base_amount' => $amount, 
        'rate' => $vat_rate
    ];

    // VAT = (Amount * 15) / 100
    $vat_amount = ($bill['base_amount'] * $bill['rate']) / 100;

    $total_payable = $bill['base_amount'] + $vat_amount;

?>

<h3>Bill Summary:</h3>

<p>Base Amount: <?php echo $bill['base_amount']; ?></p>

<h2 onclick="alert('Calculated as 15% of Amount')">
    VAT (15%): <?php echo $vat_amount; ?>
</h2>

<h2 onclick="alert('Total = Base Amount + VAT')">
    Grand Total: <?php echo $total_payable; ?>
</h2>

