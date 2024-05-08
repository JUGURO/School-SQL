### SchoolSQL
Este repositório contém scripts SQL para criar e manipular um banco de dados fictício de uma escola. As etapas do projeto incluem a criação de tabelas para alunos, cursos, matrículas, disciplinas, notas e exames finais, bem como a inserção de dados e consultas complexas utilizando funções SQL.

# Etapa 1: Criação do Banco de Dados e Tabelas
mysql -u SEU_USUARIO -p SUA_SENHA < create_tables.sql

# Etapa 2: Inserção de Dados
mysql -u SEU_USUARIO -p SUA_SENHA < insert_data.sql

# Etapa 3: Consulta Simples
mysql -u SEU_USUARIO -p SUA_SENHA < simple_query.sql

# Etapa 4: Adição de Disciplinas e Notas
mysql -u SEU_USUARIO -p SUA_SENHA < add_disciplines_and_grades.sql

# Etapa 5: Adição de Exames Finais
mysql -u SEU_USUARIO -p SUA_SENHA < add_final_exams.sql

# Etapa 6: Consulta Estatísticas sobre Notas
mysql -u SEU_USUARIO -p SUA_SENHA < statistics_query.sql

## Funções Analíticas Utilizadas

O projeto faz uso de funções analíticas avançadas para análise de dados, proporcionando insights valiosos. Algumas das funções de janela incorporadas no MySQL incluem:

- `ROW_NUMBER()`: Atribui um número sequencial para cada linha dentro de uma partição de resultados.
- `OVER (PARTITION BY ...)`: Define a partição para as funções de janela, permitindo análises específicas em subconjuntos de dados.
- Outras funções analíticas, como `AVG()`, `MAX()`, e `MIN()`, são aplicadas para calcular estatísticas detalhadas sobre as notas dos alunos e exames finais.

Essas funções são fundamentais para consultas mais avançadas e análises profundas do banco de dados.
