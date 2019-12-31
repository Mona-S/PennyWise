<?php

require_once('./functions.php');

set_exception_handler('error_handler');

startup();

set_error_handler('error_handler');

require_once('./db_connection.php');


$query =


    "SELECT `goal_id`, `goal_name`, `savings_target`, `goal_completion_date`, `current_savings`, `is_completed`

    FROM goal_details ORDER BY `goal_id` DESC" ;


$result = mysqli_query($conn, $query);

if(!mysqli_num_rows($result)) {
    throw new Exception('Invalid ID: '.$id);
}

if(!$result) {
    throw new Exception(mysqli_error($conn));
}

$output = array();

while ($row = mysqli_fetch_assoc($result)) {
  $output[] = $row;
};



print(json_encode($output));
