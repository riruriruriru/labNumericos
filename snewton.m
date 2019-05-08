function [xxs,ffs,ers]=snewton(f,jacob,xsmenos1,met,maxiter,p,tol)
if nargin<7
   tol=1e-5;
   if nargin<6
      p=2;
   end;
   if nargin<5
      maxiter=10;
   end;
   if nargin<4
      met='divizqda';
   end;
end;
xxs=xsmenos1;
ffs=[];
ers=NaN;
error=Inf;
iteraciones=0;
while (iteraciones<maxiter)&(error>tol)
   fxsmenos1=feval(f,xsmenos1);
   ffs=[ffs;fxsmenos1'];
   if strcmp(lower(met),'divizqda')
      Jfxsmenos1=feval(jacob,xsmenos1);
      xs=xsmenos1-Jfxsmenos1\fxsmenos1;
   else
      [dinf,dpri,dsup]=feval(jacob,xsmenos1);
      xs=xsmenos1-feval(met,dinf,dpri,dsup,fxsmenos1);
   end;
   xxs=[xxs;xs'];
   error=norm(xs-xsmenos1,p);
   ers=[ers;error];
   if error<tol
      ffs=[ffs;feval(f,xs)'];
   end;
   xsmenos1=xs;
   iteraciones=iteraciones+1;
end;
if iteraciones==maxiter
   disp('Se ha llegado al numero maximo de iteraciones');
end;