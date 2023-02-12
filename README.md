# Intro

This is the last exercise for this module. It will be a bit more complex but it will be fun.
For this exercise we will be building a small farm 🚜👨‍🌾

Your farm will have:
* Chickens
* Cows
* Sheep

Your chickens will lay eggs 🥚, cows produce milk 🥛 and sheep will produce wool 🧶.

# Specs
* In the lib folder create a class for each of these elements:
  * farm
  * animal
  * chicken
  * cow
  * sheep
* Your farm should be initialized with just a `name`.
* Your chicken should be initialized with a `name`.
* Your cow should be initialized with a `name`.
* Your sheep should be initialized with a `name`.

**_HINT:_** Your chicken, cow and sheep classes should be empty 😃

* A method called `produce_food!` should increment the products, depending on the instance that receives it
  * a chicken will increase the egg count by one
  * a cow will increase the amount of milk by one
  * a sheep will increase amount of wool by one

  For example:
  ```ruby
    chicken #instance of Chicken
    chicken.produce_food!
  ```
* A method called `total_food` should return one of the following depending on which instance it was called:
  * Your chicken's total egg count
  * Your cow's total milk amount
  * Your sheep's total wool amount

  For example:
  ```ruby
    chicken #instance of Chicken
    chicken.total_food
  ```
* Your farm should have a method called `add_animal` that takes one argument. This argument should be an instance of
  chicken, cow or sheep and add it to the farm.
* Your farm should have a method called `remove_animal` that takes an instance of chicken, cow or sheep. The method should remove the corresponding animal finding it by its `name` (e.g. Dolly the sheep).
* Your farm should have a method called `dump_production_to_file` that creates a `production.txt` file in the lib folder with the output of the production. For example:

```
Chickens eggs count -- 10
Cows milk amount -- 15
Sheep wool amount -- 50
```

## Optional challenge
It would be nice to have a small terminal app where we can create and manage our farm by running `ruby ./lib/interface.rb` in our terminal.

First, create a file named `lib/interface.rb`.
In this file you should:
* Greet the user
* Ask the user which action they want to make:
  * Create a farm
  * Quit
* When a farm is created:
  * Allow the user to perform an operation:
    * Add a new animal
    * Remove an existing animal
    * Generate a nice report about the current farm's output.
    * Wait for one day, one week or one month for the production of the farm to increase:
      * A chicken takes one day to produce one egg
      * A cow takes one week to produce one unit of milk
      * A sheep takes one month to produce one unit of wool

For example, if the user chooses to wait 3 weeks the farm will produce 21 eggs 🥚, 3 units of milk 🥛 but 0 units of wool 🧶.

Again, this part of the challenge is optional and it's not covered by tests. Once you're done contact your coach to show what you've done 🎉
