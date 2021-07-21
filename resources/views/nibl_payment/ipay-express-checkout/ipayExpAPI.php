<?php
class MyIpay {


	
	//__________________________________________________________________________________________
    //ipay API config settings - this can be set using property file
	public $MerchantId = '405635000006507'; 
	public $Password = 'Tech@12';                                              // ipay API password
	public $Key = 'VGM0MDU2MzUwMDAwMDY1MDcxNDlmN2NlZS0xOWI5LTQxZTYtODI3Yi0wYTM3ZTkyMmIzN';                                // ipay API key
	public $Version = '1.00';                                              // API version.
	// public $API_URL = "http://localhost:8080/ipg/servlet_exppear";   // ipay end point
	public $API_URL = "https://ecom.nibl.com.np:30090/ipg/servlet_exppear";   // ipay end point
	//__________________________________________________________________________________________
	
	
	function saleTxn() 
	{
		
		$MerRefID = $_SESSION["ipay_in__mer_ref_id"];
		
		$Action = $_SESSION["ipay_in__action"];
		$TxnAmount = number_format($_SESSION["ipay_in__txn_amt"], 2);
		$currencyCode = $_SESSION["ipay_in__cur"];
		$LanguageCode = $_SESSION["ipay_in__lang"];
		$ReturnURL = $_SESSION["ipay_in__ret_url"];
		
		$MerVar1 = $_SESSION["ipay_in__mer_var1"];
		$MerVar2 = $_SESSION["ipay_in__mer_var2"];
		$MerVar3 = $_SESSION["ipay_in__mer_var3"];
		$MerVar4 = $_SESSION["ipay_in__mer_var4"];
		$sItemList = $_SESSION["ipay_in__item_list"]; 
		
		//Parameters for SetExpressCheckout, which will be sent to ipay
		$Invoice = "";
		$Invoice .= "<req>".
						"<mer_id>" . $this->MerchantId . "</mer_id>".
						"<mer_txn_id>" .$MerRefID. "</mer_txn_id>".
						"<action>" . $Action . "</action>".
				"<txn_amt>" . $TxnAmount . "</txn_amt>".
				"<cur>" . $currencyCode . "</cur>" .
				"<lang>" .$LanguageCode. "</lang>";

		if($ReturnURL != "") {
		   $Invoice .= "<ret_url>" . $ReturnURL . "</ret_url>"; 
		}

		if($MerVar1 != "") {
			$Invoice .= "<mer_var1>" .$MerVar1. "</mer_var1>";
		}

		if($MerVar2 != "") {
			$Invoice .= "<mer_var2>" .$MerVar2. "</mer_var2>";
		}

		if($MerVar3 != "") {
			$Invoice .= "<mer_var3>" .$MerVar3. "</mer_var3>";
		}

		if($MerVar4 != "") {
			$Invoice .= "<mer_var4>" .$MerVar4. "</mer_var4>";
		}
		
		if($sItemList != "") {
			$Invoice .= "<item_list>" .$sItemList. "</item_list>";
		}

		$Invoice .= "</req>";
		
		//echo '<pre>', htmlspecialchars($Invoice), '</pre>';
		//adding hash val
		$sHash = hash('sha256', $Invoice.$this->Key,false);
		
		
		$ServerParam = 'VERSION='.$this->Version.'&PWD='.$this->Password.'&MERCHANTID='.$this->MerchantId.'&KEY='.$this->Key.'&HASH='.$sHash;
		//error_log(print_r($ServerParam,true ));
		$url  = $this->API_URL;
		//$myXML = $ServerParam.'&PTINVOICE='.$Invoice;
		$myXML = $ServerParam.'&PTINVOICE='.bin2hex($Invoice);
		
		//echo '<pre>', htmlspecialchars($myXML), '</pre>';
			
		$options = array 
		(
			CURLOPT_URL            => $url,
			CURLOPT_POST           => true,
			CURLOPT_POSTFIELDS     => $myXML,
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_SSL_VERIFYPEER => false,
			CURLOPT_SSL_VERIFYHOST => false
			
		);

		$curl = curl_init();
		curl_setopt_array($curl, $options);
		$response = curl_exec($curl);
// 		echo curl_error($curl);
		curl_close($curl);
		//echo '<pre>', htmlspecialchars($response), '</pre>';
		//die;
		$myhashmap = array();
		// Extract the response details.
		
		$httpResponseAr = explode("&", $response);
		foreach($httpResponseAr as $value)
		{
		    echo $value."<br>";
		}
		die;
		
		foreach ($httpResponseAr as $i => $value) {
			$tmpAr = explode("=", $value);
			if(sizeof($tmpAr) > 1) {
				$myhashmap[strtoupper($tmpAr[0])] = $tmpAr[1];
			}
		}
		
		//echo '<pre>', htmlspecialchars('ERROR_CODE='. $myhashmap['ERROR_CODE']. '&PTRECEIPT='. $this->hextostr($myhashmap['PTRECEIPT'])), '</pre>';
		
		if (strcasecmp($myhashmap['ERROR_CODE'], '000') == 0)
		{	
			$sHash1 = hash('sha256', $myhashmap['PTRECEIPT'].$this->Key,false);
			if (true) //(strcasecmp($myhashmap['HASH'], $sHash1) == 0)
			{
				$xml = new SimpleXMLElement($this->hextostr( $myhashmap['PTRECEIPT'] ));
				$TxnUuid = (string)$xml->txn_uuid;
				$ipg_txn_id = (string)$xml->ipg_txn_id;
				
				//$TxnUuid_hex = bin2hex($TxnUuid.'|'.$this->Key); // gayan
				$TxnUuid_hex = $TxnUuid; // gayan
				
				$_SESSION["ipay_out__txn_uuid"] = $TxnUuid;
				
				
				if(0 < strlen($TxnUuid))
				{
				$myhashmap['ipay_out__txn_uuid'] = $TxnUuid_hex;
				}
				if(0 < strlen(trim($ipg_txn_id)))
				{
				$myhashmap['ipay_out__ipg_txn_id'] = $ipg_txn_id;
				}
			}	
			else
			{
				//*********IF ERROR***************	
				echo '<div style="color:red"><b>Error1 : </b></div>';
				echo '<pre>';
				echo '<h4>Hash verification failed!!</h4>';
				echo '</pre>';
				//*********IF ERROR***************
			}
		}
		else
		{
			//*********IF ERROR***************	
			echo '<div style="color:red"><b>Error2 : </b></div>';
			echo '<pre>';
			echo '<pre>', htmlspecialchars('>>'.print_r($myhashmap)), '</pre>';
			echo '</pre>';
			//*********IF ERROR***************
		}
		return $myhashmap;
	}
	
