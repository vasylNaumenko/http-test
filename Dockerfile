FROM golang:1.21.5 as builder

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .

RUN go build -o main .


FROM alpine:latest

WORKDIR /root/

COPY --from=builder /app/main .

EXPOSE 4545

CMD ["./main"]