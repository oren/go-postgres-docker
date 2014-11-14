this.addUser = function (browser) {
  // randomize the user so we can run this multiple times
  var name = Math.random().toString(36).substring(7);

  browser
    .url("localhost:3000/#users")
    .setValue("#userForm input[name=name]", name)
    .click(".submit-user")
    .assert.containsText('tbody', name)
    .end();
};

this.after = function (browser) {
    // TODO: how? for now we randomize the user
    console.log("Delete Data from DB");
};
