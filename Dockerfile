FROM golang:1.23.3-alpine3.20 AS build

ENV TERM=xterm
RUN go install github.com/TypicalAM/goread@v1.7.0

FROM alpine:3.20.3

RUN apk add --no-cache ncurses

COPY --from=build /go/bin/ /bin/

ENTRYPOINT [ "/bin/goread" ]
