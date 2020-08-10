setup:
	gem install minitest
	gem install minitest-reporters

run:
	ruby acronym.rb

test:
	ruby -I . -r test_helper acronym_test.rb

.PHONY: setup run test

.DEFAULT_GOAL := test
