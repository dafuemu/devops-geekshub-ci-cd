FROM golang:1.16-alpine

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY cmd/*.go ./
COPY pkg/api/*.go ./
COPY pkg/library/*.go ./

RUN go build -o /devops-geekshub-ci-cd

EXPOSE 8080

CMD [ "/devops-geekshub-ci-cd" ]


