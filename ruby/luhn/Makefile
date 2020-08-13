setup:
	gem install minitest
	gem install minitest-reporters

run:
	ruby luhn.rb

test:
	ruby -I . -r test_helper luhn_test.rb

.PHONY: setup run test

.DEFAULT_GOAL := test
