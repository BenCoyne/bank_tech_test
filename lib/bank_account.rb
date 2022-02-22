# frozen_string_literal: true

require 'date'
require_relative 'bank_statement'
require_relative 'insufficient_funds_error'

class BankAccount
  STARTING_BALANCE = 0
  attr_reader :balance, :transactions

  def initialize
    @balance = STARTING_BALANCE
    @transactions = []
    @statement = BankStatement.new(@transactions)
  end

  def deposit(amount)
    update_balance(amount)
    make_transaction(amount, 'credit')
  end

  def withdraw(amount)
    if insufficient_funds?(amount)
      raise InsufficientFundsError
    else
      update_balance(-amount)
      make_transaction(amount, 'debit')
    end
  end

  def print_statement
    puts @statement.statement_formatter
  end

  private

  def insufficient_funds?(amount)
    @balance - amount <= 0
  end

  def update_balance(amount)
    @balance += amount
  end

  def make_transaction(amount, transaction_type)
    @transactions << {
      date: Date.today,
      type: transaction_type,
      amount: amount,
      balance: @balance
    }
  end
end
