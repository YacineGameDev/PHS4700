pos_sommets = {               [2.420493848586234   1.645740772879349   1.887395544720564],                [2.480493848586233   1.645740772879349   1.887395544720564],               [2.420493848586234   1.705740772879348   1.887395544720564],               [2.480493848586233   1.705740772879348   1.887395544720564],               [2.420493848586234   1.645740772879349   1.947395544720564],               [2.480493848586233   1.645740772879349   1.947395544720564],               [2.420493848586234   1.705740772879348   1.947395544720564],               [2.480493848586233   1.705740772879348   1.947395544720564]               };                          pos_bloc = [2.450494 ,1.675741, 1.917396];pos_balle = [2.152598 ,1.461039, 1.885854];Theta = [0,0,0];v = [0,0,15];bloc_faces = {[1,2,3], [1,3,5], [2,4,6], [5,6,7], [1,2,5],[3,4,7]};scatter3(pos_bloc(1),pos_bloc(2),pos_bloc(3));hold on;scatter3(pos_balle(1),pos_balle(2),pos_balle(3));hold on;scatter3 (pos_sommets{1}(1), pos_sommets{1}(2), pos_sommets{1}(3));hold on;scatter3 (pos_sommets{2}(1), pos_sommets{2}(2), pos_sommets{2}(3));hold on;scatter3 (pos_sommets{3}(1), pos_sommets{3}(2), pos_sommets{3}(3));hold on;scatter3 (pos_sommets{4}(1), pos_sommets{4}(2), pos_sommets{4}(3));hold on;scatter3 (pos_sommets{5}(1), pos_sommets{5}(2), pos_sommets{5}(3));hold on;scatter3 (pos_sommets{6}(1), pos_sommets{6}(2), pos_sommets{6}(3));hold on;scatter3 (pos_sommets{7}(1), pos_sommets{7}(2), pos_sommets{7}(3));hold on;scatter3 (pos_sommets{8}(1), pos_sommets{8}(2), pos_sommets{8}(3));hold on;##vec = pos_sommets{2} - pos_sommets{1};##quiver3 (pos_sommets{1}(1), pos_sommets{1}(2), pos_sommets{1}(3), vec(1), vec(2), vec(3));##hold on;##vec2 = pos_sommets{3} - pos_sommets{1};##quiver3 (pos_sommets{1}(1), pos_sommets{1}(2), pos_sommets{1}(3), vec2(1), vec2(2), vec2(3));##hold on;##vec = pos_sommets{4} - pos_sommets{2};##quiver3 (pos_sommets{2}(1), pos_sommets{2}(2), pos_sommets{2}(3), vec(1), vec(2), vec(3));##hold on;##vec2 = pos_sommets{6} - pos_sommets{2};##quiver3 (pos_sommets{2}(1), pos_sommets{2}(2), pos_sommets{2}(3), vec2(1), vec2(2), vec2(3));##hold on;line_vector =  pos_bloc - pos_balle;quiver3 (pos_balle(1), pos_balle(2), pos_balle(3), line_vector(1), line_vector(2), line_vector(3));hold on;plane_vectors = [pos_sommets{1};pos_sommets{2};pos_sommets{3}];plane = createPlane(plane_vectors);drawPlane3d(plane);hold on;line = [pos_balle(1) pos_balle(2) pos_balle(3)  line_vector(1) line_vector(2) line_vector(3)];intersection_point = intersectLinePlane(line, plane);scatter3 (intersection_point(1), intersection_point(2), intersection_point(3));hold on;if  x_condition && y_condition && z_condition  d = distancePoints(pos_balle, intersection_point);  disp(d);end##p0Gauche = pos_sommets{bloc_faces{2}(1)};##v1Gauche= pos_sommets{bloc_faces{2}(2)} - pos_sommets{bloc_faces{2}(1)}; ##v2Gauche = pos_sommets{bloc_faces{2}(3)} - pos_sommets{bloc_faces{2}(1)};####p0Droite = pos_sommets{bloc_faces{3}(1)};##v1Droite= pos_sommets{bloc_faces{3}(2)} - pos_sommets{bloc_faces{3}(1)}; ##v2Droite = pos_sommets{bloc_faces{3}(3)} - pos_sommets{bloc_faces{3}(1)};##plane_vectors = [pos_sommets{2};pos_sommets{6};pos_sommets{4}];##plane = createPlane(plane_vectors);##drawPlane3d(plane);##hold on;#for j=1:6##    p0Bas = pos_sommets{bloc_faces{1}(1)};##    v1Bas= pos_sommets{bloc_faces{1}(2)} - pos_sommets{bloc_faces{1}(1)}; ##    v2Bas = pos_sommets{bloc_faces{1}(3)} - pos_sommets{bloc_faces{1}(1)};####    ##    p0Gauche = pos_sommets{bloc_faces{2}(1)};##    v1Gauche= pos_sommets{bloc_faces{2}(2)} - pos_sommets{bloc_faces{2}(1)}; ##    v2Gauche = pos_sommets{bloc_faces{2}(3)} - pos_sommets{bloc_faces{2}(1)};##    ##    p0Haut = pos_sommets{bloc_faces{4}(1)};##    v1haut = pos_sommets{bloc_faces{4}(2)} - pos_sommets{bloc_faces{4}(1)}; ##    v2haut = pos_sommets{bloc_faces{4}(3)} - pos_sommets{bloc_faces{4}(1)};##    ##    ##    p0 = pos_sommets{bloc_faces{3}(1)};##    v1 = pos_sommets{bloc_faces{3}(2)} - pos_sommets{bloc_faces{3}(1)}; ##    v2 = pos_sommets{bloc_faces{3}(3)} - pos_sommets{bloc_faces{3}(1)};####    plane_vectors = [p0;v1;v2];##    p00_vectors = [p0Bas;v1Bas;v2Bas];##    pgauche_vectors = [p0Gauche;v1Gauche;v2Gauche];##    phaut_vectors = [p0Haut;v1haut;v2haut];##    ##    ##    plane = createPlane(plane_vectors);##    drawPlane3d(plane);##    hold on;##    ##    planeHaut = createPlane(phaut_vectors);##    drawPlane3d(planeHaut);##    hold on;##    ##    planeGauche = createPlane(pgauche_vectors);##    drawPlane3d(planeGauche);##    hold on;##    ##    plane2 = createPlane(p00_vectors);##    drawPlane3d(plane2);##    hold on;##       #drawSphere([pos_balle(1) pos_balle(2) pos_balle(3) 0.2]);    #hold on;##    ylim([-5 5]);##    xlim([-5 5]);##    line_vector =  posBloc - posBalle;##    ##    line = [posBalle(1) posBalle(2) posBalle(3)  line_vector(1) line_vector(2) line_vector(3)];##    intersection_point = intersectLinePlane(line, plane);##    ##    d = distancePoints(posBalle, intersection_point);##    ##    #fprintf('distanced :  %8.6f \n',d);##    ##    if d <= rBalle##      Touche = 0;##      return;##    end   #end##if norm(v) != 0## ##  u = v/norm(v);##  theta = norm(v) * 0.001;##  posBloc = [4,4,1];##  theta = pi/2;##  disp(theta);  ##  ##  for i=1:8##    pos_sommets{i} = pos_sommets{i} - posBloc;##    pos_sommets{i} = QARotation(pos_sommets{i},theta,u);##    pos_sommets{i} = pos_sommets{i} + posBloc;##  end##  ##end##p0 = pos_sommets{bloc_faces{1}(1)};####v1 = pos_sommets{bloc_faces{1}(2)} - pos_sommets{bloc_faces{1}(1)};##v2 = pos_sommets{bloc_faces{1}(3)} - pos_sommets{bloc_faces{1}(1)};####plane = [p0 v1 v2];###drawCube([0 0 0  0.06  0 0 0], 'FaceColor', 'b');#drawCube([0 0 0  0.06  0 15 0], 'FaceColor', 'g');##drawPlane3d(plane);##  for i=1:6##  ##    p0 = pos_sommets{bloc_faces{i}(1)};####    v1 = pos_sommets{bloc_faces{i}(2)} - pos_sommets{bloc_faces{i}(1)};##    v2 = pos_sommets{bloc_faces{i}(3)} - pos_sommets{bloc_faces{i}(1)};##    ##    plane = [p0 v1 v2];##    drawCube([4 4 1  0.06  0 0 0], 'FaceColor', 'g');##    drawPlane3d(plane);