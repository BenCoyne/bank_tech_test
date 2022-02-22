# frozen_string_literal: true

require 'bank_account'

describe BankAccount do
  subject(:account) { described_class.new }

  let(:date) { Date.today.strftime('%d/%m/%Y') }

  let(:statement) do
    "date || credit || debit || balance
#{date} || || £500.00 || £2500.00
#{date} || £2000.00 || || £3000.00
#{date} || £1000.00 || || £1000.00
"
  end

  it 'creates an instance of bank_account' do
    expect(account).to be_a(BankAccount)
  end

  describe '#transactions' do
    it 'has a transactions array that starts empty' do
      expect(account.transactions).to be_an(Array)
      expect(account.transactions).to be_empty
    end
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

    context 'if the user tries to deposit a negative number' do
      it 'raises a NegativeAmountError' do
        expect { account.deposit(-10) }.to raise_error(NegativeAmountError)
      end
    end
  end

  describe '#withdraw' do
    it 'decreases the balance' do
      account.deposit(100)
      account.withdraw(10)
      expect(account.balance).to eq(90)
    end

    context 'if the balance is £0.00' do
      it 'raises a InsufficientFundsError' do
        expect { account.withdraw(10) }.to raise_error(InsufficientFundsError)
      end
    end

    context 'if the user tries to withdraw a negative number' do
      it 'raises a NegativeAmountError' do
        account.deposit(100)
        expect { account.withdraw(-1) }.to raise_error(NegativeAmountError)
      end
    end
  end

  describe '#transactions' do
    it 'returns an array of transaction hashes' do
      account.deposit(100)
      expect(account.transactions).to eq([{ date: Date.today, type: 'credit', amount: 100, balance: 100 }])
    end

    it 'can contain multiple transactions hashes' do
      account.deposit(100)
      account.withdraw(10)
      expect(account.transactions).to eq(
        [
          { date: Date.today, type: 'credit', amount: 100, balance: 100 },
          { date: Date.today, type: 'debit', amount: 10, balance: 90 }
        ]
      )
    end
  end

  describe '#print_statement' do
    it 'prints a formatted statement showing the various transactions' do
      account.deposit(1000)
      account.deposit(2000)
      account.withdraw(500)
      expect { account.print_statement }.to output(statement).to_stdout
    end
  end
end
