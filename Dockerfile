FROM golang:1.21.5 as build

WORKDIR /app

COPY go.mod .

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main .


FROM alpine:latest

WORKDIR /app/

COPY --from=build /app/main .

EXPOSE 4545

CMD ["./main"]