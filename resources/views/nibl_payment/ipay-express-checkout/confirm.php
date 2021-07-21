<?php


	session_start();
	include_once("ipayExpAPI.php");

	$ipay_product = $_SESSION["ipay_products"];
	$uuid_session = $_SESSION["ipay_out__txn_uuid"];
	$mer_txn_id_sesson = $_SESSION["ipay_in__mer_ref_id"];
		foreach($ipay_product['items'] as $key=>$p_item)
	{		
		$itm_qty = $p_item['itm_qty'];
		$itm_price = $p_item['itm_price'];
		$itm_name = $p_item['itm_name'];
		$itm_code = $p_item['itm_code'];	
	}


	$_SESSION["ipay_in__action"] = 'saleTxnVerify';
	$ipay_sec= new MyIpay();
	$httpParsedResponseArsec = $ipay_sec->saleTxnVerify();  // Extract the response details.
	
	$BankRefID  = $httpParsedResponseArsec['ipay_out__bank_ref_id'];
	$CurrencyCode = $httpParsedResponseArsec['ipay_out__cur_code'];
	$IPGTransactionID = $httpParsedResponseArsec['ipay_out__ipg_txn_id'];
	$MerRefID = $httpParsedResponseArsec['ipay_out__mer_ref_id'];
	$TxnAmount = $httpParsedResponseArsec['ipay_out__txn_amt'];
	$TxnStatus = $httpParsedResponseArsec['ipay_out__txn_status'];
	$ServerTime = $httpParsedResponseArsec['ipay_out__server_time'];
	$MaskedAccNo = $httpParsedResponseArsec['ipay_out__masked_acc_number'];
	$LanguageCode = $httpParsedResponseArsec['ipay_out__lang'];
	$MerVar1 = $httpParsedResponseArsec['ipay_out__mer_var_1'];
	$MerVar2 = $httpParsedResponseArsec['ipay_out__mer_var_2'];
	$MerVar3 = $httpParsedResponseArsec['ipay_out__mer_var_3'];
	$MerVar4 = $httpParsedResponseArsec['ipay_out__mer_var_4'];
	$CustomerName = $httpParsedResponseArsec['ipay_out__card_holder_name'];
	$FailReason = $httpParsedResponseArsec['ipay_out__fail_reason'];
	$AuthCode = $httpParsedResponseArsec['ipay_out__auth_code'];

	if($TxnStatus == "REJECTED") {
	   // header('Location:'.'http://'.$_SERVER['HTTP_HOST'].'/nibl/payment-success');
		header('Location:'.'http://'.$_SERVER['HTTP_HOST'].'/nibl/payment-fail');
		session_abort();
		exit();
	}
	if($TxnStatus == "SUCCESS") {
		header('Location:'.'http://'.$_SERVER['HTTP_HOST'].'/nibl/payment-success');
		session_abort();
		exit();
	}

	
		
		
		
		echo '<table style="border-collapse: separate;border-spacing: 1em;"><tbody>';	
		echo '<tr><td><h3>BankRefID</h3></td><td> : </td><td>'.$BankRefID.'</td></tr>';
		echo '<tr><td><h3>CurrencyCode</h3></td><td> : </td><td>'.$CurrencyCode.'</td></tr>';
		echo '<tr><td><h3>IPGTransactionID</h3></td><td> : </td><td>'.$IPGTransactionID.'</td></tr>';
		echo '<tr><td><h3>MerRefID</h3></td><td> : </td><td>'.$MerRefID.'</td></tr>';
		echo '<tr><td><h3>TxnAmount</h3></td><td> : </td><td>'.$TxnAmount.'</td></tr>';
		echo '<tr><td><h3>TxnStatus</h3></td><td> : </td><td>'.$TxnStatus.'</td></tr>';
		echo '<tr><td><h3>ServerTime</h3></td><td> : </td><td>'.$ServerTime.'</td></tr>';
		echo '<tr><td><h3>MaskedAccNo</h3></td><td> : </td><td>'.$MaskedAccNo.'</td></tr>';
		echo '<tr><td><h3>LanguageCode</h3></td><td> : </td><td>'.$LanguageCode.'</td></tr>';
		echo '<tr><td><h3>MerVar1</h3></td><td> : </td><td>'.$MerVar1.'</td></tr>';
		echo '<tr><td><h3>MerVar2</h3></td><td> : </td><td>'.$MerVar2.'</td></tr>';
		echo '<tr><td><h3>MerVar3</h3></td><td> : </td><td>'.$MerVar3.'</td></tr>';
		echo '<tr><td><h3>MerVar4</h3></td><td> : </td><td>'.$MerVar4.'</td></tr>';
		echo '<tr><td><h3>CustomerName</h3></td><td> : </td><td>'.$CustomerName.'</td></tr>';
		echo '<tr><td><h3>FailReason</h3></td><td> : </td><td>'.$FailReason.'</td></tr>';
		echo '<tr><td><h3>AuthCode</h3></td><td> : </td><td>'.$AuthCode.'</td></tr>';
		echo '</tbody></table>';
		// die;
?>
