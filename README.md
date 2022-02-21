# User Stories 

```
As a customer 
So I can have a bank account 
I want to be able to open a bank account √

As a customer
So I can accuaretly track my transactions
I want the default amount of money to be set to 0 √

As a customer
So I can increase my account balance
I want to be able to deposit funds from my account √

As a customer
So I can receive my money
I want to be able to withdraw funds from my account  √

As a customer
So I can see an accurate representation of my transactions
I want to be able to print my account statement (date, amount, balance). 

As a customer
So I can easily ready my account balance
I want the balance to be displayed in GBP to two decimal places

As a customer
So I can better track my transactions
I want to see the most recent transaction first on the account statement.

As a customer
So I cannot deposit an invalid amount
I want to see an error message if I deposit an amount <= 0

As a customer
So I cannot withdraw funds I do not have
I want to see an error message if I withdraw an amount > my account balance

```

# Bank tech test

Today, you'll practice doing a tech test.

For most tech tests, you'll essentially have unlimited time.  This practice session is about producing the best code you can when there is a minimal time pressure.

You'll get to practice your OO design and TDD skills.

You'll work alone, and you'll also review your own code so you can practice reflecting on and improving your own work.

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or Node.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## Self-assessment

Once you have completed the challenge and feel happy with your solution, here's a form to help you reflect on the quality of your code: https://docs.google.com/forms/d/1Q-NnqVObbGLDHxlvbUfeAC7yBCf3eCjTmz6GOqC9Aeo/edit



---

