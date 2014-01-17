module Hibp
  class Report

    attr_reader :breached_accounts, :clean_accounts, :failed_accounts

    def initialize
      @breached_accounts = {}
      @clean_accounts    = []
      @failed_accounts   = {}
    end

    def add_breached_account(email, pwned_websites)
      @breached_accounts[email] = pwned_websites
    end

    def add_clean_account(email)
      @clean_accounts << email
    end

    def add_failed_account(email, exception)
      @failed_accounts[email] = exception
    end
  end
end
