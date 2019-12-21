<?php

require_once( './functions.php' );
require_once( './db_connection.php' );
startup();
set_exception_handler( 'error_handler' );
set_error_handler( 'error_handler' );

if ( empty( $_GET['goal_id'] ) ) {
  $whereClause = '';
} else {
  $whereClause = "WHERE goal_details.goal_id = {$_GET['goal_id']}";
}



$query =

  "SELECT goal_details.goal_id, goal_details.goal_name,
  goal_details.savings_target, goal_details.goal_start_date,
  goal_details.goal_completion_date, goal_details.current_saving,
  goal_details.is_completed, goal_details.goal_achieved_date,
  transaction_history.transactions
  FROM goal_details
  JOIN transaction_history ON goal_details.goal_id = transaction_history.goal_id
  {$whereClause}";

$result = mysqli_query( $conn, $query );
if( !$result ){
  throw new Exception( mysqli_connect_error() );
}

$output = [];
while ( $row = mysqli_fetch_assoc( $result ) ) {
  $goal_id = $row['goal_id'];
  if ( !isset( $output[$goal_id] ) ) {
    $output[] = [
      "goal_id" => $row["goal_id"],
      "goal_name" => $row["goal_name"],
      "savings_target" => $row["savings_target"],
      "goal_start_date" => $row["goal_start_date"],
      "goal_completion_date" => $row["goal_completion_date"],
      "goal_achieved_date" => $row["goal_achieved_date"],
      "current_saving" => $row["current_saving"],
      "is_completed" => $row["is_completed"],
      "transaction_history" => json_decode( $row['transactions'] )
    ];
  }
}
$output = $output[0];

print(json_encode( $output ));
?>
