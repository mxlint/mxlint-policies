package app.mendix.domain_model.number_of_persistent_entities
import rego.v1


# Test data
entity_attr_0 = {
    "Name": "Entity1",
}

npe_entity_attr_0 = {
    "Name": "Entity1",
    "MaybeGeneralization": {
        "Persistable": false,
    }
}


twenty := numbers.range(1, 20)
entities_20 = [
    { "Name": entity_attr_0.Name }  | n := twenty[_]
]

npe_entities_20 = [
    npe_entity_attr_0 | n := twenty[_]
]

# Test cases
test_no_entities if {
	allow with input as {"Entities": null}
}

test_1_entity if {
	allow with input as {"Entities": [entity_attr_0]}
}

test_2_entities if {
	allow with input as {"Entities": [entity_attr_0, entity_attr_0]}
}

test_2_entities_npe if {
	allow with input as {"Entities": [entity_attr_0, npe_entity_attr_0]}
}

test_20_entities if {
	not allow with input as {"Entities": entities_20}
}

test_20_npe_entities if {
	allow with input as {"Entities": npe_entities_20 }
}
