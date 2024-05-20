# Exercício de Modelagem de Banco de dados

Trabalho feito em dupla entre: [Enzo Henrico](https://github.com/EnzoHenrico) e [Caue Matheus](https://github.com/cauematheus23).

## Especificação: 

Loja de Fotografia deseja informatizar seu sistema de controle de vendas. Os seguintes
dados foram definidos pelo proprietário:
- Cliente deve posuir: Código, Nome, Endereço Completo, Telefones (3 números
sendo eles: residencial, comercial e, celular).
- Se for Pessoa Física deve ter: RG, CPF, Data Nascimento, Sexo
- Se for Pessoa Jurídica deve ter: CNPJ, Insc. Estadual, Nome do Responsável
- Quando um Funcionário faz uma Venda para um Cliente, deve-se levar em conta:
Número, Data, Valor da Venda, Condição de Pagamento, e os itens da venda
- Funcionário deve ter armazenado: Código, Nome, Endereço, Telefone, Contato,
Função, Departamento
- Sobre os Produtos deve-se saber:Código, Descrição, Preço de custo, Preço de
Venda, Quantidade em Estoque, Quantidade Mínima, Tipo.

## Entidade-Relacionamento
![Alt text](./ModeloEntidadeRelacionamento.png "Modelo entidade relacionamento")

## Modelo Relacional
![Alt text](./ModeloRelacional.png "Modelo relacional")

## Criação das tabelas
As tabelas foram criadas de acordo o [Arquivo do SQL](./Fotografia.sql)
