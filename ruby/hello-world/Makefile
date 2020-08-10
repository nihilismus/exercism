setup:
	gem install minitest
	gem install minitest-reporters

run:
	ruby hello_world.rb

test:
	ruby -I . -r test_helper hello_world_test.rb

.PHONY: run test

.DEFAULT_GOAL := test
