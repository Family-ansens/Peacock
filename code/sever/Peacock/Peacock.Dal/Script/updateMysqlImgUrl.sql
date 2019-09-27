select @oldSever:='localhost:8901',@newSever:='www.puwiremesh.com:2000';

update T_Company
set ImgPath = Replace(ImgPath,@oldSever,@newSever);

update T_System_LanguageContent
set DisplayContent = Replace(DisplayContent,@oldSever,@newSever);

update t_pro_productimg
set ImgUrl = Replace(ImgUrl,@oldSever,@newSever);

update t_pro_product
set ImgPath = Replace(ImgPath,@oldSever,@newSever);

update t_pro_exampleimg
set ImgUrl = Replace(ImgUrl,@oldSever,@newSever);

update t_pro_example
set ImgPath = Replace(ImgPath,@oldSever,@newSever);

update t_new
set ImgUrl = Replace(ImgUrl,@oldSever,@newSever);

update t_advertise
set ImgUrl = Replace(ImgUrl,@oldSever,@newSever);


select * from T_Company;
select * from T_System_LanguageContent;
select * from t_pro_productimg;
select * from t_pro_product;
select * from t_pro_exampleimg;
select * from t_pro_example;
select * from t_new;
select * from t_advertise;




