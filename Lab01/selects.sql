
1. Construa uma consulta que mostre todos os registos existentes na tabela departamentos.
.shell cls
select * from departementos;

2. Construa uma consulta que mostre apenas as colunas (nome da disciplina e o número de créditos) da tabela disciplinas.

.shell cls
select dis_nome,dis_creditos FROM disciplinas;


3. Altere a consulta anterior, usando renomeação (alias) de colunas por forma a tornar mais legível o nome das colunas.

.shell cls
select dis_nome As Nome,dis_creditos As Creditos from disciplinas;


4. Construa uma consulta que permita visualizar o email, o nome e sexo dos alunos
configurando o comando de tal forma que as colunas apresentem as designações seguintes:

.shell cls
select alu_email As Email, alu_nome As "Nome Completo", alu_sexo As Genero from alunos;

5. Construa uma consulta que permita gerar o seguinte resultado (uma única coluna). Sugestão
procure informação sobre o operador de concatenação de strings no SQLite.

select "o aluno nº " || alu_id || ' - ' alu_nome || ' esta inscrito no curso nº' || alu_cur_id || '.' as Frase from alunos;



6. Obter as localidades onde vivem os alunos

.shell cls
select alu_local As Localidade from alunos;

7. Obter as localidades onde vivem os alunos mas sem mostrar valores repetidos.
.shell cls
select DISTINCT alu_local As Localidade from alunos;


8. Para evitar a repetição de "lisboa" e "Lisboa", adapte o comando anterior de tal forma que as
localidades sejam apresentadas em maiúsculas e sem repetições (upper case).


select DISTINCT upper (alu_local) As Localidade from alunos;


9. Obter as localidades e o sexo dos alunos sem valores repetidos.

select DISTINCT alu_local,alu_sexo from alunos;

10. Obter o nome, a data de nascimento e a data do centenário de cada aluno. Sugestão:
Pesquise pela função date em SQLite.


.shell cls
select alu_nome Nome, alu_dnsc "Data Nascimento", date(alu_dnsc  ,'+100 year','+0 month','+0 day'  ) "Data Centenario" from alunos;


11. Obter a lista de disciplinas e respetivos créditos, ordenada pelo nome da disciplina.

select * from disciplinas;

select dis_nome,dis_creditos from disciplinas order by dis_nome;


Obter a lista de disciplinas e respetivos créditos, colocando no topo as disciplinas com maior
número de créditos. As disciplinas devem ser ordenadas pelo nome sempre que os seus
créditos sejam iguais.

select dis_nome nome , dis_creditos creditos from disciplinas order by dis_creditos desc, dis_nome desc; 


13. Reescreva o comando anterior mantendo a ordenação, mas sem usar na cláusula ORDER
BY qualquer nome ou renomeação(alias) das colunas.

####select dis_nome , dis_creditos from disciplinas order by dis_creditos desc, dis_nome desc; 

14. Obter a informação de todos alunos ordenada por data de nascimento (descendente).

select * from alunos ORDER by alu_dnsc DESC;

15. Obter a informação de todos alunos ordenada por sexo (descendente) e nome (ascendente).

select * from alunos ORDER by alu_sexo DESC,alu_nome asc;


16. Obter apenas os alunos do sexo feminino.

select *  from alunos where alu_sexo='F' ;

17. Obter alunos que não são do sexo feminino (isto não quer dizer que sejam do sexo masculino,
pois poderão existir registos de empresas ou indivíduos para os quais não existe informação
sobre o sexo). O resultado deve vir ordenado por nome.

