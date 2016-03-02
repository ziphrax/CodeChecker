<cfcomponent name="CodeChecker" displayname="Code Checker" output="false" hint="I provide functions for reading code lines">

	<cfset this.name = "Check Lines" />

	<cffunction name="init" access="public" output="false" returntype="any" hint="I initialize the component.">
		<cfscript>
			return this;
		</cfscript>
	</cffunction>

	<cffunction name="readLines" access="public" output="false" returntype="struct" hint="I return file lines">
		<cfargument name="path" type="string" required="true" displayname="path" hint="the path to the file to check">
		<cfargument name="from" type="numeric" required="true" displayname="from" hint="the start line index">
		<cfargument name="length" type="numeric" required="true" displayname="to" hint="the end line index">

		<cfif arguments.from - Round(arguments.length / 2) GT 0>
			<cfset arguments.from = arguments.from - Round(arguments.length / 2)>
		</cfif>

		<cfset arguments.to = arguments.from + length>

		<cfset local.result = { from = arguments.from, length = arguments.to, lines = [] }>

		<cfif from NEQ -1 >
			<cfloop file="#arguments.path#" index="line" from="#arguments.from#" to="#arguments.to#">
				<cfset ArrayAppend(local.result.lines,line)>
			</cfloop>
		</cfif>

		<cfreturn local.result>
	</cffunction>


</cfcomponent>
