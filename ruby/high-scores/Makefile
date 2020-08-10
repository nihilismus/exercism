setup:
	gem install minitest
	gem install minitest-reporters

run:
	ruby high_scores.rb

test:
	ruby -I . -r test_helper high_scores_test.rb

.PHONY: setup run test

.DEFAULT_GOAL := test
