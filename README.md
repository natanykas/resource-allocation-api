Preciso criar endpoint de criar, editar, mostrar e deletar a sala.

A sala só pode ser agendada em horário comercial, de segunda a sexta, das 09:00 as 18:00.

São 4 salas que estarão disponíveis.

Projeto Resource Allocation 

Schedule
id: integer
Room: integer
Date: date
Time: time
User: user_id

User
id: integer
nome: string

Validações:

* Garantir que somente pode ser alocado as salas de 1 a 4.
* Garantir que somente pode ser alocado de segunda a sexta.
* Garantir que somente pode ser alocado das 09:00 as 18:00.
* Garantir que a sala só pode ter 1 agendamento por data/hora.
* Garantir que exista o usuário cadastrado para realizar o agendamento.

GEMS
* Rspec-rails (Teste unitário)
* Rubocop (Analisador de código - boas práticas)
* Faker (Gerador de dados genéricos utilizados nos testes)

Primeiro Teste: O projeto irá falhar.

* Criar o projeto API Rails com o crud de Agendamento e create e edit User até que o teste passe
