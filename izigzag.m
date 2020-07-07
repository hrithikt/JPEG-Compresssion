function [z] = izigzag(iZ,w,h)
% IZIGZAG input : 2D matrix output : 2D matrix
% reverse zigzag sequence each row of input matrix
k = 1;
z = zeros(w,h);
for i=1:8:w
    for j=1:8:h
        P2 = iZ(k,:);
        P = [P2(1),P2(2),P2(6),P2(7),P2(15),P2(16),P2(28),P2(29);
             P2(3),P2(5),P2(8),P2(14),P2(17),P2(27),P2(30),P2(43);
             P2(4),P2(9),P2(13),P2(18),P2(26),P2(31),P2(42),P2(44);
             P2(10),P2(12),P2(19),P2(25),P2(32),P2(41),P2(45),P2(54);
             P2(11),P2(20),P2(24),P2(33),P2(40),P2(46),P2(53),P2(55);
             P2(21),P2(23),P2(34),P2(39),P2(47),P2(52),P2(56),P2(61);
             P2(22),P2(35),P2(38),P2(48),P2(51),P2(57),P2(60),P2(62);
             P2(36),P2(37),P2(49),P2(50),P2(58),P2(59),P2(63),P2(64)];
         z(i:i+7,j:j+7)=P;
         k=k+1;
    end
end
end

