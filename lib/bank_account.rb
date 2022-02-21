# frozen_string_literal: true

require 'date'
require_relative 'bank_statement'

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
    update_balance(-amount)
    make_transaction(amount, 'debit')
  end

  def print_statement
    puts @statement.print_statement
  end

  private

  def update_balance(amount)
    @balance += amount
  end

  def make_transaction(amount, transaction_type)
    @transactions << { date: Date.today, type: transaction_type, amount: amount, balance: @balance }
  end
end
