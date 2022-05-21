function data=LoadData()

   load('leu_lable.mat')
load('leu_data.mat')

    x=leu_data';
    t=leu_lable';
    data.x=x;
    data.t=t;
    
    data.nx=size(x,1);
    data.nt=size(t,1);
    data.nSample=size(x,2);

end