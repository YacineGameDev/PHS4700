function [Touche tf blocf ballef ]=Devoir3(bloci,ballei,tl)  ## TODO REMOVE sim_num from params    addpath ("./outils");    dt = 0.001;  Touche = -1;    posBloc = bloci(1,:);  vitBloc = bloci(2,:)';  wBloc = bloci(3,:);  mBloc = 0.58;    posBalle = ballei(1,:);  vitBalle = ballei(2,:)';  mBalle = 0.07;  rBalle = 0.02;      t = 0;    pos_sommets = {               [3.9700, 3.9700, 0.97000],                [4.0300, 3.9700, 0.97000],               [3.9700, 4.0300, 0.97000],               [4.0300, 4.0300, 0.97000],               [3.9700, 3.9700, 1.03000],               [4.0300, 3.9700, 1.03000],               [3.9700, 4.0300, 1.03000],               [4.0300, 4.0300, 1.03000]               };                 res_sommets = [pos_sommets];  res_balle = [posBalle];   bloc_faces = {[1,2,3], [1,3,5], [2,4,6], [5,6,7], [1,2,5],[3,4,7]};    if tl == 0.1 || tl == 0.6    epsilon = 0;  else    epsilon = 0.000001;  end   while(Touche == -1)    while ((t + dt) > tl )&& abs(t-tl)<epsilon      dt = dt /10;    end    vitBloc = RungeKutta(vitBloc,dt,mBloc,@AccBloc);        if t >= tl      vitBalle = RungeKutta(vitBalle,dt,mBalle,@AccBalle);        posBalle = posBalle + vitBalle'*dt;    end        # centre de masse    posBloc = posBloc + vitBloc'*dt;        for i=1:8      pos_sommets{i} = pos_sommets{i} + vitBloc'*dt;    end    # quaternion       t = t + dt;        if norm(wBloc) != 0                u = wBloc/norm(wBloc);        theta = norm(wBloc) * t;                for i=1:8              pos_sommets{i} = pos_sommets{i} - posBloc;          pos_sommets{i} = QARotation(pos_sommets{i},theta,u);        end        previous_pos_bloc = posBloc;        posBloc = [0,0,0];        posBloc = QARotation(posBloc,theta,u);        posBloc = posBloc + previous_pos_bloc;                for i=1:8          pos_sommets{i} = pos_sommets{i} + posBloc;        endfor    end            res_sommets = [res_sommets,pos_sommets];    res_balle = [res_balle; posBalle];    [Touche, intersect_point] = VerifierConditions(pos_sommets,posBloc,posBalle);      end    tf= t;  blocf = bloci;  blocf(1,:) = posBloc;  blocf(2,:) = vitBloc;  blocf(3,:) = wBloc;    ballef = ballei;  ballef(1,:) = posBalle;  ballef(2,:) = vitBalle;    if Touche == 0        [blocf(2,:) blocf(3,:) ballef(2,:)] = ApresCollision(intersect_point,posBalle,vitBalle,posBloc,vitBloc,wBloc);   endif     # PlotGraph(res_sommets,res_balle);  
endfunctionfunction [a] = AccBalle(vitesse,m)    gravite = [0,0,-9.8]';    Sbloc = pi * (0.02)^2;  k = 1;    friction = - k*Sbloc*vitesse;    a = gravite + (friction / m );  endfunctionfunction [a] = AccBloc(vitesse,m)    gravite = [0,0,-9.8]';    Sbloc = 1.2 * (0.06)^2;  k = 1;    friction = - k*Sbloc*vitesse;    a = gravite + (friction/m) ;  endfunction  function [vitesse] = RungeKutta ( v, dt, m, fnc )     k1 = feval(fnc , v , m ) ;  k2 = feval(fnc , v + (k1*dt/2) , m) ;  k3 = feval(fnc , v + (k2*dt/2) , m) ;  k4 = feval(fnc , v + (k3*dt) , m) ;  vitesse = v + (( k1 + 2*k2 + 2*k3 + k4 )*(dt/6));  endfunction
