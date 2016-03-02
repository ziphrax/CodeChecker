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
				<!---cfif ArrayLen(session.failedfiles)>
					<div class="row">
						<div class="col-xs-12">
							<h3>Files Not Found</h3>
							<cfdump var="#session.failedfiles#">
							<hr />
						</div>
					</div>
				</cfif--->
				<div class="row">
					<div class="col-xs-12">
						<div class="row">
							<div class="col-xs-12 col-sm-9">
								<h3>Code Review Results</h3>
							</div>
							<div class="col-xs-12 col-sm-3">
								<div class="pull-right" style="line-height:56px;">
									<a href="frm_codechecker.cfm">
										Back to Code Checker Form
									</a>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<div class="table-responsive">
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th class="col-xs-11">Directory</th>
												<th class="col-xs-1 text-center">## Files</th>
											</tr>
										</thead>
										<tbody>
											<cfset count=0>
											<cfloop collection="#session.results#" item="variables.directory">
												<cfset count++>
												<tr data-toggle="collapse" data-target="##accordion_#count#" class="clickable">
													<td class="col-xs-11">#variables.directory#</td>
													<td class="col-xs-1 text-center">#StructCount(session.results[variables.directory])#</td>
												</tr>
												<tr>
													<td colspan="2">
														<div class="table-responsive">
															<table id="accordion_#count#" class="table table-striped table-bordered collapse">
																<thead>
																	<tr>
																		<th>File</th>
																	</tr>
																</thead>
																<tbody>
																	<cfloop collection="#session.results[variables.directory]#" item="variables.result">
																		<tr>
																			<td>#session.results[variables.directory][variables.result][1].file#</td>
																		</tr>
																		<tr>
																			<td colspan="1">
																				<table class="table table-striped table-bordered">
																					<thead>
																						<tr>
																							<th>Rule</th>
																							<th>Message</th>
																							<th>Line Number</th>
																							<th>Category</th>
																							<th>Severity</th>
																						</tr>
																					</thead>
																					<tbody>
																						<cfloop array="#session.results[variables.directory][variables.result]#" index="row">
																							<tr>
																								<td>#row.rule#</td>
																								<td>#row.message#</td>
																								<td>#row.linenumber#</td>
																								<td>#row.category#</td>
																								<td>#row.severity#</td>
																							</tr>
																							<tr>
																								<td colspan="5">
																									<textarea name="templateContent" data-editor="xml" data-startline="#row.lines.from#" data-gutter="1" rows="15" class="editor"><cfloop array="#row.lines.lines#" index="line">#line&chr(13)&chr(10)#</cfloop></textarea>
																								</td>
																							</tr>
																						</cfloop>
																					</tbody>
																				</table>
																			</td>
																		</tr>
																	</cfloop>
																</tbody>
															</table>
														</div>
													</td>
												</tr>
											</cfloop>
										</tbody>
									</table>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12">
								<h3>Review Stats</h3>
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th class="col-xs-11">Rule</th>
											<th class="col-xs-1">Count</th>
										</tr>
									</thead>
									<tbody>
										<cfloop collection="#session.stats#" item="rule">
											<tr>
												<td class="col-xs-11">#rule#</td>
												<td class="col-xs-1">#session.stats[rule].count#</td>
											</tr>
										</cfloop>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</cfoutput>
		<script type="text/javascript" src="../bower_components/jquery/dist/jquery.min.js"></script>
		<script type="text/javascript" src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" language="javascript" src="//cdnjs.cloudflare.com/ajax/libs/ace/1.2.3/ace.js"></script>
		<script type="text/javascript">
		$(function(){
			var editor;
			$('.editor').each(function( index ) {
				var lineStart = $(this).data('startline')
				editor = ace.edit(this);
				editor.setTheme("ace/theme/monokai");
	  			editor.getSession().setMode("ace/mode/javascript");
	  			editor.setOptions({
	  			    maxLines: Infinity,
					firstLineNumber : lineStart
	  			});
				var Range = require("ace/range").Range
				editor.session.addMarker(new Range(lineStart, 0, lineStart, 1), 'ace_highlight-marker', 'fullLine');
			});
		});

		</script>
	</body>
</html>
