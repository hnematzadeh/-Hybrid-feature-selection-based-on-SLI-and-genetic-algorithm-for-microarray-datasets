function data=LoadData()

   load('GLI_lable.mat')
load('GLI_data.mat')
    x=GLI_data';
    t=GLI_lable';
    data.x=x;
    data.t=t;
    
    data.nx=size(x,1);
    data.nt=size(t,1);
    data.nSample=size(x,2);

end