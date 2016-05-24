#!/bin/sh

mongo BETNET --eval 'db'

mongo BETNET --eval 'db.createUser( { user: "root", pwd: "betnet", roles: ["userAdmin"] } )'

mongo BETNET --eval 'db.createCollection("exchange",{capped: false})'

mongo BETNET --eval 'db.createCollection("sport",{capped: false})'

mongo BETNET --eval 'db.createCollection("categories",{capped: false})'

mongo BETNET --eval 'db.createCollection("events",{capped: false})'

mongo BETNET --eval 'db.createCollection("markets",{capped: false})'

mongo BETNET --eval 'db.createCollection("bets",{capped: false})'

mongo BETNET --eval 'db.getCollectionNames()'
