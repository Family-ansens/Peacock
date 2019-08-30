select @oldSever:='localhost:8901',@newSever:='192.168.1.107:8901';

update T_Company
set ImgPath = Replace(ImgPath,@oldSever,@newSever);

update T_System_LanguageContent
set DisplayContent = Replace(DisplayContent,@oldSever,@newSever);
