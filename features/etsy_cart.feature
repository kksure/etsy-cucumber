Feature:

  In order to show the basic cart functionality
  As a user
  I want to add and remove items from the cart

  Scenario: Item can be removed from cart

    Given the cart contains one item
    When the item is removed
    Then the cart will be empty

  Scenario: Item can be added to cart

    Given that the cart is empty
    When an item is added to the cart
    Then the cart contains that item

