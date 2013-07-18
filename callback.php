<?php
  // Enter your app information below
  $api_key = '123405257731200';
  $secret = '8037ae43536685123303ddc326c3ac63';

// prepare the return data array
$data = array('content' => array());

// parse signed data
$request = parse_signed_request($_REQUEST['signed_request'], $secret);

if ($request == null) {
  // handle an unauthenticated request here
}

$payload = $request['credits'];

// retrieve all params passed in
$func = $_REQUEST['method'];
$order_id = $payload['order_id'];

if ($func == 'payments_status_update') {
  $status = $payload['status'];

  // write your logic here, determine the state you wanna move to
  if ($status == 'placed') {
	$next_state = 'settled';
	$data['content']['status'] = $next_state;
  }
  // compose returning data array_change_key_case
  $data['content']['order_id'] = $order_id;
  } else if ($func == 'payments_get_items') {
    // remove escape characters  
    $order_info = stripcslashes($payload['order_info']);
    $item_info = json_decode($order_info, true);
    //Per the credits api documentation, 
    //you should pass in an item reference
    // and then query your internal DB for the proper 
    //information. Then set the item 
    //information here to be returned to facebook 
    //then shown to the user for confirmation.
    if ($item_info == "1a") {
     $item['title'] = 'TSpot Buy';
     $item['price'] = 3;
     $item['description']='Buy TSpot...';
     $item['image_url']='https://treasurehunter.apphb.com/images/coin.png';
     $item['product_url']='https://treasurehunter.apphb.com/images/coin.png';
    }
    //for url fields, if not prefixed by http:,
    //prefix them
    $url_key = array('product_url', 'image_url');  
    foreach ($url_key as $key) {
      if (substr($item[$key], 0, 7) != 'http://') {
        $item[$key] = 'http://'.$item[$key];
      }
    }
    $data['content'] = array($item);
}

  // required by api_fetch_response()
  $data['method'] = $func;
  echo json_encode($data);
?>