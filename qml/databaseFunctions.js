function openDB() {
  // var dB = LocalStorage.openDatabaseSync(identifier,
                                         // version,
                                         // description,
                                         // estimated_size,
                                         // callback(db));
  var dB = LocalStorage.openDatabaseSync("cookingcalculator",
                                         "1.0",
                                         "Mass and weight converter.",
                                         100000);

  try {
    dB.transaction(function(tx) {
                     tx.executeSql('CREATE TABLE IF NOT EXISTS '        +
                                   'settings(comma  TEXT    NOT NULL, ' +
                                            'period TEXT    NOT NULL, ' +
                                            'places INTEGER NOT NULL, ' +
                                            'fracts BOOLEAN NOT NULL);');

                     if(tx.executeSql("SELECT * "      +
                                      "FROM settings;").rows.length == 0) {
                       tx.executeSql('INSERT INTO settings VALUES(?, ?, ' +
                                                                 '?, ?);',
                                     [",", ".", 2, 0]);

                       print('Settings table seeded.');
                     }

                     print('Settings table initialized.');
                   });

    return dB;
  } catch(err) {
    print("Error creating table in database: " + err);
  }
}

function getDbValue(col) {
  var r = null;

  try {
    db.transaction(function(tx) {
                     r = tx.executeSql("SELECT * " +
                                       "FROM settings;").rows.item(0)[col];
                   });
  } catch(err) {
    print("Error retrieving value from database: " + err);
  }

  return r;
}

function updateDbValue(col, value) {
  try {
    db.transaction(function(tx) {  // There should only be one row, all times
                     tx.executeSql('UPDATE settings ' +
                                   'SET ' + col + '=?;', [value]);
                   });
  } catch(err) {
    print("Error updating value in database.")
    print('Command sent was: UPDATE settings SET ' + col + '=\'' + value +
          '\';');
    print(err);
  }
}
