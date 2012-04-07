
<?php if ( ! isset( $hide_signoff ) ) : ?>
Regards,
The <?=$site_name?> Email Robot
<?php endif; ?>

<?php if ( isset( $unsubscribe_url ) && ! empty( $unsubscribe_url ) ) : ?>

---------------

You are receiving this email because you are a registered member of <?=$site_name?> (<?=$site_url?>).

Copy and paste the link below to stop receiving these notifications.

{unwrap}<?=site_url( 'mini/' . shorten_url( $login_url . '?return_to=' . urlencode( $unsubscribe_url ) ) )?>{/unwrap}

Please add <?=$sent_from->email?> to your address book.

<?php endif; ?>

<?php if ( isset( $input[0]['unsubscribe_url'] ) && ! empty( $input[0]['unsubscribe_url'] ) ) : ?>

---------------

You are receiving this email because you are a registered member of <?=$site_name?> (<?=$site_url?>).

Copy and paste the link below to stop receiving these notifications.

{unwrap}<?=site_url( 'mini/' . shorten_url( $input[0]['login_url'] . '?return_to=' . urlencode( $input[0]['unsubscribe_url'] ) ) )?>{/unwrap}

Please add <?=$sent_from->email?> to your address book.

<?php endif; ?>
<?php if ( isset( $email_ref ) ) : ?>
<?php $_time = time(); ?>

---------------
Trouble viewing this email? View it online here: <?=site_url( 'email/view_online/' . $email_ref . '/' . $_time . '/' . md5( $_time . $secret . $email_ref ) )?>

Email Ref: <?=$email_ref?>
<?php endif; ?>