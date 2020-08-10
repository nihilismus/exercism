setup:
	gem install minitest
	gem install minitest-reporters

run:
	ruby series.rb

test:
	ruby -I . -r test_helper series_test.rb

.PHONY: setup run test

.DEFAULT_GOAL := test
