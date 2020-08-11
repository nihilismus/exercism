setup:
	gem install minitest
	gem install minitest-reporters

run:
	ruby isogram.rb

test:
	ruby -I . -r test_helper isogram_test.rb

.PHONY: setup run test

.DEFAULT_GOAL := test
