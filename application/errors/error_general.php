<?php

//  Load the Nails. error template, override this if you so desire
if (file_exists(NAILS_COMMON_PATH . 'errors/error_general.php')) {

    require NAILS_COMMON_PATH . 'errors/error_general.php';

} else {

    ?>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <title>[Error] <?=$heading?></title>
        </head>
        <body>
            <h1><?php echo $heading; ?></h1>
            <?php echo $message; ?>
        </body>
    </html>
    <?php

}
