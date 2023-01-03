FROM golang as base

WORKDIR /app

COPY . .

RUN go mod init hello

RUN go build -o /main .

FROM scratch

COPY --from=base /main .

ENTRYPOINT ["./main"]