	function saleTxnGroup() 
	{
		$MerRefID = $_SESSION["ipay_in__mer_ref_id"];
		$Action = $_SESSION["ipay_in__action"];
		$TxnAmount = $_SESSION["ipay_in__txn_amt"];
		$currencyCode = $_SESSION["ipay_in__cur"];
		$LanguageCode = $_SESSION["ipay_in__lang"];
		$ReturnURL = $_SESSION["ipay_in__ret_url"];

		$MerVar1 = $_SESSION["ipay_in__mer_var1"];
		$MerVar2 = $_SESSION["ipay_in__mer_var2"];
		$MerVar3 = $_SESSION["ipay_in__mer_var3"];
		$MerVar4 = $_SESSION["ipay_in__mer_var4"];
		$sItemList = $_SESSION["ipay_in__item_list"];

		//Parameters for SetExpressCheckout, which will be sent to ipay
		$Invoice = "";
		$Invoice .= "<req>".
						"<mer_id>" . $this->MerchantId . "</mer_id>".
						"<mer_txn_id>" .$MerRefID. "</mer_txn_id>".
						"<action>" . $Action . "</action>".
				"<txn_amt>" . $TxnAmount . "</txn_amt>".
				"<cur>" . $currencyCode . "</cur>" .
				"<lang>" .$LanguageCode. "</lang>";

		if($ReturnURL != "") {
		   $Invoice .= "<ret_url>" . $ReturnURL . "</ret_url>"; 
		}

		if($MerVar1 != "") {
			$Invoice .= "<mer_var1>" .$MerVar1. "</mer_var1>";
		}

		if($MerVar2 != "") {
			$Invoice .= "<mer_var2>" .$MerVar2. "</mer_var2>";
		}

		if($MerVar3 != "") {
			$Invoice .= "<mer_var3>" .$MerVar3. "</mer_var3>";
		}

		if($MerVar4 != "") {
			$Invoice .= "<mer_var4>" .$MerVar4. "</mer_var4>";
		}
		
		if($sItemList != "") {
			$Invoice .= "<item_list>" .$sItemList. "</item_list>";
		}

		$Invoice .= "</req>";
		
		//adding hash val
		$sHashGrup = hash('sha256', $Invoice.$this->Key,false);
		
		$ServerParam = 'VERSION='.$this->Version.'&PWD='.$this->Password.'&MERCHANTID='.$this->MerchantId.'&KEY='.$this->Key.'&HASH='.$sHashGrup;
		$url  = $this->API_URL;
		//$myXML = $ServerParam.'&PTINVOICE='.$Invoice;
		$myXML = $ServerParam.'&PTINVOICE='.bin2hex($Invoice);
		//echo '<pre>', htmlspecialchars($myXML), '</pre>';
			
		$options = array 
		(
			CURLOPT_URL            => $url,
			CURLOPT_POST           => true,
			CURLOPT_POSTFIELDS     => $myXML,
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_SSL_VERIFYPEER => false,
			CURLOPT_SSL_VERIFYHOST => false
		);

		$curl = curl_init();
		curl_setopt_array($curl, $options);
		$response = curl_exec($curl);
		curl_close($curl);
		//echo '<pre>', htmlspecialchars($response), '</pre>';
		//print_r($response);

		$myhashmap = array();
		
		// Extract the response details.
		$httpResponseAr = explode("&", $response);
		
		foreach ($httpResponseAr as $i => $value) {
			$tmpAr = explode("=", $value);
			if(sizeof($tmpAr) > 1) {
				$myhashmap[strtoupper($tmpAr[0])] = $tmpAr[1];
			}
		}
		
		//echo '<pre>', htmlspecialchars('ERROR_CODE='. $myhashmap['ERROR_CODE']. '&PTRECEIPT='. $this->hextostr($myhashmap['PTRECEIPT'])), '</pre>';
				
		if (strcasecmp($myhashmap['ERROR_CODE'], '000') == 0)
		{	
			$sHash1 = hash('sha256', $myhashmap['PTRECEIPT'].$this->Key,false);
			if (true)//(strcasecmp($myhashmap['HASH'], $sHash1) == 0)
			{
				$xml = new SimpleXMLElement($this->hextostr( $myhashmap['PTRECEIPT'] ));
				$TxnUuid = (string)$xml->txn_uuid;
				$ipg_txn_id = (string)$xml->ipg_txn_id;
				$mer_txn_id = (string)$xml->mer_txn_id;
				
				$TxnUuid_hex = bin2hex($TxnUuid.'|'.$this->Key);
				//$TxnUuid_hex = $TxnUuid; // gayan
				
				$_SESSION["ipay_out__txn_uuid"] = $TxnUuid;
				
				if(0 < sizeof($TxnUuid))
				{
				$myhashmap['ipay_out__txn_uuid'] = $TxnUuid_hex;
				}
				if(0 < sizeof($ipg_txn_id))
				{
				$myhashmap['ipay_out__ipg_txn_id'] = $ipg_txn_id;
				}
				if(0 < sizeof($mer_txn_id))
				{
				$myhashmap['ipay_out__mer_ref_id'] = $mer_txn_id;
				}
			}	
			else
			{
				//*********IF ERROR***************	
				echo '<div style="color:red"><b>Error1 : </b></div>';
				echo '<pre>';
				echo '<h4>Hash verification failed!!</h4>';
				echo '</pre>';
				//*********IF ERROR***************
			}
		}
		else
		{
			//*********IF ERROR***************	
			echo '<div style="color:red"><b>Error2 : </b></div>';
			echo '<pre>';
			echo '<pre>', htmlspecialchars('>>'.print_r($myhashmap)), '</pre>';
			echo '</pre>';
			//*********IF ERROR***************
		}
		

		return $myhashmap;
	}	
	
	
	
