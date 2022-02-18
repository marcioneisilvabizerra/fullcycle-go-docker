#Utilizacao do Alpine para reduzir tamanho da imagem de instalacao
FROM golang:alpine as builder

#definicao do Diretorio de trabalho
WORKDIR /go/src/app

#copia de todos os arquivos para a imagem
COPY . .

#Definicao da variavel de dependencia de biblioteca para execucao do GO
RUN CGO_ENABLED=0 go build -o /app hello.go

#Utilizando uma imagem minima do Docker como camada para execucao na construcao das camadas da imagem
FROM scratch

COPY --from=builder /app /app

CMD ["/app"]