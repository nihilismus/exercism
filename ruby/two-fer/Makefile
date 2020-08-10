setup:
	gem install minitest
	gem install minitest-reporters

run:
	ruby two_fer.rb

test:
	ruby -I . -r test_helper two_fer_test.rb

.PHONY: setup run test

.DEFAULT_GOAL := test
