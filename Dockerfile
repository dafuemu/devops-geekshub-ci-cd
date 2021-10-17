FROM golang:latest AS builder
ADD . /app
WORKDIR /app
RUN cd cmd/geekshubs-library && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o /main .

FROM alpine:latest
COPY --from=builder /main ./
RUN chmod +x ./main
EXPOSE 8080
ENTRYPOINT ["./main"]



