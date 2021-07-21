<?php
include_once("ipayExpAPI.php");

#if( $_REQUEST["ipgTxnId"] )
if( true )
{
	// form POST data
    $ipgTxnIdRefund = $_REQUEST['ipgTxnIdRefund'];
    $merchRefIdRefund = $_REQUEST['merchRefIdRefund'];
	$action = $_REQUEST['action'];
	$refundAmt = $_REQUEST['refundAmt'];
	
	
	
    
	// Set up your API credentials                
	$_SESSION["ipay_in_action"] = $action;    
	$_SESSION["ipay_in_ipg_txn_id"] = $ipgTxnIdRefund;          // merchant ipg trx id	
	$_SESSION["ipay_in_mer_ref_id"] = $merchRefIdRefund;        // merchant reference id
	$_SESSION["ipay_in_refund_amt"] = $refundAmt;               // refund amount	
			
	/**
	* Calling RefundTransaction() method in ipayExpAPI
	*/
	$ipay= new MyIpay();
	$httpParsedResponseAr = $ipay->RefundTransaction();   // Extract the response details.
	$errorStatus = $httpParsedResponseAr['ERROR_CODE'];
	
	if($errorStatus == '000')
	{
		$merchRefId   = $httpParsedResponseAr['ipay_out_mer_ref_id'];
		$trnStatus   = $httpParsedResponseAr['ipay_out_txn_status'];
		$serverTime   = $httpParsedResponseAr['ipay_out_server_time'];
		$ipgTrnId   = $httpParsedResponseAr['ipay_out_ipg_txn_id'];
		$failReson   = $httpParsedResponseAr['ipay_out_fail_reason'];
		$refund_amt   = $httpParsedResponseAr['ipay_out_refund_amt'];
		$masked_acc_number   = $httpParsedResponseAr['ipay_out_masked_acc_number'];
		$bank_ref_id   = $httpParsedResponseAr['ipay_out_bank_ref_id'];
		$auth_code = $httpParsedResponseAr['ipay_out_auth_code'];
		$card_holder_name   = $httpParsedResponseAr['ipay_out_card_holder_name'];
		$action   = $httpParsedResponseAr['ipay_out_action'];
		$cur_code   = $httpParsedResponseAr['ipay_out_cur_code'];
		$out__lang   = $httpParsedResponseAr['ipay_out_lang'];
		$orgi_ipg_txn_id = $httpParsedResponseAr['ipay_out_orgi_ipg_txn_id'];
		$orgi_txn_amt = $httpParsedResponseAr['ipay_out_orgi_txn_amt'];
		$tot_refunded_amt = $httpParsedResponseAr['ipay_out_tot_refunded_amt'];
		$orgi_auth_code = $httpParsedResponseAr['ipay_out_orgi_auth_code'];
								
		// Outputting the response
		echo  '<table class="table table-striped"><thead></thead><tbody><tr><td></td><td>Transaction Status</td><td>'.$trnStatus.'</td></tr><tr><td></td><td>IPG Transaction ID</td><td>'.$ipgTrnId.'</td></tr><tr><td></td><td>Merchant Ref ID</td><td>'.$merchRefId.'</td></tr><tr><td></td><td>Bank Ref ID</td><td>'.$bank_ref_id.'</td></tr><tr><td></td><td>Auth Code</td><td>'.$auth_code.'</td></tr><tr><td></td><td>Refund Amount</td><td>'.$refund_amt.'</td></tr><tr><td></td><td>Currency Code</td><td>'.$cur_code.'</td></tr><tr><td></td><td>Card Number</td><td>'.$masked_acc_number.'</td></tr><tr><td></td><td>Card Holder Name</td><td>'.$card_holder_name.'</td></tr><tr><td></td><td>Transaction Type</td><td>'.$action.'</td></tr><tr><td></td><td>Language Code</td><td>'.$out__lang.'</td></tr><tr><td></td><td>Server Time</td><td>'.$serverTime.'</td></tr><tr><td></td><td>Fail Reason</td><td style="width: 62%;">'.$failReson.'</td></tr><tr><td></td><td>Orig IPG Transaction ID</td><td>'.$orgi_ipg_txn_id.'</td></tr><tr><td></td><td>Orig Transaction Amount</td><td>'.$orgi_txn_amt.'</td></tr><tr><td></td><td>Total Refunded Amount</td><td>'.$tot_refunded_amt.'</td></tr><tr><td></td><td>Orig Auth Code</td><td>'.$orgi_auth_code.'</td></tr></tbody></table>~' .$trnStatus. '^';   
		
	}
	else
	{
		echo "<pre style='white-space: pre-wrap;padding: 25px;'>". $httpParsedResponseAr['ERROR_MSG']. '</pre>~' .$errorStatus. '^';
	}
		
}
?>