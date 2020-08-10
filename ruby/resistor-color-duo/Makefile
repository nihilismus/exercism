setup:
	gem install minitest
	gem install minitest-reporters

run:
	ruby resistor_color_duo.rb

test:
	ruby -I . -r test_helper resistor_color_duo_test.rb

.PHONY: setup run test

.DEFAULT_GOAL := test
