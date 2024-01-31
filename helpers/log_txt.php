<?php

function log_txt($whatToLog)
{
    $file = APP_PATH . '/logs/log.txt';
    $fileopen = (fopen($file, 'a'));

    $date = date('d-m-y h:i:s A');
    $ipaddress = getenv("REMOTE_ADDR");

    $newLineToLog = PHP_EOL . "[" . $date . "][" . $ipaddress . "]: " . $whatToLog;

    fwrite($fileopen, $newLineToLog);

    fclose($fileopen);
}
