setup:
	gem install minitest
	gem install minitest-reporters

run:
	ruby raindrops.rb

test:
	ruby -I . -r test_helper raindrops_test.rb

.PHONY: setup run test

.DEFAULT_GOAL := test
