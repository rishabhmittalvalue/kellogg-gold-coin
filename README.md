# KelloggCoin Web

A web page for a small cryptocurrency's ledger: every transaction, then each user's balance.

## Getting started

1. On this repo's GitHub page, choose **Use this template**, then **Create a new repository**,
   and make the copy in your own account.
2. On your copy, choose **Code**, then **Codespaces**, then **Create codespace on main**, and
   wait for the first start to finish.
3. In the terminal, set up the database, then load the data:

       bin/rails db:setup
       bin/rails runner scripts/create_data.rb

   The second command prints `There are now 5 users and 100 transactions.` Have a look at
   `scripts/create_data.rb` to see what it creates.
4. Start the app with `bin/rails server`, leave that terminal running, and open port 3000 in
   the browser (the Codespace offers it, or find it under **Ports**). Add `/transactions` to
   the end of the address.

Then:

- Open `db/schema.rb` to see the domain model: `users`, and `transactions` with a
  `from_user_id`, a `to_user_id` and an `amount`.
- Open `config/routes.rb`: the route for `/transactions` is already there.
- Open `app/controllers/transactions_controller.rb`: the controller is already there too.
- Open `app/views/transactions/index.html.erb` and change it in the two steps below. Refresh
  the page after each change.

## Goals

### Step 1

- Create an ordered list (`ol`) with each list item (`li`) displaying the details of each of the 100 transactions
- If the transaction is anything but the "Initial Coin Offering", i.e. the `from_user` of the `Transaction` exists (you can test this condition with something like `if from_user`), then display the details of the transaction (e.g. *1557 KC from Ben to Brian*)
- If the transaction is the "Initial Coin Offering", then display it as such (e.g. *Initial coin offering: 10000 to Ben*)

### Step 2

- Display the balances for each user - the expected balances are included with the starter code
- Use a loop to iterate through each user in the `users` table -- don't hard-code -- assume that the users and associated data could change
- ActiveRecord supports the SQL aggregate `SUM` function - e.g. `Transaction.where({ "to_user_id" => 123 }).sum("amount")`

### Extra Fun

- Try using an HTML `table` element to make the output look a little nicer, with rows and columns of data instead of a text string
- An HTML `table` has, at a minimum, `<tr>` elements, representing the *table rows*; within each `<tr>`, you may have multiple `<td>` (*table data*) elements, which are the cells within each row, or `<th>` elements (*table header*) to denote the header columns in the header row. A basic example might look something like this:

```
<table>
  <tr>
    <th>Name</th>
    <th>Favorite Food</th>
  </tr>
  <tr>
    <td>Brian</td>
    <td>Tacos</td>
  </tr>
   <tr>
    <td>Ben</td>
    <td>Sushi</td>
  </tr>
</table>
```

<table>
  <tr>
    <th>Name</th>
    <th>Favorite Food</th>
  </tr>
  <tr>
    <td>Brian</td>
    <td>Tacos</td>
  </tr>
   <tr>
    <td>Ben</td>
    <td>Sushi</td>
  </tr>
</table>
