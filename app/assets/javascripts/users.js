var type;
$(document).ready(function() {
  type = $("#user_type option:selected").text();
  if(type === "Seller"){
    seller();
  };
  $("#user_type").change(function() {
    // Getting the option selected
    type = $("#user_type option:selected").text();

    if(type == "Buyer"){
      console.log("Buyer");
      $(".account").remove();
    }
    else if(type === "Seller"){   
      seller();
    };
  });
});


//Creating the seller's bank account fields
function seller(){
  console.log(type);
  // Getting the form-group of user type
  var userType = $(".type");

  // Bank account country
  // Bank account country container
  var bankAccountCountryDiv = $("<div>");
  bankAccountCountryDiv.attr("class","form-group account");

  //Create the label element
  var bankAccountCountryLabel = $("<label>").text("Account Country").attr({
    for: 'user_bank_account_country'
  });
  //Create the input element
  var bankAccountCountryTextField = $('<input type="text">').attr({
    id: 'user_bank_account_country', class: 'form-control country', autofocus: "autofocus",
    "data-stripe": "country",name: "user[account_country]" 
  });

  // Appending fields to the bank account number div
  bankAccountCountryDiv.html(bankAccountCountryLabel);
  bankAccountCountryDiv.append(bankAccountCountryTextField);

  userType.after(bankAccountCountryDiv);

  // Bank account number field
  // Bank account number container
  var bankAccountDiv = $("<div>");
  bankAccountDiv.attr("class","form-group account");

  //Create the label element
  var bankAccountLabel = $("<label>").text("Account Number").attr({
    for: 'user_bank_account_number'
  });
  //Create the input element
  var bankAccountTextField = $('<input type="text">').attr({
    id: 'user_bank_account_number', class: 'form-control account-number', autofocus: "autofocus", 
    "data-stripe": "account_number", name: "user[account_number]" 
  });

  // Appending fields to the bank account number div
  bankAccountDiv.html(bankAccountLabel);
  bankAccountLabel.after(bankAccountTextField);

  bankAccountCountryDiv.after(bankAccountDiv);


  // Bank account routing number
  // Bank account routing number container
  var bankAccountRoutingDiv = $("<div>");
  bankAccountRoutingDiv.attr("class","form-group account");

  //Create the label element
  var bankAccountRoutingLabel = $("<label>").text("Routing number").attr({
    for: 'user_bank_account_routing'
  });
  //Create the input element
  var bankAccountRoutingTextField = $('<input type="text">').attr({
    id: 'user_bank_account_routing', class: 'form-control routing-number', autofocus: "autofocus",
    "data-stripe": "routing_number", name: "user[account_routing]" 
  });

  // Appending fields to the bank account number div
  bankAccountRoutingDiv.html(bankAccountRoutingLabel);
  bankAccountRoutingDiv.append(bankAccountRoutingTextField);

  bankAccountDiv.after(bankAccountRoutingDiv);  
};

