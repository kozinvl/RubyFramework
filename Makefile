.PHONY: bbt_test

bbt_test: #run tests
	docker-compose run bbt

bbt_down: #stop tests executing
	docker-compose down