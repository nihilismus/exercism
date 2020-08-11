setup:
	gem install minitest
	gem install minitest-reporters

run:
	ruby word_count.rb

test:
	ruby -I . -r test_helper word_count_test.rb

.PHONY: setup run test

.DEFAULT_GOAL := test
