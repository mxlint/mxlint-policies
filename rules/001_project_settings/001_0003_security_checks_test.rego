package app.mendix.project_settings.security_checks_test

import data.app.mendix.project_settings.security_checks
import rego.v1

# Test cases
test_allow if {
	security_checks.allow with input as {
		"CheckSecurity": true,
		"SecurityLevel": "CheckEverything",
	}
}

test_no_allow_1 if {
	not security_checks.allow with input as {
		"CheckSecurity": false,
		"SecurityLevel": "CheckEverything",
	}
}

test_no_allow_2 if {
	not security_checks.allow with input as {
		"CheckSecurity": true,
		"SecurityLevel": "unknown",
	}
}
