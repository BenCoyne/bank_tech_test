# frozen_string_literal: true

require 'date'

class BankAccount
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
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

  private

  def transaction(amount, transaction_type)
    { date: Date.today, type: transaction_type, amount: amount, balance: @balance }
  end

end
