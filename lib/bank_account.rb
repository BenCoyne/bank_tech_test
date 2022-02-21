# frozen_string_literal: true

require 'date'
require 'bank_statement'

class BankAccount
  STARTING_BALANCE = 0
  attr_reader :balance, :transactions

  def initialize
    @balance = STARTING_BALANCE
    @transactions = []
    @statement = BankStatement.new(@transactions)
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
    puts @statement.print_statement
  end

  private

  def transaction(amount, transaction_type)
    { date: Date.today, type: transaction_type, amount: amount, balance: @balance }
  end
end
