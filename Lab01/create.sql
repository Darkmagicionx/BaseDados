drop table if exists cursos;
drop table if exists alunos;
drop table if exists departamentos;
drop table if exists inscricoes;

drop table if exists disciplinas;
drop table if exists planoestudos;

         
create table cursos (
     cur_id integer not null primary key autoincrement,
	 cur_nome varchar(40) not null
);
		               
create table alunos (
   alu_id integer not null primary key autoincrement,
   alu_nome varchar(60) not null,
   alu_local varchar(30),
   alu_dnsc date not null,
   alu_sexo char(1) not null,
   alu_email varchar(30),
   alu_cur_id int,
   foreign key (alu_cur_id) references cursos(cur_id) 
);
		         		
create table departamentos (
    dep_id integer not null primary key autoincrement,
    dep_nome varchar(60) not null,
	dep_sigla char(3) not null
);	     
		               
create table disciplinas (
    dis_id integer not null primary key autoincrement,
    dis_nome varchar(40) not null,
    dis_creditos tinyint not null,
    dis_dep_id int,
    foreign key (dis_dep_id) references departamentos(dep_id) 
);
		        
create table planoestudos (
   pla_cur_id integer not null,
   pla_dis_id integer not null,
   pla_semestre tinyint not null,
   -- lassuncao colocou PK
   primary key (pla_cur_id, pla_dis_id)
   foreign key (pla_cur_id) references cursos(cur_id),
   foreign key (pla_dis_id) references disciplinas(dis_id)
);		
		

	
create table inscricoes (
   ins_id integer not null primary key autoincrement,
   ins_alu_id integer not null,
   ins_pla_cur_id integer not null,
   ins_pla_dis_id integer not null,
   ins_dt_inscricao date not null,
   ins_dt_avaliacao date,
   ins_nota decimal(4,2),
   foreign key (ins_alu_id) references alunos(alu_id),
   foreign key (ins_pla_cur_id,ins_pla_dis_id) references planoestudos(pla_cur_id,pla_dis_id)
   );