.PHONY: bbt_test

#docker build -t bdd_cucumber .
#docker run -d bdd_cucumber

#up -d working in background
bbt_test: #run tests
	docker-compose build && docker-compose up --abort-on-container-exit

bbt_down: #stop tests executing
	docker-compose down

#docker exec -it <id> bash