	function saleTxnVerify() 
	{
		$MerRefID = $_SESSION["ipay_in__mer_ref_id"];
		$Action = $_SESSION["ipay_in__action"];
		$TxnUUID = $_SESSION["ipay_out__txn_uuid"];
		$Action = 'saleTxnVerify';
		
		//Parameters for SetExpressCheckout, which will be sent to ipay		
		$PTInvoice = "";
		$PTInvoice .= "<req>".
						"<mer_id>" . $this->MerchantId . "</mer_id>".
						"<mer_txn_id>" .$MerRefID. "</mer_txn_id>".
						"<txn_uuid>" . $TxnUUID . "</txn_uuid>".
						"<action>" . $Action . "</action>" .
						"</req>";
		
		//adding hash val
		$sHashverify = hash('sha256', $PTInvoice.$this->Key,false);	
		
		$ServerParam = 'VERSION='.$this->Version.'&PWD='.$this->Password.'&MERCHANTID='.$this->MerchantId.'&KEY='.$this->Key.'&HASH='.$sHashverify;
		$url  = $this->API_URL;
		//$myXML = $ServerParam.'&PTINVOICE='.$PTInvoice;
		$myXML = $ServerParam.'&PTINVOICE='.bin2hex($PTInvoice);
		
		$options = array 
		(
			CURLOPT_URL            => $url,
			CURLOPT_POST           => true,
			CURLOPT_POSTFIELDS     => $myXML,
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_SSL_VERIFYPEER => false,
			CURLOPT_SSL_VERIFYHOST => false
		);

		$curl = curl_init();
		curl_setopt_array($curl, $options);
		$response = curl_exec($curl);
		curl_close($curl);

		$myhashmap = array();
		
		// Extract the response details.
		$httpResponseAr = explode("&", $response);
		
		foreach ($httpResponseAr as $i => $value) {
			$tmpAr = explode("=", $value);
			if(sizeof($tmpAr) > 1) {
				$myhashmap[strtoupper($tmpAr[0])] = $tmpAr[1];
			}
		}
		
		//echo '<pre>', htmlspecialchars('ERROR_CODE='. $myhashmap['ERROR_CODE']. '&PTRECEIPT='. $this->hextostr($myhashmap['PTRECEIPT'])), '</pre>';
		
		if (strcasecmp($myhashmap['ERROR_CODE'], '000') == 0)
		{	
			$sHash1 = hash('sha256', $myhashmap['PTRECEIPT'].$this->Key,false);
			if (true) //(strcasecmp($myhashmap['HASH'], $sHash1) == 0)
			{
				$xml = new SimpleXMLElement($this->hextostr( $myhashmap['PTRECEIPT'] ));
				$BankRefID  = (string)$xml->bank_ref_id;
				$CurrencyCode = (string)$xml->cur;
				$IPGTransactionID = (string)$xml->ipg_txn_id;
				$MerRefID = (string)$xml->mer_txn_id;
				$TxnAmount = (string)$xml->txn_amt;
				$TxnStatus = (string)$xml->txn_status;
				$ServerTime = (string)$xml->server_time;
				$MaskedAccNo = (string)$xml->acc_no;
				$LanguageCode = (string)$xml->lang;
				$MerVar1 = (string)$xml->mer_var1;
				$MerVar2 = (string)$xml->mer_var2;
				$MerVar3 = (string)$xml->mer_var3;
				$MerVar4 = (string)$xml->mer_var4;
				$CustomerName = (string)$xml->name;
				$FailReason = (string)$xml->reason;
				$AuthCode = (string)$xml->auth_code;
				
				
				$myhashmap = array();
				if(0 < sizeof((array)$BankRefID))
				{
					$myhashmap['ipay_out__bank_ref_id'] = $BankRefID;
				}
				if(0 < sizeof((array)$CurrencyCode))
				{
					$myhashmap['ipay_out__cur_code'] = $CurrencyCode;
				}
				if(0 < sizeof((array)$IPGTransactionID))
				{
					$myhashmap['ipay_out__ipg_txn_id'] = $IPGTransactionID;
				}
				if(0 < sizeof((array)$MerRefID))
				{
					$myhashmap['ipay_out__mer_ref_id'] = $MerRefID;
				}
				if(0 < sizeof((array)$TxnAmount))
				{
					$myhashmap['ipay_out__txn_amt'] = $TxnAmount;
				}
				if(0 < sizeof((array)$TxnStatus))
				{
					$myhashmap['ipay_out__txn_status'] = $TxnStatus;
				}
				if(0 < sizeof((array)$ServerTime))
				{
					$myhashmap['ipay_out__server_time'] = $ServerTime;
				}
				if(0 < sizeof((array)$MaskedAccNo))
				{
					$myhashmap['ipay_out__masked_acc_number'] = $MaskedAccNo;
				}
				if(0 < sizeof((array)$LanguageCode))
				{
					$myhashmap['ipay_out__lang'] = $LanguageCode;
				}
				if(0 < sizeof((array)$MerVar1))
				{
					$myhashmap['ipay_out__mer_var_1'] = $MerVar1;
				}
				if(0 < sizeof((array)$MerVar2))
				{
					$myhashmap['ipay_out__mer_var_2'] = $MerVar2;
				}
				if(0 < sizeof((array)$MerVar3))
				{
					$myhashmap['ipay_out__mer_var_3'] = $MerVar3;
				}
				if(0 < sizeof((array)$MerVar4))
				{
					$myhashmap['ipay_out__mer_var_4'] = $MerVar4;
				}
				if(0 < sizeof((array)$CustomerName))
				{
					$myhashmap['ipay_out__card_holder_name'] = $CustomerName;
				}
				if(0 < sizeof((array)$FailReason))
				{
					$myhashmap['ipay_out__fail_reason'] = $FailReason;
				}
				if(0 < sizeof((array)$AuthCode))
				{
					$myhashmap['ipay_out__auth_code'] = $AuthCode;
				}
			}	
			else
			{
				//*********IF ERROR***************	
				echo '<div style="color:red"><b>Error1 : </b></div>';
				echo '<pre>';
				echo '<h4>Hash verification failed!!</h4>';
				echo '</pre>';
				//*********IF ERROR***************
			}
		}
		else
		{
			//*********IF ERROR***************	
			echo '<div style="color:red"><b>Error2 : </b></div>';
			echo '<pre>';
			echo '<pre>', htmlspecialchars('>>'.print_r($myhashmap)), '</pre>';
			echo '</pre>';
			//*********IF ERROR***************
		}
		
		return $myhashmap;
	}
	
