# frozen_string_literal: true
require 'bank_account'

describe BankAccount do
  subject(:account) { described_class.new }

  let(:statement) { 
    "date || credit || debit || balance\n
    #{Date.today} || || 500.00 || 2500.00\n
    #{Date.today} || 2000.00 || || 3000.00\n
    #{Date.today} || 1000.00 || || 1000.00\n" 
  }

  it 'creates an instance of bank_account' do
    expect(account).to be_a(BankAccount)
  end

  describe '#balance' do
    it 'has an initial balance of 0' do
      expect(account.balance).to eq(0)
    end
  end

  describe '#deposit' do
    it 'increases the balance' do
      account.deposit(100)
      expect(account.balance).to eq(100)
    end
  end

  describe '#withdraw' do
    it 'decreases the balance' do
      account.deposit(100)
      account.withdraw(10)
      expect(account.balance).to eq(90)
    end
  end

  describe '#transactions' do
    it 'returns an array of transaction hashes' do
      account.deposit(100)
      expect(account.transactions).to eq([{ date: Date.today.to_s, type: 'credit', amount: 100, balance: 100 }])
    end

    it 'can contain multiple transactions hashes' do
      account.deposit(100)
      account.withdraw(10)
      expect(account.transactions).to eq(
        [
          { date: Date.today.to_s, type: 'credit', amount: 100, balance: 100 },
          { date: Date.today.to_s, type: 'debit', amount: 10, balance: 90 }
        ]
      )
    end
  end

  describe '#print_statement' do
    it 'returns a formatted statement showing the various transactions' do
      expect(account.print_statement).to eq(statement)
    end
  end
end
