<?php
$nekoapp = '404';
include('../../assets/includes/app_start.php');
require '../../assets/import/PHPMailer/PHPMailerAutoload.php';

$nome = $resultado['nome'];
$email = $resultado['email'];
$iduser = $resultado['id'];
$code = rand(0,100000);
$ativo = '1';

$codea = "INSERT INTO verificar (iduser, code, ativo)
VALUES ('".$iduser."', '".$code."', '".$ativo."')";
if (mysqli_query($conn, $codea)) {
    echo 'verificar';
}
else{
    echo 'error';
}

//Create a new PHPMailer instance
$mail = new PHPMailer;
$mail->CharSet = "UTF-8";
$mail->Encoding = "16bit";
//Tell PHPMailer to use SMTP
$mail->isSMTP();
//Enable SMTP debugging
// 0 = off (for production use)
// 1 = client messages
// 2 = client and server messages
$mail->SMTPDebug = 0;
//Set the hostname of the mail server
$mail->Host = 'smtp.gmail.com';
// use
// $mail->Host = gethostbyname('smtp.gmail.com');
// if your network does not support SMTP over IPv6
//Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
$mail->Port = 587;
//Set the encryption system to use - ssl (deprecated) or tls
$mail->SMTPSecure = 'tls';
//Whether to use SMTP authentication
$mail->SMTPAuth = true;
//Username to use for SMTP authentication - use full email address for gmail
$mail->Username = "nekoapp404@gmail.com";
//Password to use for SMTP authentication
$mail->Password = "xande123";
//Set who the message is to be sent from
$mail->setFrom($email, $nome);
//Set an alternative reply-to address
$mail->addReplyTo('nekoapp404@gmail.com', 'NekoApp');
//Set who the message is to be sent to
$mail->addAddress($email, ( 'NekoApp' . $nome));
//Set the subject line
$mail->Subject = 'Verifique sua conta';
$mail->IsHTML(true); 
$mail -> charSet = "UTF-8";
$mail->Encoding = 'base64';
//Read an HTML message body from an external file, convert referenced images to embedded,
//Replace the plain text body with one created manually

$body = '
<table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
<tbody>
<tr>
<td align="left" style="word-break:break-word; font-size:0px; padding:0px">
<div style="color:#737F8D; font-family:Whitney,Helvetica Neue,Helvetica,Arial,Lucida Grande,sans-serif; font-size:16px; line-height:24px; text-align:left">
<h2 style="font-family:Whitney,Helvetica Neue,Helvetica,Arial,Lucida Grande,sans-serif; font-weight:500; font-size:20px; color:#4F545C; letter-spacing:0.27px">
Olá, '. $nome .'! 😎</h2>
<p>Agradecemos por registrar uma conta no NekoApp! Antes de começarmos, precisamos confirmar que é você mesmo. Digite seu código abaixo:</p>
</div>
</td>
</tr>
<tr>
<td align="center" style="word-break:break-word; font-size:0px; padding:10px 25px; padding-top:20px">
<table role="presentation" cellpadding="0" cellspacing="0" align="center" border="0" style="border-collapse:separate">
<tbody>
<h2 style="font-family:Whitney,Helvetica Neue,Helvetica,Arial,Lucida Grande,sans-serif; font-weight:500; font-size:20px; color:#4F545C; letter-spacing:0.27px">
Seu código, '. $code .'! 😎</h2>
</tbody>
</table>
</td>
</tr>
<tr>
<td style="word-break:break-word; font-size:0px; padding:30px 0px">
<p style="font-size:1px; margin:0px auto; border-top:1px solid #DCDDDE; width:100%">
</p>
</td>
</tr>
<tr>
<td align="left" style="word-break:break-word; font-size:0px; padding:0px">
<div style="color:#747F8D; font-family:Whitney,Helvetica Neue,Helvetica,Arial,Lucida Grande,sans-serif; font-size:13px; line-height:16px; text-align:left">
</div>
</td>
</tr>
</tbody>
</table>
';
$mail->Body  = html_entity_decode($body);
//send the message, check for errors
if (!$mail->send()) {
    // echo "Mailer Error: " . $mail->ErrorInfo;
    $msg = 'error';
} else {
    $msg = 'sent';
    //Section 2: IMAP
    //Uncomment these to save your message in the 'Sent Mail' folder.
    #if (save_mail($mail)) {
    #    echo "Message saved!";
    #}
}
//Section 2: IMAP
//IMAP commands requires the PHP IMAP Extension, found at: https://php.net/manual/en/imap.setup.php
//Function to call which uses the PHP imap_*() functions to save messages: https://php.net/manual/en/book.imap.php
//You can use imap_getmailboxes($imapStream, '/imap/ssl') to get a list of available folders or labels, this can
//be useful if you are trying to get this working on a non-Gmail IMAP server.
function save_mail($mail)
{
    //You can change 'Sent Mail' to any other folder or tag
    $path = "{imap.gmail.com:993/imap/ssl}[Gmail]/Sent Mail";
    //Tell your server to open an IMAP connection using the same username and password as you used for SMTP
    $imapStream = imap_open($path, $mail->Username, $mail->Password);
    $result = imap_append($imapStream, $path, $mail->getSentMIMEMessage());
    imap_close($imapStream);
}