	function hextostr($hex)
	{
		$str='';
		for ($i=0; $i < strlen($hex)-1; $i+=2)
		{
		$str .= chr(hexdec($hex[$i].$hex[$i+1]));
		}
		//echo '<pre>', htmlspecialchars($str), '</pre>';
		return $str;
	}
	
	
	function RefundTransaction() 
	{
		$Action = $_SESSION["ipay_in_action"];
		$MerRefID = $_SESSION["ipay_in_mer_ref_id"];
		$IpgtxnID = $_SESSION["ipay_in_ipg_txn_id"];
		$reundAmt = $_SESSION["ipay_in_refund_amt"];
		
		
		
		$PTInvoice = "";
		$PTInvoice .= "<req>".
						"<mer_id>" . $this->MerchantId . "</mer_id>".
						"<mer_txn_id>" .$MerRefID. "</mer_txn_id>".
						"<ipg_txn_id>" .$IpgtxnID. "</ipg_txn_id>".
						"<refund_amt>" . $reundAmt . "</refund_amt>".
						"<action>" . $Action . "</action>";						


		$PTInvoice .= "</req>";
		
		
		//adding hash val
		$sHashGrup = hash('sha256', $PTInvoice.$this->Key,false);
		
		$ServerParam = 'VERSION='.$this->Version.'&PWD='.$this->Password.'&MERCHANTID='.$this->MerchantId.'&KEY='.$this->Key.'&HASH='.$sHashGrup;
		$url  = $this->API_URL;
		$myXML = $ServerParam.'&PTINVOICE='.bin2hex($PTInvoice);
		
		$options = array 
		(
			CURLOPT_URL            => $url,
			CURLOPT_POST           => true,
			CURLOPT_POSTFIELDS     => $myXML,
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_SSL_VERIFYPEER => false
		);

		$curl = curl_init();
		curl_setopt_array($curl, $options);
		$response = curl_exec($curl);
		curl_close($curl);

		$myhashmap = array();
		
		// Extract the response details.
		$httpResponseAr = explode("&", $response);
		
		foreach ($httpResponseAr as $i => $value) {
			$tmpAr = explode("=", $value);
			if(sizeof($tmpAr) > 1) {
				$myhashmap[strtoupper($tmpAr[0])] = $tmpAr[1];
			}
		}
		echo '<pre>', htmlspecialchars('ERROR_CODE='. $myhashmap['ERROR_CODE']. '&PTRECEIPT='. $this->hextostr($myhashmap['PTRECEIPT'])), '</pre>';
		if (strcasecmp($myhashmap['ERROR_CODE'], '000') == 0)
		{	
				$xml = new SimpleXMLElement($this->hextostr( $myhashmap['PTRECEIPT'] ));
				$BankRefID  = (string)$xml->bank_ref_id;
				$CurrencyCode = (string)$xml->cur;
				$IPGTransactionID = (string)$xml->ipg_txn_id;
				$MerRefID = (string)$xml->mer_txn_id;
				$refund_amt = (string)$xml->refund_amt;
				$TxnStatus = (string)$xml->txn_status;
				$ServerTime = (string)$xml->server_time;
				$MaskedAccNo = (string)$xml->acc_no;
				$LanguageCode = (string)$xml->lang;
				$CustomerName = (string)$xml->name;
				$FailReason = (string)$xml->reason;
				$Action = (string)$xml->action;
				$auth_code = (string)$xml->auth_code;
				$orgi_ipg_txn_id = (string)$xml->orgi_ipg_txn_id;
				$orgi_txn_amt = (string)$xml->orgi_txn_amt;
				$tot_refunded_amt = (string)$xml->tot_refunded_amt;
				$orgi_auth_code = (string)$xml->orgi_auth_code;
				$MerVar1 = (string)$xml->mer_var1;
				$MerVar2 = (string)$xml->mer_var2;
				$MerVar3 = (string)$xml->mer_var3;
				$MerVar4 = (string)$xml->mer_var4;
								

				if(0 < sizeof($BankRefID))
				{
					$myhashmap['ipay_out_bank_ref_id'] = $BankRefID;
				}
				if(0 < sizeof($CurrencyCode))
				{
					$myhashmap['ipay_out_cur_code'] = $CurrencyCode;
				}
				if(0 < sizeof($IPGTransactionID))
				{
					$myhashmap['ipay_out_ipg_txn_id'] = $IPGTransactionID;
				}
				if(0 < sizeof($MerRefID))
				{
					$myhashmap['ipay_out_mer_ref_id'] = $MerRefID;
				}
				if(0 < sizeof($refund_amt))
				{
					$myhashmap['ipay_out_refund_amt'] = $refund_amt;
				}
				if(0 < sizeof($TxnStatus))
				{
					$myhashmap['ipay_out_txn_status'] = $TxnStatus;
				}
				if(0 < sizeof($ServerTime))
				{
					$myhashmap['ipay_out_server_time'] = $ServerTime;
				}
				if(0 < sizeof($MaskedAccNo))
				{
					$myhashmap['ipay_out_masked_acc_number'] = $MaskedAccNo;
				}
				if(0 < sizeof($LanguageCode))
				{
					$myhashmap['ipay_out_lang'] = $LanguageCode;
				}
				if(0 < sizeof($CustomerName))
				{
					$myhashmap['ipay_out_card_holder_name'] = $CustomerName;
				}
				if(0 < sizeof($FailReason))
				{
					$myhashmap['ipay_out_fail_reason'] = $FailReason;
				}	
				if(0 < sizeof($Action))
				{
					$myhashmap['ipay_out_action'] = $Action;
				}
				if(0 < sizeof($orgi_ipg_txn_id))
				{
					$myhashmap['ipay_out_orgi_ipg_txn_id'] = $orgi_ipg_txn_id;
				}
				if(0 < sizeof($orgi_txn_amt))
				{
					$myhashmap['ipay_out_orgi_txn_amt'] = $orgi_txn_amt;
				}
				if(0 < sizeof($tot_refunded_amt))
				{
					$myhashmap['ipay_out_tot_refunded_amt'] = $tot_refunded_amt;
				}
				if(0 < sizeof($orgi_auth_code))
				{
					$myhashmap['ipay_out_orgi_auth_code'] = $orgi_auth_code;
				}	
				if(0 < sizeof($auth_code))
				{
					$myhashmap['ipay_out_auth_code'] = $auth_code;
				}
				if(0 < sizeof($MerVar1))
				{
					$myhashmap['ipay_out_mer_var_1'] = $MerVar1;
				}
				if(0 < sizeof($MerVar2))
				{
					$myhashmap['ipay_out_mer_var_2'] = $MerVar2;
				}
				if(0 < sizeof($MerVar3))
				{
					$myhashmap['ipay_out_mer_var_3'] = $MerVar3;
				}
				if(0 < sizeof($MerVar4))
				{
					$myhashmap['ipay_out_mer_var_4'] = $MerVar4;
				}				
		}
		else
		{
			//*********IF ERROR***************	
			echo '<div style="color:red"><b>Error2 : </b></div>';
			echo '<pre>';
			echo '<pre>', htmlspecialchars('>>'.print_r($myhashmap)), '</pre>';
			echo '</pre>';
			//*********IF ERROR***************
		}
		

		return $myhashmap;
	}
	
	
	function VoidTransaction() 
	{
		$Action = $_SESSION["ipay_in_action"];
		$MerRefID = $_SESSION["ipay_in_mer_ref_id"];
		$IpgtxnID = $_SESSION["ipay_in_ipg_txn_id"];
		
		
		$PTInvoice = "";
		$PTInvoice .= "<req>".
						"<mer_id>" . $this->MerchantId . "</mer_id>".
						"<mer_txn_id>" .$MerRefID. "</mer_txn_id>".
						"<ipg_txn_id>" .$IpgtxnID. "</ipg_txn_id>".
						"<action>" . $Action . "</action>";						


		$PTInvoice .= "</req>";
		
		
		//adding hash val
		$sHashGrup = hash('sha256', $PTInvoice.$this->Key,false);
		
		$ServerParam = 'VERSION='.$this->Version.'&PWD='.$this->Password.'&MERCHANTID='.$this->MerchantId.'&KEY='.$this->Key.'&HASH='.$sHashGrup;
		$url  = $this->API_URL;
		$myXML = $ServerParam.'&PTINVOICE='.bin2hex($PTInvoice);
		
		$options = array 
		(
			CURLOPT_URL            => $url,
			CURLOPT_POST           => true,
			CURLOPT_POSTFIELDS     => $myXML,
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_SSL_VERIFYPEER => false
		);

		$curl = curl_init();
		curl_setopt_array($curl, $options);
		$response = curl_exec($curl);
		curl_close($curl);

		$myhashmap = array();
		
		// Extract the response details.
		$httpResponseAr = explode("&", $response);
		
		foreach ($httpResponseAr as $i => $value) {
			$tmpAr = explode("=", $value);
			if(sizeof($tmpAr) > 1) {
				$myhashmap[strtoupper($tmpAr[0])] = $tmpAr[1];
			}
		}
		echo '<pre>', htmlspecialchars('ERROR_CODE='. $myhashmap['ERROR_CODE']. '&PTRECEIPT='. $this->hextostr($myhashmap['PTRECEIPT'])), '</pre>';
		if (strcasecmp($myhashmap['ERROR_CODE'], '000') == 0)
		{	
				$xml = new SimpleXMLElement($this->hextostr( $myhashmap['PTRECEIPT'] ));
				$BankRefID  = (string)$xml->bank_ref_id;
				$CurrencyCode = (string)$xml->cur;
				$IPGTransactionID = (string)$xml->ipg_txn_id;
				$MerRefID = (string)$xml->mer_txn_id;
				$TxnAmount = (string)$xml->txn_amt;
				$TxnStatus = (string)$xml->txn_status;
				$ServerTime = (string)$xml->server_time;
				$MaskedAccNo = (string)$xml->acc_no;
				$LanguageCode = (string)$xml->lang;
				$CustomerName = (string)$xml->name;
				$FailReason = (string)$xml->reason;
				$Action = (string)$xml->action;
				$AuthCode = (string)$xml->auth_code;
				$MerVar1 = (string)$xml->mer_var1;
				$MerVar2 = (string)$xml->mer_var2;
				$MerVar3 = (string)$xml->mer_var3;
				$MerVar4 = (string)$xml->mer_var4;
						

				if(0 < sizeof($BankRefID))
				{
					$myhashmap['ipay_out_bank_ref_id'] = $BankRefID;
				}
				if(0 < sizeof($CurrencyCode))
				{
					$myhashmap['ipay_out_cur_code'] = $CurrencyCode;
				}
				if(0 < sizeof($IPGTransactionID))
				{
					$myhashmap['ipay_out_ipg_txn_id'] = $IPGTransactionID;
				}
				if(0 < sizeof($MerRefID))
				{
					$myhashmap['ipay_out_mer_ref_id'] = $MerRefID;
				}
				if(0 < sizeof($TxnAmount))
				{
					$myhashmap['ipay_out_txn_amt'] = $TxnAmount;
				}
				if(0 < sizeof($TxnStatus))
				{
					$myhashmap['ipay_out_txn_status'] = $TxnStatus;
				}
				if(0 < sizeof($ServerTime))
				{
					$myhashmap['ipay_out_server_time'] = $ServerTime;
				}
				if(0 < sizeof($MaskedAccNo))
				{
					$myhashmap['ipay_out_masked_acc_number'] = $MaskedAccNo;
				}
				if(0 < sizeof($LanguageCode))
				{
					$myhashmap['ipay_out_lang'] = $LanguageCode;
				}
				if(0 < sizeof($CustomerName))
				{
					$myhashmap['ipay_out_card_holder_name'] = $CustomerName;
				}
				if(0 < sizeof($FailReason))
				{
					$myhashmap['ipay_out_fail_reason'] = $FailReason;
				}	
				if(0 < sizeof($Action))
				{
					$myhashmap['ipay_out_action'] = $Action;
				}
				if(0 < sizeof($AuthCode))
				{
					$myhashmap['ipay_out_auth_code'] = $AuthCode;
				}
				if(0 < sizeof($MerVar1))
				{
					$myhashmap['ipay_out_mer_var_1'] = $MerVar1;
				}
				if(0 < sizeof($MerVar2))
				{
					$myhashmap['ipay_out_mer_var_2'] = $MerVar2;
				}
				if(0 < sizeof($MerVar3))
				{
					$myhashmap['ipay_out_mer_var_3'] = $MerVar3;
				}
				if(0 < sizeof($MerVar4))
				{
					$myhashmap['ipay_out_mer_var_4'] = $MerVar4;
				}				
		}
		else
		{
			//*********IF ERROR***************	
			echo '<div style="color:red"><b>Error2 : </b></div>';
			echo '<pre>';
			echo '<pre>', htmlspecialchars('>>'.print_r($myhashmap)), '</pre>';
			echo '</pre>';
			//*********IF ERROR***************
		}
		

		return $myhashmap;
	}
	
}
?>
