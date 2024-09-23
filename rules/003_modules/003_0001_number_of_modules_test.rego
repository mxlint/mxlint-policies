package app.mendix.modules.number_of_modules_test

import data.app.mendix.modules.number_of_modules
import rego.v1

# Test data
module := {
	"Name": "Module",
	"Attributes": {"FromAppStore": false},
}

thirty := numbers.range(1, 30)

modules_30 := [
module | n := thirty[_]]

# Test cases
test_empty if {
	number_of_modules.allow with input as {"Modules": null}
}

test_1_module if {
	number_of_modules.allow with input as {"Modules": [module]}
}

test_2_modules if {
	number_of_modules.allow with input as {"Modules": [module, module]}
}

test_30_modules if {
	not number_of_modules.allow with input as {"Modules": modules_30}
}
