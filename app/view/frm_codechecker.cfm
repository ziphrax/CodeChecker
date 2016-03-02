<!DOCTYPE html>
<html lang="en" itemscope itemtype="http://schema.org/Product">
	<head>
		<title>CodeChecker</title>
		<link rel="stylesheet" type="text/css" href="../assets/css/_tables.css" />
		<link rel="stylesheet" type="text/css" href="../assets/css/default.css" />
		<link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap-theme.min.css" />
	</head>
	<body>
		<cfoutput>
			<div class="container">
				<h3>Code Checker Form</h3>
				<div class="row">
					<div class="col-xs-12 col-sm-7">
						<form id="frmCodeChecker" name="frmCodeChecker" method="post" action="../model/act_codechecker.cfm" class="form-horzontal">

							<div class="row">
								<div class="col-xs-12">
									<div class="form-group">
										<label for="txaCheckFiles" class="col-xs-12 col-sm-3 control-label">Files:</label>
										<div class="col-xs-12 col-sm-9">
											<textarea id="txaCheckFiles" name="txaCheckFiles" class="form-control" rows="10"><cfif structKeyExists(session,"formdata") and structKeyExists(session.formdata,"txaCheckFiles") and len(trim(session.formdata.txaCheckFiles))>#session.formdata.txaCheckFiles#</cfif></textarea>
										</div>
									</div>

									<div class="col-xs-12 col-sm-offset-8 col-sm-4" style="margin-top:15px;">
										<input type="button" id="btnSubmit" name="btnSubmit" value="Submit" onclick="this.form.submit();" class="btn btn-primary btn-block"/>
									</div>

								</div>
							</div>
						</form>
					</div>
					<div class="col-xs-12 col-sm-5">
						<div class="well">
							<h3>How to use</h3>
							<p class="text-justify">The files list should be separated by a carriage return.</p>
						</div>
					</div>
				</div>
			</div>
		</cfoutput>
		<script type="text/javascript" src="../bower_components/jquery/dist/jquery.min.js"></script>
		<script type="text/javascript" src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../assets/js/main.js"></script>
	</body>
</html>
