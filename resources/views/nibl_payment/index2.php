<?php
session_start();
include_once("ipay-express-checkout/ipayExpAPI.php");
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Sale Transaction Refund</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style>
ul.ui-autocomplete {
    z-index: 1100;
}
</style>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="bootstrap/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="bootstrap/jquery-ui.css">
<script src="bootstrap/jquery-1.10.2.js"></script>
<script src="bootstrap/jquery-ui.js"></script>
<!--script type="text/javascript" src="js/jquery-1.10.2.min.js"></script-->
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/bootstrap-waitingfor.js"></script>






	
<script type="text/javascript">
  $(function() {
	
	$( "#butz9" ).click(function(event) {
		$("#alertzRefund").hide()
		$("#alertzErrorRefund").hide()
		$("#hidez").show()
		$(".modal-footer").show()
		$("#phpValaddCard").hide()
					
	});
	
	
	
	
	
/// VOID ---------------------------------------------------
	    $( "#saleTxnVoid" ).click(function(event) {
			event.preventDefault();
			waitingDialog.show('Please wait...', {
			  dialogSize: 'sm',
			  progressType: 'info'
			});				
			$.post(  
					 "ipay-express-checkout/saleTxnVoid.php",
					 {
						 action: "VoidTransaction",
						 ipgTxnIdVoid: $("#ipgTxnIdVoid").val(), 
						 merchRefIdVoid: $("#merchRefIdVoid").val()
					 },
					 function(data) {
						waitingDialog.hide();
						var trxStatus = data.substring(data.indexOf("~")+1, data.indexOf("^"));
						var results = data.substring(0, data.indexOf("~"));
						console.log('trxStatus>>>'+trxStatus)
						if(trxStatus == 'ACCEPTED'){
							$("#alertzVoid").show("slow")
							$('#phpValVoid').html(results);
						}else{
							$("#alertzErrorVoid").show("slow")
							$('#phpValVoid').html(results);
						}
						$("#hidez").hide()
						$("#hidezSaleVoid").hide()
						$(".modal-footer").hide()
						$("#phpValVoid").show("slow")
					 }
			     );
			
		});
/// VOID ---------------------------------------------------
	
	
	
	
/// REFUND ---------------------------------------------------	
		$( "#saleTxnRefund" ).click(function(event) {
			event.preventDefault();
			waitingDialog.show('Please wait...', {
			  dialogSize: 'sm',
			  progressType: 'info'
			});				
			$.post(  
					 "ipay-express-checkout/saleTxnRefund.php",
					 {
						 action: "RefundTransaction",
						 ipgTxnIdRefund: $("#ipgTxnIdRefund").val(), 
						 merchRefIdRefund: $("#merchRefIdRefund").val(),
						 refundAmt: $("#refundAmt").val()
					 },
					 function(data) {
						waitingDialog.hide();
						var trxStatus = data.substring(data.indexOf("~")+1, data.indexOf("^"));
						var results = data.substring(0, data.indexOf("~"));
						console.log('trxStatus>>>'+trxStatus)
						if(trxStatus == 'ACCEPTED'){
							$("#alertzRefund").show("slow")
							$('#phpValRefund').html(results);
						}else{
							$("#alertzErrorRefund").show("slow")
							$('#phpValRefund').html(results);
						}
						$("#hidez").hide()
						$("#hidezSaleRefund").hide()
						$(".modal-footer").hide()
						$("#phpValRefund").show("slow")
					 }
			     );
			
		});
/// REFUND ---------------------------------------------------			
		
		
		
  });
	
  </script>
	
</head>

<body>

