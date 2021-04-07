<h1>Projeto Resource Allocation</h1>

Schedule
id: integer
Room: integer
Date: date
Time_Start: time
Time_End
User: user_id

User
id: integer
name: string

Validações:

<ul>
<li>Garantir que somente pode ser alocado as salas de 1 a 4.</li>
<li>Garantir que somente pode ser alocado de segunda a sexta.</li>
<li>Garantir que somente pode ser alocado das 09:00 as 18:00.</li>
<li>Garantir que a sala só pode ter 1 agendamento por data/hora.</li>
<li>Garantir que exista o usuário cadastrado para realizar o agendamento.</li>
</ul>

GEMS
* Rspec-rails
* Rubocop
* Faker
* I18n
* Byebug
* Databasecleaner
* Factory_bot_rails
* Shoulda-matchers

Testes
Models, Controllers e Request (GET, POST, PUT e DELETE)

Dependências

* Docker
* Docker-compose

Montar o ambiente
# Markdown
```
docker-compose build
```