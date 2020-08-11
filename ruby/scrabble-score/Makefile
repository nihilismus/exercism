setup:
	gem install minitest
	gem install minitest-reporters

run:
	ruby scrabble_score.rb

test:
	ruby -I . -r test_helper scrabble_score_test.rb

.PHONY: setup run test

.DEFAULT_GOAL := test
