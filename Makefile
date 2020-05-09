VERSION=$(shell git rev-parse --short HEAD)
all: build run

build:
	docker build -t pimba/mopidy:$(VERSION) .

run:
	docker run -ti --rm \
	  --device /dev/snd \
	  -v /etc/asound.conf:/etc/asound.conf:ro \
	  -p 6600:6600 \
	  -p 80:6680 \
	  pimba/mopidy:$(VERSION) -o mpd/hostname=0.0.0.0 -o http/hostname=0.0.0.0

push:
	docker push pimba/mopidy:$(VERSION)
