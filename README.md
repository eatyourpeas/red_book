# red-book

A project to create a portable child health record that sits on a device (or a card), that can be passed to other devices and can interface with electronic health records if required.

The Parent Held Child Health Record ('Red Book') is given to all new parents across the UK.

It is a paper record and contains in particular 5 things

- a record of the baby's birth (weight, sex and so on)
- documentation of all childhood immunisations, especially the primary immunisations.
- child development: mostly this is just information for all parents to track their children's early developmental milestones and know any red flags
- growth charts
- a notes section particularly for health visitor and midwife teams to document visits and interventions.

## Project

This is a flutter project. The information held is in YAML format, which allows it to be parsed easily to JSON and passed to AWS S3 or similar. It forms the datastore for the child information.

### Immunisations

The immunisations FHiR and REST API from NHS Digital returns the immunisations structure held by NHS Digital.

## Dependencies

- https://github.com/nazrulworld/fhir.resources