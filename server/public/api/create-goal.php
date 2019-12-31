<?php

require_once('./functions.php');
set_exception_handler('error_handler');
startup();
set_error_handler('error_handler');
require_once('./db_connection.php');

$json_input = file_get_contents('php://input');
$obj = json_decode($json_input, true);

$goal_name = $obj['goal_name'];
$savings_target = $obj['savings_target'];
$current_savings = $obj['current_savings'];
$goal_completion_date = $obj['goal_completion_date'];
$transaction_date = date('Y-m-d');
$goal_name = str_replace("'", "''", $goal_name);

$query = "INSERT INTO goal_details (goal_name, savings_target, goal_start_date, goal_completion_date, current_savings, is_completed)
VALUES('$goal_name', '$savings_target', now(), '$goal_completion_date', '$current_savings', 0)";
$result = mysqli_query($conn, $query);
if ($result) {
    print(json_encode(['message'=>"New goal created successfully"]));
} else {
    http_response_code(500);
    print(json_encode(['error'=>mysqli_error($conn)]));
}
$last_id = mysqli_insert_id($conn);
$query2 = "INSERT INTO `transaction_history`(`goal_id`, `transaction_date`, `transaction_amount`)
VALUES ({$last_id}, \"{$transaction_date}\", {$current_savings})";


$result = mysqli_query($conn, $query2);
?>
