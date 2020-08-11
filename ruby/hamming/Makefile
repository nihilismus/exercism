setup:
	gem install minitest
	gem install minitest-reporters

run:
	ruby hamming.rb

test:
	ruby -I . -r test_helper hamming_test.rb

.PHONY: setup run test

.DEFAULT_GOAL := test
