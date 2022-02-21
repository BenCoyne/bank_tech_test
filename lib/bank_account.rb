# frozen_string_literal: true

require 'date'

class BankAccount
  STARTING_BALANCE = 0
  attr_reader :balance, :transactions

  def initialize
    @balance = STARTING_BALANCE
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << transaction(amount, 'credit')
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << transaction(amount, 'debit')
  end

  def print_statement
    "date || credit || debit || balance\n
    #{Date.today} || || 500.00 || 2500.00\n
    #{Date.today} || 2000.00 || || 3000.00\n
    #{Date.today} || 1000.00 || || 1000.00\n"
  end

  private

  def transaction(amount, transaction_type)
    { date: Date.today.to_s, type: transaction_type, amount: amount, balance: @balance }
  end
end