<div class="container">

	<div class="page-header">
		<!--<h1>Registration form <small>A Bootstrap template showing a registration form with standard fields</small></h1>-->
	</div>


	<div class="container">
		<div class="row">
			<div class="col-lg-6">
			
				<div class="form-group"> &nbsp; </div>
				<div class="form-group"> &nbsp;</div>
				
				
				<div class="form-group">
					<button id="butz9" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#txtVoid">Void Transaction</button>
				</div>
				
				<div class="form-group">
					<button id="butz9" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#txtRefund">Refund Transaction</button>
				</div>
				
				<br />
				
				
				
				
				
				<!-- SaleTxnVoid -->
				<div id="txtVoid" class="modal fade in">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h4 class="modal-title">Sale Transaction Void</h4>
							</div>
							<!-- Registration form - START -->
							<div class="container">
								<div class="row">
									<form role="form">
										<div class="col-lg-6"> 
											<div class="modal-body">
												<div id="alertzVoid" style="display: none;" class="alert alert-success alert-dismissable fade in" >
												   <button type="button" class="close" data-dismiss="alert" 
													  aria-hidden="true">
													  &times;
												   </button>
												   <h4><b>Void Success!</b></h4>
												</div>
												<div id="alertzErrorVoid" style="display: none;" class="alert alert-danger alert-dismissable fade in" >
												   <button type="button" class="close" data-dismiss="alert" 
													  aria-hidden="true">
													  &times;
												   </button>
												   <h4><b>Void Rejected!</b></h4>
												</div>
												<div id="phpValVoid" style="display: block;"></div>						   
												<div id="hidezSaleVoid">
													
													<div class="form-group">
														<!--label for="InputName">Enter Ipg Transaction ID</label-->
														<div class="input-group">
															<input type="text" class="form-control" name="ipgTxnIdVoid" id="ipgTxnIdVoid" placeholder="Enter Ipg Transaction ID" required>
															<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
														</div>
													</div>
													<div class="form-group">
														<!--label for="InputEmail">Enter Merchant Reference ID</label-->
														<div class="input-group">
															<input type="email" class="form-control" id="merchRefIdVoid" name="merchRefIdVoid" placeholder="Enter Merchant Reference ID" required>
															<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
														</div>
													</div>
													
													
												</div>		
											</div>	
											<div class="modal-footer" id="modal-footer3">
											<div class="col-xs-12 col-md-8" style="color: #777;"><small><strong><em>Note : Only authorized transactions are allowed</em></strong></small></div>
												<input type="button" name="saleTxnVoid" id="saleTxnVoid" value="Submit" class="btn btn-warning pull-right">
											</div>	
										</div>
									</form>
								</div>
							</div>
							<!-- void- END -->
						 </div>
					</div>
				</div>
				
				
				<!-- SaleTxnRefund -->
				<div id="txtRefund" class="modal fade in">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h4 class="modal-title">Sale Transaction Refund</h4>
							</div>
							<!-- Registration form - START -->
							<div class="container">
								<div class="row">
									<form role="form">
										<div class="col-lg-6"> 
											<div class="modal-body">
												<div id="alertzRefund" style="display: none;" class="alert alert-success alert-dismissable fade in" >
												   <button type="button" class="close" data-dismiss="alert" 
													  aria-hidden="true">
													  &times;
												   </button>
												   <h4><b>Refund Success!</b></h4>
												</div>
												<div id="alertzErrorRefund" style="display: none;" class="alert alert-danger alert-dismissable fade in" >
												   <button type="button" class="close" data-dismiss="alert" 
													  aria-hidden="true">
													  &times;
												   </button>
												   <h4><b>Refund Rejected!</b></h4>
												</div>
												<div id="phpValRefund" style="display: block;"></div>						   
												<div id="hidezSaleRefund">
													
													<div class="form-group">
														<!--label for="InputName">Enter Ipg Transaction ID</label-->
														<div class="input-group">
															<input type="text" class="form-control" name="ipgTxnIdRefund" id="ipgTxnIdRefund" placeholder="Enter Ipg Transaction ID" required>
															<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
														</div>
													</div>
													<div class="form-group">
														<!--label for="InputEmail">Enter Merchant Reference ID</label-->
														<div class="input-group">
															<input type="email" class="form-control" id="merchRefIdRefund" name="merchRefIdRefund" placeholder="Enter Merchant Reference ID" required>
															<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
														</div>
													</div>
													<div class="form-group">
														<!--label for="InputEmail">Enter Merchant Reference ID</label-->
														<div class="input-group">
															<input type="email" class="form-control" id="refundAmt" name="refundAmt" placeholder="Enter Refund Amount" required>
															<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
														</div>
													</div>								
												</div>	
											</div>	
											<div class="modal-footer" id="modal-footer3">
												<div class="col-xs-12 col-md-9" style="color: #777;"><small><strong><em>Note : Only settled transactions are allowed and Total refund amount should not exceed the sale transaction amount.</em></strong></small></div>
												<input type="button" name="saleTxnRefund" id="saleTxnRefund" value="Submit" class="btn btn-danger pull-right">
											</div>	
										</div>
									</form>
								</div>
							</div>
							<!-- Refund - END -->
						 </div>
					</div>
				</div>
				
			
				
			</div>
			
			
			
			<div class="col-lg-5 col-md-push-1">
				<div class="col-md-12">
					<div>
						<img src="./images/interblocks_logo.jpg" height="93">
					</div>
					
				</div>
			</div>
				
				
		</div>
	</div>			

</div>

</body>
</html>