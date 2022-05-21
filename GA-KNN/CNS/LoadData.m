function data=LoadData()

    load('cns_lable.mat')
load('cns_data.mat')
    x=cns_data';
    t=cns_lable';
    data.x=x;
    data.t=t;
    
    data.nx=size(x,1);
    data.nt=size(t,1);
    data.nSample=size(x,2);

end