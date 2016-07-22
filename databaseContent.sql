delete from News;
delete from Classified;
delete from User_Role;
delete from Role;
delete from User;
delete from Section;
insert into Role values(1, "ROLE_ADMIN");
insert into Role values(2, "ROLE_JOURNALIST");
insert into Role values(3, "ROLE_EDITOR");
insert into Role values(4, "ROLE_READER");

insert into User values(1, "nath@gmail.com", "Nathalia Ferreira", "$2a$06$2IzGpTB2rrzjcI3OwH0DoOULQnuSJHA1HBjcvtaTDU1DXwUPbvdYm");
insert into User values(2, "journalist@gmail.com", "Nathalia Ferreira", "$2a$06$2IzGpTB2rrzjcI3OwH0DoOULQnuSJHA1HBjcvtaTDU1DXwUPbvdYm");
insert into User values(3, "editor@gmail.com", "Nathalia Ferreira", "$2a$06$2IzGpTB2rrzjcI3OwH0DoOULQnuSJHA1HBjcvtaTDU1DXwUPbvdYm");
insert into User values(4, "reader@gmail.com", "Nathalia Ferreira", "$2a$06$2IzGpTB2rrzjcI3OwH0DoOULQnuSJHA1HBjcvtaTDU1DXwUPbvdYm");

insert into User_Role values(1, 1);
insert into User_Role values(2, 2);
insert into User_Role values(3, 3);
insert into User_Role values(4, 4);

insert into Section values(1, "Veja as notícias mais quentes sobre Esporte", "Esporte");
insert into Section values(2, "Veja as notícias mais quentes sobre Famosos", "Famosos");
insert into Section values(3, "Veja as notícias mais quentes sobre Política", "Política");
insert into Section values(4, "Veja as notícias mais quentes sobre Educação", "Educação");
insert into Section values(5, "Veja as notícias mais quentes sobre Filmes", "Filmes");

insert into News values(1, "1994-03-11", "Nasce uma pessoa muito importante!", "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "Nasce Mito!", 2, 2);
insert into News values(2, "2016-07-20", "Nathalia passa em APS, acredite se quiser!", "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "Nasce Mito!", 2, 3);
insert into News values(3, "2016-07-21", "O Mundo vai acabar e ela so pensa em dançar!", "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "Nasce Mito!", 2, 4);
insert into News values(4, "2016-07-22", "Eu só digo uma coisa: eu num digué nada!", "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "Nasce Mito!", 2, 4);
insert into News values(5, "2016-07-23", "A melhor coisa do mundo é você ter dinheiro!", "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", "Nasce Mito!", 2, 2);

insert into Classified values(1, 10.50, "2016-07-21", "+55 (88) 99426 3541", 20.0, "Vendo cadeira que um amigo esqueceu aqui. A bixa é da boa.", "Vendo cadeira", 1);
insert into Classified values(2, 10.50, "2016-07-21", "+55 (88) 99426 3541", 20.0, "Vendo cadeira que um amigo esqueceu aqui. A bixa é da boa.", "Vendo cadeira", 1);
insert into Classified values(3, 10.50, "2016-07-21", "+55 (88) 99426 3541", 20.0, "Vendo cadeira que um amigo esqueceu aqui. A bixa é da boa.", "Vendo cadeira", 1);
insert into Classified values(4, 10.50, "2016-07-21", "+55 (88) 99426 3541", 20.0, "Vendo cadeira que um amigo esqueceu aqui. A bixa é da boa.", "Vendo cadeira", 1);
insert into Classified values(5, 10.50, "2016-07-21", "+55 (88) 99426 3541", 20.0, "Vendo cadeira que um amigo esqueceu aqui. A bixa é da boa.", "Vendo cadeira", 1);
insert into Classified values(6, 10.50, "2016-07-21", "+55 (88) 99426 3541", 20.0, "Vendo cadeira que um amigo esqueceu aqui. A bixa é da boa.", "Vendo cadeira", 1);

select * from User;


