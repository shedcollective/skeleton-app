<?php

//  Load the Nails. error template, override this if you so desire
if (file_exists(NAILS_COMMON_PATH . 'errors/error_404.php')) {

    require NAILS_COMMON_PATH . 'errors/error_404.php';

} else {

    ?>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <title>404 Page Not Found</title>
        </head>
        <body>
            <h1><?php echo $heading; ?></h1>
            <?php echo $message; ?>
        </body>
    </html>
    <?php

}
