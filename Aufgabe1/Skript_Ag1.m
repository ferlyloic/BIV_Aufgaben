%% Gruppe N :
% 1527985   Donkeng, Ferly Loic    IMB
% 
% 1611148   Warsame, Ahmed    IB


%% BIV-�bung 1
%% Einf�hrung in MATLAB

%% 1 Arbeiten mit Vektoren und Matrizen
% Probieren Sie die folgenden Befehle nacheinander (!) aus und vollziehen Sie die Ergebnisse nach:
x=[ 1 2 3 4 ];
r = x';
r;
r = x*x';
r;
r = x.*x;
r;
r = [x x];
r;
M=[x;2*x];
M=[M;M];
M;
M(2,3)
M(2,:) % hier bedeutet der ":" alle Spalten
M(:,3) % hier bedeutet der ":" alle Zeilen
M(2:4,1:2) % "2:4" bedeutet "2 bis 4"
r = M>3; % vergleichen Sie die Ausgabe mit der Ausgabe der n�chsten Zeile
r;
M(M>3)
M(M>3)=17;
M;
%% 2 Farbbilder
% a) Echtfarben-Bilder werden in MATLAB als dreidimensionale Matrix behandelt, wobei die letzte Dimension f�r die Farbkan�le steht. Hilfe zu den angegebenen Funktionen k�nnen Sie durch den Befehl doc <Funktionsname> aufrufen oder einfach durch Positionieren des Cursors auf dem Befehl und dr�cken von F1. Laden Sie das Bild moewex.jpg mit dem Befehl moewe=imread('moewex.jpg');.
moewe = imread('moewex.jpg');
%%
% * oeffnen Sie ein neues Fenster mit figure und zeigen Sie das Bild mit imshow an.
figure
imshow(moewe)
%%
% * Rufen Sie die Funktion size auf dem Bild auf und vollziehen Sie die R�ckgabe nach. Die Angaben finden Sie auch im Workspace Fenster (�blicherweise rechts oben).
size(moewe)
%%  
% * Lassen Sie sich vier Bilder in folgender Reihenfolge anzeigen: Erste Zeile: Farbbild, Rot-Kanal; zweite Zeile: Gr�n-Kanal, Blau-Kanal.
moewe_red = moewe(:,:,1);
moewe_green = moewe(:,:,2);
moewe_blue = moewe(:,:,3);
showQuadView(moewe,moewe_red,moewe_green,moewe_blue)
%%  
% b) Konvertieren Sie das Bild in HSI mit dem Befehl rgb2hsi. Erzeugen Sie wiederum mit showQuadView eine vier-Bilder-Ansicht mit dem 3-Kanal-HSI-Bild als erstes und den einzelnen Kan�len in den �brigen drei Ansichten.
moewe2 = rgb2hsi(moewe);
moewe2_red = moewe2(:,:,1);
moewe2_green = moewe2(:,:,2);
moewe2_blue = moewe2(:,:,3);
showQuadView(moewe2,moewe2_red,moewe2_green,moewe2_blue)

%%   
% c) In welchem der Farbkan�le (RGB, HSI) l�sst sich die M�we besonders gut vom Hintergrund unterscheiden?
print('in HSI Kanal')
%%
% d) Benutzen Sie den "Data Cursor" (siehe Icon-Leiste des Bild-Fensters) um herauszufinden, wie die Werte innerhalb der M�we sich von denen au�erhalb unterscheiden. 
% K�nnen Sie einen Schwellwert finden, mit dem Sie die M�we vom Hintergrund (in etwa) trennen k�nnen? (Oder sogar eine Kombination der Farbkanalwerte, die dann eine gute Trennung erm�glicht?)
% Probieren Sie verschiedene Werte aus: Sie k�nnen in MATLAB auf ganzen Bildern boolsche Operationen wie ">" so durchf�hren, wie Sie es in Java bei Zahlen gewohnt sind. Das Ergebnis ist ein bin�res Bild. Lassen Sie sich das Bild anzeigen.
moewe2_binary = ((moewe2_red < 0.4) + (moewe2_green < 0.2) + (moewe2_blue < 0.3)) > 0;
figure
imshow(moewe2_binary)

%%  
% e) "Schneiden" Sie mit Hilfe des bin�ren Bild die M�we aus dem RGB-Bild aus: Im ausgeschnittenen Bild soll (m�glichst) nur die M�we zu sehen sein, alles andere soll schwarz sein. Das Bild soll also nicht kleiner werden.) Mit dem Befehl repmat(binaerbild, [1 1 3]) k�nnen Sie aus dem einen Bin�rbild ein Bin�rbild mit 3 "Farbkan�len" machen, dass Sie dann zum Ausschneiden verwenden k�nnen. Eventuell m�ssen Sie den Datentyp konvertieren: uint8(binaerbild).
moewe_muster = repmat(uint8(moewe2_binary), [1 1 3]);
moewe_only = moewe .* moewe_muster;
figure
imshow(moewe_only)
%%  
% f) Laden Sie zus�tzlich das Bild bryce.jpg. Setzen Sie die M�we in das Bild.
% Tipp: Dazu zun�chst ein "Loch" an der Stelle des M�we in das Bild schneiden.
bryce = imread('bryce.jpg');
moewe2_binary_inversed = moewe2_binary == 0;
moewe_muster2 = repmat(uint8(moewe2_binary_inversed), [1 1 3]);
background = bryce .* moewe_muster2;

figure
final = background + moewe_only;
imshow(final)
